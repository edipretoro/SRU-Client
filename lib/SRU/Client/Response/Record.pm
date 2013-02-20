package SRU::Client::Response::Record;

use Moose;

has 'recordSchema' => (
    is => 'ro'
);

has 'recordPacking' => (
    is => 'ro'
);

has 'recordData' => (
    is => 'ro'
);

has 'recordPosition' => (
    is => 'ro'
);

1;
