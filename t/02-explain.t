#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use SRU::Client;

can_ok( 'SRU::Client', 'explain' );
my $searcher = new_ok(
    'SRU::Client' => [
        base_url => 'http://localhost/'
    ]
);
my $response = $searcher->explain;
isa_ok( $response, 'HASHREF' );

done_testing( 3 );
