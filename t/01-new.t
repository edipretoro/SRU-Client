#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use SRU::Client;

can_ok( 'SRU::Client', 'new' );

done_testing( 1 );
