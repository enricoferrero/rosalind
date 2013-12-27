#!/usr/bin/env perl
use Modern::Perl;
use Bio::SeqIO;
use Bio::Factory::EMBOSS;

my $seqIn = Bio::SeqIO->new(
	-fh => \*ARGV,
	-format => "fasta"
);
my $seq = $seqIn->next_seq->seq;

sub revcomp {
	my $dna = shift;
	return reverse $dna =~ tr/ACGTacgt/TGCAtgca/r;
}

for my $off (0 .. length($seq)-1) {
	for my $len (4 .. 12) {
		if ($off + $len <= length($seq)) {
			my $subStr = substr($seq, $off, $len);
			my $revCom = revcomp($subStr);
			say $off+1, " ", $len if $subStr eq $revCom;
		}
	}
}
