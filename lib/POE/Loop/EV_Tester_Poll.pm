package POE::Loop::EV_Tester_Poll;

our $VERSION = '0.07';

=for poe_tests

sub skip_tests {
    $ENV{LIBEV_FLAGS} = 2;
    return "EV module or poll backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a poll backend" if EV::backend() != 2;
}

=cut

1;
