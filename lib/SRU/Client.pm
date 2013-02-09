use strict;
use warnings;
package SRU::Client;

use Moo;
use LWP::UserAgent;

has 'base_url' => (
    is => 'ro'
);

sub explain {
    return LWP::UserAgent->new->get( shift->base_url );
}

1;
