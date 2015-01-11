=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 1; }
sub skip_tests {
    return "EV module with select backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a select backend" if EV::backend() != 1;
    return "Skipping test k_run_returns" if $_[0] eq 'k_run_returns';
}
