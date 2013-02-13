#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use SRU::Client;

my $searcher = new_ok(
    'SRU::Client' => [
        base_url => 'http://z3950.loc.gov:7090/voyager',
        charset_map => 'ISO-8859-1',
        username => 'test'
    ]
);

can_ok(
    $searcher,
    qw(
          base_url
          charset_map
          username
  ));

cmp_ok(
    $searcher->base_url,
    'eq',
    'http://z3950.loc.gov:7090/voyager',
    'Checking the "base_url" attribute'
);

cmp_ok(
    $searcher->charset_map,
    'eq',
    'ISO-8859-1',
    'Checking the "charset_map" attribute'
);

cmp_ok(
    $searcher->username,
    'eq',
    'test',
    'Checking the "username" attribute'
);

done_testing( 5 );
