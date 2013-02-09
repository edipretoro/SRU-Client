#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

use Project::Libs;
use SRU::Client;

my $sru_server = 'http://z3950.loc.gov:7090/voyager';
my $searcher = SRU::Client->new( base_url => $sru_server );
my $results = $searcher->search( 'dinosaur' );
say 'We have ', $results->numberOfRecords, ' records.';

while (my $result = $rseults->next() ) {
    say $result->raw;
}
