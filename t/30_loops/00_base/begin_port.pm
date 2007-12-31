$ENV{LIBEV_FLAGS} = 32;
eval 'use EV';
if ( $@ || EV::backend() != 32 ) {
  $| = 1;
  print qq(1..0 # Skip EV was not built with a port backend\n);
  CORE::exit(0);
}

1;