package POE::Loop::EV_Tester_Epoll;

our $VERSION = '0.07';

=for poe_tests
sub skip_tests {
    $ENV{LIBEV_FLAGS} = 4;
    return "EV module with epoll backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with an epoll backend" if EV::backend() != 4;
    return "Skipping test k_run_returns" if $_[0] eq 'k_run_returns';
}

1;
