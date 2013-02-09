use strict;
use warnings;
package SRU::Client;

use Moo;
use LWP::UserAgent;
use URI;
use URI::QueryParam;

has 'base_url' => (
    is => 'ro'
);

sub explain {
    return LWP::UserAgent->new->get( shift->base_url );
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
