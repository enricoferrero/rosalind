#!/usr/bin/env perl
use Modern::Perl;
use Bio::SeqIO;
use Statistics::Basic 'mean';

chomp( my $threshold = <> );

my $seqIn = Bio::SeqIO->new(
	-format => 'fastq',
	-fh => \*ARGV
);

my $c = 0;
while (my $seq = $seqIn->next_seq) {
	my $qualityRef = $seq->qual;
	$c++ if mean($qualityRef) < $threshold;
}

say $c;
