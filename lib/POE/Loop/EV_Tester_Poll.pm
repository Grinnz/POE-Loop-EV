=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 2; }
sub skip_tests {
    return "EV module with poll backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a poll backend" if EV::backend() != 2;
    return "Skipping test k_run_returns" if $_[0] eq 'k_run_returns';
}
