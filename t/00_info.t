use strict;
use warnings;

use Test::More tests => 3;
use_ok('EV');
use_ok('POE');
is(POE::Kernel::poe_kernel_loop(), 'POE::Loop::EV', 'Using EV event loop for POE');

my $methods = {
    EV::BACKEND_SELECT()  => 'select',
    EV::BACKEND_POLL()    => 'poll',
    EV::BACKEND_EPOLL()   => 'epoll',
    EV::BACKEND_KQUEUE()  => 'kqueue',
    EV::BACKEND_DEVPOLL() => 'devpoll',
    EV::BACKEND_PORT()    => 'port',
};

diag("Using EV $EV::VERSION with default backend ".$methods->{ EV::backend() });
