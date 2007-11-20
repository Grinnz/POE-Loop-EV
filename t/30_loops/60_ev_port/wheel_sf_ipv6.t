#!/usr/bin/perl -w
# $Id: wheel_sf_ipv6.t 14 2007-11-20 00:30:32Z andyg $

use strict;
use lib qw(t/30_loops/00_base);
use Test::More;
use POSIX qw(_exit);

BEGIN {
  require 'begin_port.pm';
}

require 'wheel_sf_ipv6.pm';

_exit 0 if $^O eq 'MSWin32';
CORE::exit 0;
