=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 2; }
sub skip_tests {
    return "EV module with poll backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a poll backend" if EV::backend() != 2;
    diag("Using EV with poll backend") if shift eq '00_info';
}
