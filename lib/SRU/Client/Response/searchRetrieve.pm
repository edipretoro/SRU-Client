package SRU::Client::Response::searchRetrieve;
use strict;
use warnings;

use Moo;
use XML::LibXML;

has 'version' => (
    is => 'ro'
);

has 'numberOfRecords' => (
    is => 'ro'
);

sub new_from_xml {
    my ( $class, $xml ) = @_;

    my $dom = XML::LibXML->new->parse_string( $xml );
    my $version = $dom->findvalue( '//zs:version' );
    my $numberOfRecords = $dom->findvalue( '//zs:numberOfRecords' );

    $class->new(
        version => $version,
        numberOfRecords => $numberOfRecords,
    );
}

1;
