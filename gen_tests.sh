#!/bin/sh
poe-gen-tests --dirbase t/30_loops --loop EV::Tester::Devpoll --loop EV::Tester::Epoll --loop EV::Tester::Kqueue --loop EV::Tester::Poll --loop EV::Tester::Port --loop EV::Tester::Select
