#!/usr/bin/env perl
use Modern::Perl;

my ($n, $m) = split /\s+/, <>;

sub fib {

	my ($n, $m) = @_;
	my @fibTable;

	for my $i (0 .. $n-1) {
		if ($i < $m) {
			if ($i < 2) {
				push @fibTable, 1;
			}
			else {
				push @fibTable, $fibTable[-1] + $fibTable[-2];
			}
		}
		else {
			my $rabbits = 0;
			for my $j ($i-$m .. $i-2) {
				$rabbits = $rabbits + $fibTable[$j];
			}
			push @fibTable, $rabbits;
		}
	}
	return @fibTable;
}

my @result = fib($n, $m);
say $result[-1];


