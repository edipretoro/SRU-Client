use strict;
use warnings;
package SRU::Client;

use Moo;
use LWP::UserAgent;
use URI;
use URI::QueryParam;
use XML::Simple;
use Unicode::Map;

has 'base_url' => (
    is => 'ro'
);

has 'charset_map' => (
    is => 'ro',
    default => sub { undef }
);

has 'username' => (
    is => 'ro',
    default => sub { undef }
);

sub explain {
    my ( $self ) = shift;
    my $r = LWP::UserAgent->new->get( $self->base_url );
    my $data;

    if ($self->charset_map) {
        my $map = Unicode::Map->new( $self->charset_map );
        my $response = $map->to_unicode( $r->decoded_content );
        $data = XMLin( $response );
    } else {
        $data = XMLin( $r->decoded_content );
    }

    return $data;
}

sub search {
    my $self = shift;
    my $query = shift;

    my $uri = URI->new( $self->base_url );
    $uri->query_param(
        version => '1.1',
        operation => 'searchRetrieve',
        query => $query
    );

    return LWP::UserAgent->new->get( $uri );
}

1;
