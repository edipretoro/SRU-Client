#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use SRU::Client;

can_ok( 'SRU::Client', 'new' );

my $searcher = SRU::Client->new();
isa_ok( $searcher, 'SRU::Client' );

done_testing( 2 );
