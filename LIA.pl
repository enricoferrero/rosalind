#!/usr/bin/env perl
use Modern::Perl;
use Math::Combinatorics;

my ($k, $n) = split /\s+/, <>;
my $t = 2**$k;
my $p = 0;

sub prob {
	my ($k, $i) = @_;
	my $t = 2**$k;
	return factorial($t) / (factorial($i) * factorial($t-$i)) * (0.25**$i) * (0.75**($t-$i));
}

for my $i ($n .. $t) {
	$p += prob($k, $i);
}

say $p;
