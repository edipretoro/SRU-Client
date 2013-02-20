#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

use Project::Libs;
use SRU::Client;
use MARC::Record;
use MARC::File::XML ( BinaryEncoding => 'utf8', RecordFormat => 'USMARC' );

my $sru_server = 'http://z3950.loc.gov:7090/voyager';
my $searcher = SRU::Client->new( base_url => $sru_server );
my $results = $searcher->search( 'dinosaur' );

say 'We found ', $results->numberOfRecords, ' books.';

my @records = @{ $results->records };
foreach my $record (@records) {
    my $record = MARC::Record->new_from_xml( $record->recordData );
    say $record->as_formatted;
    say '-' x 55;
}
