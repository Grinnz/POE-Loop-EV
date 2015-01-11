=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 16; }
sub skip_tests {
    return "EV module with devpoll backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a devpoll backend" if EV::backend() != 16;
    return "Skipping test k_run_returns" if $_[0] eq 'k_run_returns';
}
