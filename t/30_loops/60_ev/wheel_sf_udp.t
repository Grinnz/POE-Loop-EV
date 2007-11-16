#!/usr/bin/perl -w
# $Id: wheel_sf_udp.t 1 2007-11-01 21:56:51Z andyg $

use strict;
use lib qw(t/30_loops/00_base);
use Test::More;
use POSIX qw(_exit);

BEGIN {
  eval 'use EV';
  if ($@) {
    $| = 1;
    print qq(1..0 # Skip EV could not be loaded\n);
    CORE::exit(0);
  }
}

require 'wheel_sf_udp.pm';

_exit 0 if $^O eq 'MSWin32';
CORE::exit 0;
