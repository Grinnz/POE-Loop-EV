$ENV{LIBEV_FLAGS} = 4;
eval 'use EV';
if ( $@ || EV::backend() != 4 ) {
  $| = 1;
  print qq(1..0 # Skip EV was not built with an epoll backend\n);
  CORE::exit(0);
}

1;