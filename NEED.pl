#!/usr/bin/env perl;
use Modern::Perl;
use Bio::DB::GenBank;
use Bio::Factory::EMBOSS;
use Bio::AlignIO;

my @genBankIds = split /\s+/, <>;
my $genBankObj = Bio::DB::GenBank->new();

my @seqs;
for my $id (@genBankIds) {
	my $seqObj = $genBankObj->get_Seq_by_id($id);
	push @seqs, $seqObj;
}

my $emboss = Bio::Factory::EMBOSS->new();
my $needle = $emboss->program("needle");
my $outfile = "needle.out";
$needle->run({
	-asequence => $seqs[0],
	-bsequence => $seqs[1],
	-datafile => "EDNAFULL",
	-gapopen => "10.0",
	-gapextend => "1.0",
	-endweight => "Y",
	-endopen => "10.0",
	-endextend => "1.0",
	-outfile => $outfile
});

my $alignIoObj = Bio::AlignIO->new(
	-format => "emboss",
	-file => $outfile
);

say $alignIoObj->next_aln->score;
