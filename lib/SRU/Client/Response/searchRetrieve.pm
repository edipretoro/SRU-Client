package SRU::Client::Response::searchRetrieve;
use strict;
use warnings;

use Moo;

has 'version' => (
    is => 'ro'
);

sub new_from_xml {
    my ( $class ) = @_;

    $class->new();
}

1;
