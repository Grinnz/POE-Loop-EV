=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 32; }
sub skip_tests {
    return "Author and automated testing only"
        unless $ENV{AUTHOR_TESTING} or $ENV{AUTOMATED_TESTING};
    return "EV module with port backend could not be loaded: $@"
        unless eval { require EV; 1 };
    return "EV was not built with a port backend"
        if EV::backend() != EV::BACKEND_PORT();
    diag("Using EV with port backend") if $_[0] eq '00_info';
    return undef;
}
