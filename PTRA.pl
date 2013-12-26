#!/usr/bin/env perl
use Modern::Perl;
use Bio::Seq;
use Bio::Tools::CodonTable;

chomp( my($dna, $prot) = <>);
my $dnaObj = Bio::Seq->new(-seq => $dna);
$prot .= "*";

my @codonTableIds = (1 .. 6, 9 .. 16, 21 .. 23);

for my $id (@codonTableIds) {
	my $protObj = $dnaObj->translate(
		-codontable_id => $id
	);
	say $id if $protObj->seq eq $prot;
}
