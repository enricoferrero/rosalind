#!/usr/bin/env perl
use Modern::Perl;
use Bio::SeqIO;
use String::LCSS_XS;

my $seqio = Bio::SeqIO->new(
	-file => "rosalind_lcsm.txt",
	-format => "Fasta");

my @seqs;

while (my $seqobj = $seqio->next_seq) {
	push @seqs, $seqobj->seq;
}

my $maxLength = 0;
my $lcss = '';
for my $i (0 .. $#seqs-1) {
	for my $j ($i+1 .. $#seqs) {
		my $local = String::LCSS_XS::lcss($seqs[$i], $seqs[$j]);
		if (length($local) > $maxLength) {
			$lcss = $local;
			$maxLength = length($lcss);
		}
	}
}
		
say $lcss;
