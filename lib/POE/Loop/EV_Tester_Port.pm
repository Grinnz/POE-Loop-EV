=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 32; }
sub skip_tests {
    return "Author and automated testing only"
        unless $ENV{AUTHOR_TESTING} or $ENV{AUTOMATED_TESTING};
    return "EV module with port backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a port backend"
        if EV::backend() != EV::BACKEND_PORT();
    diag("Using EV with port backend") if shift eq '00_info';
}
