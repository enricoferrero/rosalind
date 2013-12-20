#!/usr/bin/env perl
use Modern::Perl;

my($a, $b) = split /\s+/, <>;
my $sum = 0;
for my $i ($a .. $b) {
	$sum += $i if $i%2==1;
}
say $sum;
