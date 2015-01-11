=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 4; }
sub skip_tests {
    return "EV module with epoll backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with an epoll backend" if EV::backend() != 4;
    return "Skipping test k_run_returns" if $_[0] eq 'k_run_returns';
}
