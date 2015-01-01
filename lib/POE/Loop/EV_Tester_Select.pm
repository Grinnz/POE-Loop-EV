package POE::Loop::EV_Tester_Select;

our $VERSION = '0.07';

=for poe_tests
sub skip_tests {
    $ENV{LIBEV_FLAGS} = 1;
    return "EV module with select backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a select backend" if EV::backend() != 1;
    return "Skipping test k_run_returns" if $_[0] eq 'k_run_returns';
}

1;
