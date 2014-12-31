#!/usr/bin/perl -w

use strict;

use lib qw(/home/grinnz/perl5/lib/perl5/POE/Test/Loops);
use Test::More;
use POSIX qw(_exit);

sub skip_tests {
    $ENV{LIBEV_FLAGS} = 4;
    return "EV module or epoll backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with an epoll backend" if EV::backend() != 4;
}


BEGIN {
  if (my $why = skip_tests('k_signals')) {
    plan skip_all => $why
  }
}

# Run the tests themselves.
require 'k_signals.pm';

_exit 0 if $^O eq 'MSWin32';
CORE::exit 0;
