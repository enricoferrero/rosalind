#!/usr/bin/env perl
use strict;
use warnings;

open my $in, "<", "input.txt";
my $line = <$in>;
close $in;
my @tmp = split /\s+/, $line;
my $n = $tmp[0];
my $k = $tmp[1];

sub fib {
	my $n = shift;
	my $k = shift;
	if ($n <= 2) {
		return 1;
	}
	else {
		fib($n - 1, $k) + ($k * fib($n - 2, $k));
	}
}

print fib($n, $k), "\n";
