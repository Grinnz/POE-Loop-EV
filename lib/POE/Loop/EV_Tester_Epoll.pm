package POE::Loop::EV_Tester_Epoll;

use parent 'POE::Loop::EV';

=for poe_tests

sub skip_tests {
    $ENV{LIBEV_FLAGS} = 4;
    return "EV module or epoll backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with an epoll backend" if EV::backend() != 4;
}

=cut

1;
