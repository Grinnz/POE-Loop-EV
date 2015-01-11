=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 4; }
sub skip_tests {
    return "EV module with epoll backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with an epoll backend" if EV::backend() != 4;
    diag("Using EV with epoll backend") if shift eq '00_info';
}
