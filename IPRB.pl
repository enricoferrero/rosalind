#!/usr/bin/env perl
use Modern::Perl;

my ($k, $m, $n) = split /\s+/, <>;

my $s = $k + $m + $n;
my $s1 = $s - 1;

say 1 - 0.25 * ($m / $s) * (($m - 1) / $s1)
	  - 0.5  * ($m / $s) * ($n / $s1)
	  - 0.5  * ($n / $s) * ($m / $s1)
	  - 1.0  * ($n / $s) * (($n - 1) / $s1);
