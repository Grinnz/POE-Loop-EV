$ENV{LIBEV_FLAGS} = 8;
eval 'use EV';
if ($@) {
  $| = 1;
  print qq(1..0 # Skip EV was not built with a kqueue backend\n);
  CORE::exit(0);
}

1;