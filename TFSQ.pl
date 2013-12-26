#!/usr/bin/env perl
use Modern::Perl;
use Bio::SeqIO;

my $seqIn = Bio::SeqIO->newFh(
	-fh => \*ARGV,
	-format => 'fastq'
);

my $seqOut = Bio::SeqIO->newFh(
	-fh => \*STDOUT,
	-format => 'fasta'
);

print $seqOut $_ while <$seqIn>;
