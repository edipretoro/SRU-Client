#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use SRU::Client;

my $searcher = new_ok(
    'SRU::Client' => [
        base_url => 'http://z3950.loc.gov:7090/voyager'
    ]
);

cmp_ok( 
    $searcher->base_url,
    'eq',
    'http://z3950.loc.gov:7090/voyager',
    'Checking the "base_url" attribute'
);

done_testing( 2 );
