#!/usr/bin/env perl
use Modern::Perl;
use Bio::SeqIO;

my $seqio = Bio::SeqIO->new(
	-file => "rosalind_gc.txt",
	-format => "Fasta");

my $max = 0;
my $id = "";

while (my $seq = $seqio->next_seq) {
	my @seqarray = split '', $seq->seq;
	my $tot = @seqarray;
	my $count;
	for (@seqarray) {
		$count++ if /[GC]/i;
	}
	my $gc = $count / $tot * 100;
	if ($gc > $max) {
		$max = $gc;
		$id = $seq->id;
	}
}
say $id, "\n", $max;
