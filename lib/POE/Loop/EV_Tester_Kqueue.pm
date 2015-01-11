=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 8; }
sub skip_tests {
    return "EV module with kqueue backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a kqueue backend" if EV::backend() != 8;
    return "Skipping test k_run_returns" if $_[0] eq 'k_run_returns';
}
