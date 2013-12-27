#!/usr/bin/env perl
use Modern::Perl;
use Bio::SeqIO;

my $seqIn = Bio::SeqIO->new(
	-fh => \*ARGV,
	-format => "fasta");

my $geneObj = $seqIn->next_seq;
my $geneSeq = $geneObj->seq;

while (my $intronObj = $seqIn->next_seq) {
	my $intronSeq = $intronObj->seq;
	$geneSeq =~ s/$intronSeq//;
}
$geneObj->seq($geneSeq);

my $protObj = $geneObj->translate(-complete => 1);
say $protObj->seq;
