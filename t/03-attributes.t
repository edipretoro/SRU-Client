#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use SRU::Client;

my $searcher = new_ok(
    'SRU::Client' => [
        base_url => 'http://z3950.loc.gov:7090/voyager',
        username => 'test',
        password => 's3kr3t'
    ]
);

can_ok(
    $searcher,
    qw(
          base_url
          username
          password
  ));

cmp_ok(
    $searcher->base_url,
    'eq',
    'http://z3950.loc.gov:7090/voyager',
    'Checking the "base_url" attribute'
);

cmp_ok(
    $searcher->username,
    'eq',
    'test',
    'Checking the "username" attribute'
);

cmp_ok(
    $searcher->password,
    'eq',
    's3kr3t',
    'Checking the "password" attribute'
);

done_testing( 5 );
