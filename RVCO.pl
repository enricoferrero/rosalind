#!/usr/bin/env perl
use Modern::Perl;
use Bio::SeqIO;

my $seqIn = Bio::SeqIO->new(
	-fh => \*ARGV,
	-format => "fasta"
);

my $c = 0;
while (my $seq = $seqIn->next_seq) {
	$c++ if $seq->seq eq $seq->revcom->seq;
}
say $c;
