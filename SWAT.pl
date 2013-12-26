#!/usr/bin/env perl;
use Modern::Perl;
use Bio::DB::SwissProt;
use Bio::Factory::EMBOSS;
use Bio::AlignIO;

my @swissProtIds = split /\s+/, <>;
my $swissProtObj = Bio::DB::SwissProt->new();

my @seqs;
for my $id (@swissProtIds) {
	my $seqObj = $swissProtObj->get_Seq_by_id($id);
	push @seqs, $seqObj;
}

my $emboss = Bio::Factory::EMBOSS->new();
my $water = $emboss->program("water");
my $outfile = "water.out";
$water->run({
	-asequence => $seqs[0],
	-bsequence => $seqs[1],
	-datafile => "EBLOSUM62",
	-gapopen => "10.0",
	-gapextend => "1.0",
	-outfile => $outfile
});

my $alignIoObj = Bio::AlignIO->new(
	-format => "emboss",
	-file => $outfile
);
unlink $outfile;

say $alignIoObj->next_aln->score;
