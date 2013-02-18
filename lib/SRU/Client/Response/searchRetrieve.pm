package SRU::Client::Response::searchRetrieve;
use strict;
use warnings;

use Moo;
use XML::LibXML;

has 'version' => (
    is => 'ro'
);

sub new_from_xml {
    my ( $class, $xml ) = @_;

    my $dom = XML::LibXML->new->parse_string( $xml );
    my $version = $dom->findvalue( '//zs:version' );
    $class->new(
        version => $version
    );
}

1;
