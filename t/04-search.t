#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use SRU::Client;
use Scalar::Util 'blessed';

can_ok( 'SRU::Client', 'search' );
my $searcher = new_ok(
    'SRU::Client' => [
        base_url => 'http://z3950.loc.gov:7090/voyager'
    ]
);
my $response = $searcher->search( 'dinosaur' );
isa_ok( $response, 'HASH' );
my $class = blessed( $response );
isnt( $class, 'HTTP::Response', "The object isn't a HTTP::Response");

done_testing( 4 );
