package POE::Loop::EV_Tester_Devpoll;

=for poe_tests

sub skip_tests {
    $ENV{LIBEV_FLAGS} = 16;
    return "EV module or devpoll backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a devpoll backend" if EV::backend() != 16;
}

=cut

1;
