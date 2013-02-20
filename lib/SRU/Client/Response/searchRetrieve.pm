package SRU::Client::Response::searchRetrieve;
use strict;
use warnings;

use Moose;
use Moose::Util::TypeConstraints;
use XML::LibXML;
use SRU::Client::Response::Record;

has 'version' => (
    is => 'ro'
);

has 'numberOfRecords' => (
    is => 'ro'
);

has 'records' => (
    traits => [ 'Array' ],
    is => 'ro',
    isa => 'ArrayRef[SRU::Client::Response::Record]'
);

sub new_from_xml {
    my ( $class, $xml ) = @_;

    my $dom = XML::LibXML->new->parse_string( $xml );
    my $version = $dom->findvalue( '//zs:version' );
    my $numberOfRecords = $dom->findvalue( '//zs:numberOfRecords' );

    my @records;
    my $record_nodes = $dom->findnodes( '//zs:record' );
    foreach my $record_node (@{ $record_nodes }) {
        my $recordSchema = $record_node->findvalue( './zs:recordSchema' );
        my $recordPacking = $record_node->findvalue( './zs:recordPacking' );
        my $recordPosition = $record_node->findvalue( './zs:recordPosition' );
        my $recordData = $record_node->find( './zs:recordData/node()' )->[0]->toString;

        my $record = SRU::Client::Response::Record->new(
            recordSchema => $recordSchema,
            recordPacking => $recordPacking,
            recordPosition => $recordPosition,
            recordData => $recordData
        );
        push @records, $record;
    }

    $class->new(
        version => $version,
        numberOfRecords => $numberOfRecords,
        records => \@records
    );
}

1;
