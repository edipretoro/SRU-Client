use strict;
use warnings;
package SRU::Client;

use Moo;
use LWP::UserAgent;
use URI;
use URI::QueryParam;
use XML::Simple;
use SRU::Client::Response::searchRetrieve;

has 'base_url' => (
    is => 'ro'
);

has 'username' => (
    is => 'ro',
    default => sub { undef }
);

has 'password' => (
    is => 'ro',
    default => sub { undef }
);

sub explain {
    my ( $self ) = shift;
    my $r = LWP::UserAgent->new->get( $self->base_url );

    return XMLin( $r->content );
}

sub search {
    my ( $self, $params ) = @_;
    my ( %query_params, $query, $startRecord, $maximumRecords );

    if (ref($params) eq 'HASH') {
        $startRecord = delete $params->{startRecord} || 1;
        $maximumRecords = delete $params->{maximumRecords} || 10;
        $query = delete $params->{query};
    } else {
        $startRecord = 1;
        $maximumRecords = 10;
        $query = $params;
    }

    $query_params{version} = '1.1';
    $query_params{operation} = 'searchRetrieve';
    $query_params{query} = $query;
    $query_params{startRecord} = $startRecord;
    $query_params{maximumRecords} = $maximumRecords;
    $query_params{username} = $self->username if $self->username;
    $query_params{password} = $self->password if $self->password;

    my $uri = URI->new( $self->base_url );
    $uri->query_form_hash( \%query_params );


    my $r = LWP::UserAgent->new->get( $uri );

    return SRU::Client::Response::searchRetrieve->new_from_xml( $r->content );
}

1;
