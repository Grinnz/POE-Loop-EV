package POE::Loop::EV_Tester_Port;

use parent 'POE::Loop::EV';

=for poe_tests

sub skip_tests {
    $ENV{LIBEV_FLAGS} = 32;
    return "EV module or port backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a port backend" if EV::backend() != 32;
}

=cut

1;
