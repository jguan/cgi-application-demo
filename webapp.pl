#!/usr/bin/perl
use strict;
# need to specify your lib directory
use lib '/path/to/your/lib';
use Foo;

my $webapp = Foo->new(
	PARAMS => {
		cfg_file => 'data.cfg'
	}
);
$webapp->run();

