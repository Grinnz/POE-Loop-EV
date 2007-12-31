$ENV{LIBEV_FLAGS} = 16;
eval 'use EV';
if ( $@ || EV::backend() != 16 ) {
  $| = 1;
  print qq(1..0 # Skip EV was not built with a devpoll backend\n);
  CORE::exit(0);
}

1;