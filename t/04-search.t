#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use SRU::Client;

can_ok( 'SRU::Client', 'search' );
my $searcher = new_ok(
    'SRU::Client' => [
        base_url => 'http://localhost/'
    ]
);
my $response = $searcher->search( 'dinosaur' );
isa_ok( $response, 'HTTP::Response' );

done_testing( 3 );
