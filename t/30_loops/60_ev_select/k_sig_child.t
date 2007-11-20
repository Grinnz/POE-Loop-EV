#!/usr/bin/perl -w
# $Id: k_sig_child.t 13 2007-11-20 00:20:27Z andyg $

use strict;
use lib qw(t/30_loops/00_base);
use Test::More;
use POSIX qw(_exit);

BEGIN {
  require 'begin_select.pm';
}

require 'k_sig_child.pm';

_exit 0 if $^O eq 'MSWin32';
CORE::exit 0;
