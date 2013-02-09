#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

BEGIN { use_ok( 'SRU::Client' ) };
require_ok( 'SRU::Client' );

done_testing( 2 );
