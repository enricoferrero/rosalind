#!/usr/bin/env perl
use Modern::Perl;

my @words = split /\s+/, <>;

my %counts;
for (@words) {
	$counts{$_}++;
}

for (keys %counts) {
	say $_, " ", $counts{$_};
}
