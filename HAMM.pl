#!/usr/bin/env perl
use Modern::Perl;

my @seqs = ();
my @seq1 = ();
my @seq2 = ();
my $count = 0;

while (<>) {
	chomp;
	push @seqs, $_;
}

for (@seqs) {
	@seq1 = split '', $seqs[0];
	@seq2 = split '', $seqs[1];
}

for (0 .. $#seq1) {
	$count++ if $seq1[$_] ne $seq2[$_];
}

say $count;


