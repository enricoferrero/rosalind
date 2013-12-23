#!/usr/bin/env perl
use Modern::Perl;
use Bio::Tools::CodonTable;
use bignum;

my $codonTable = Bio::Tools::CodonTable->new();
my $n = 1;

while (<>) {
	chomp;
	my @protein = split //;
	push @protein, "*";
	for my $aa (@protein) {
		my $codon = $codonTable->revtranslate($aa);
		$n *= $codon;
	}
}
say $n % 1000000;


