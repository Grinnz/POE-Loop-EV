package POE::Loop::EV_Tester_Select;

=for poe_tests

sub skip_tests {
    $ENV{LIBEV_FLAGS} = 1;
    return "EV module or select backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a select backend" if EV::backend() != 1;
}

=cut

1;
