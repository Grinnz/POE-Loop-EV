=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 32; }
sub skip_tests {
    return "EV module with port backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a port backend" if EV::backend() != 32;
}
