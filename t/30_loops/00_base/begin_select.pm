$ENV{LIBEV_FLAGS} = 1;
eval 'use EV';
if ($@) {
  $| = 1;
  print qq(1..0 # Skip EV was not built with a select backend\n);
  CORE::exit(0);
}

1;