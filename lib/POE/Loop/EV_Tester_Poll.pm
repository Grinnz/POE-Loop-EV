=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 2; $ENV{POE_LOOP_USES_POLL} = 1; }
sub skip_tests {
    return "Author and automated testing only"
        unless $ENV{AUTHOR_TESTING} or $ENV{AUTOMATED_TESTING};
    return "EV module with poll backend could not be loaded: $@"
        unless eval { require EV; 1 };
    return "EV was not built with a poll backend"
        if EV::backend() != EV::BACKEND_POLL();
    diag("Using EV with poll backend") if shift eq '00_info';
    return undef;
}
