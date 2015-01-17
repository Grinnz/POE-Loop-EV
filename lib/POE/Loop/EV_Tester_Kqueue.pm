=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 8; }
sub skip_tests {
    return "Author and automated testing only"
        unless $ENV{AUTHOR_TESTING} or $ENV{AUTOMATED_TESTING};
    return "EV module with kqueue backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a kqueue backend"
        if EV::backend() != EV::BACKEND_KQUEUE();
    return "wheel_readwrite test disabled for kqueue"
        if $_[0] eq 'wheel_readwrite';
    diag("Using EV with kqueue backend") if $_[0] eq '00_info';
}
