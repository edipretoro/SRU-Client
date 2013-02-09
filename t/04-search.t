#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use SRU::Client;

can_ok( 'SRU::Client', 'search' );

done_testing( 1 );
