#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use SRU::Client;

can_ok( 'SRU::Client', 'search' );
my $searcher = new_ok(
    'SRU::Client' => [
        base_url => 'http://z3950.loc.gov:7090/voyager'
    ]
);
my $response = $searcher->search( 'dinosaur' );
isa_ok( $response, 'HASH' );
isa_ok( $response, 'SRU::Client::Response::searchRetrieve' );

can_ok( $response, qw( version ) );
is( $response->version, '1.1', "checking if we got the right version" );

done_testing( 6 );
