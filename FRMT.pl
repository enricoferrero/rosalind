#!/usr/bin/env perl;
use Modern::Perl;
use Bio::DB::GenBank;
use Bio::SeqIO;

my @genBankIds;
my $minLength = 999999999;
my $shortest;

push @genBankIds, split /\s+/, <>;
my $genBankObj = Bio::DB::GenBank->new();

for my $id (@genBankIds) {
	my $seqObj = $genBankObj->get_Seq_by_id($id);
	if ($seqObj->length < $minLength) {
		$minLength = $seqObj->length;
		$shortest = $seqObj;
	}
}

my $seqIoObj = Bio::SeqIO->new(
	-file => ">out",
	-format => "fasta"
);

# header is not complete, I don't see how I can change that
$seqIoObj->write_seq($shortest);



