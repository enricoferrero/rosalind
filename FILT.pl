#!/usr/bin/env perl
use Modern::Perl;
use Bio::SeqIO;

my ($q, $p) = split /\s+/, <>;

my $infile = "fastx_in.fastq";
open my $in, ">", $infile;
print $in $_ while <>;

my $outfile = "fastx_out.fastq";
system("fastq_quality_filter -Q33 -q $q -p $p -i $infile -o $outfile");

my $seqIn = Bio::SeqIO->new(
	-format => "fastq",
	-file => $outfile
);

my $c = 0;
$c++ while $seqIn->next_seq;
say $c;

unlink ($infile, $outfile);
