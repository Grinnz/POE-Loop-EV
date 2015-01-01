use inc::Module::Install 1.14;

use POE::Test::Loops;

name     'POE-Loop-EV';
all_from 'lib/POE/Loop/EV.pm';

configure_requires 'POE::Test::Loops' => '1.360';
test_requires 'POE::Test::Loops'      => '1.360';
test_requires 'Test::More'            => '0.47';
requires 'POE'                        => '1.366';
requires 'EV'                         => '4.0';

############# Copied from POE's Makefile.PL

# Should we skip the network tests?

my $prompt = qq|
Some of POE's tests require a functional network.
You can skip these tests if you'd like.

Would you like to skip the network tests?|;

my $ret = "n";
if (grep /^--default$/, @ARGV) {
  print $prompt, " [n] n\n\n";
}
else {
  $ret = prompt($prompt, "n");
}

my $marker = 'run_network_tests';

if($ret =~ /^Y$/i) {
    unlink $marker if $marker;
} else {
    open(TOUCH,"+>$marker") and close TOUCH;
}

print "\n";

############# End copied stuff

POE::Test::Loops::generate( 't/30_loops', [ qw/
    EV::Tester::Devpoll EV::Tester::Epoll EV::Tester::Kqueue
    EV::Tester::Poll EV::Tester::Port EV::Tester::Select
    / ], 0 );

tests "t/*.t t/*/*/*.t";

# Rebuild README for maintainers
if ( -e 'MANIFEST.SKIP' ) {
    system("pod2text lib/POE/Loop/EV.pm > README");
}

auto_provides;
auto_install;
WriteAll;
