#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use SRU::Client;

can_ok( 'SRU::Client', 'explain' );
my $searcher = new_ok(
    'SRU::Client' => [
        base_url => 'http://z3950.loc.gov:7090/voyager'
    ]
);
my $response = $searcher->explain;
isa_ok( $response, 'HASH' );
ok( $searcher->isa( 'HTTP::Response' ) || 0, 'The object is not a HTTP::Response' );

done_testing( 4 );
