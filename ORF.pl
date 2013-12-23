#!/usr/bin/env perl
use Modern::Perl;
use Bio::SeqIO;

my $seqIoObj = Bio::SeqIO->new(-file => "rosalind_orf.txt", -format => "fasta", -alphabet => "dna");
my @translations;
my %peptides;

while (my $seqObj = $seqIoObj->next_seq) {
	
	for (0 .. 2) {
		my $protObj = $seqObj->translate(-frame => $_);
		push @translations, $protObj->seq;
		my $revProtObj = $seqObj->revcom->translate(-frame => $_);
		push @translations, $revProtObj->seq;
	}

	for (@translations) {
		while (/(?=(M\w*)\*)/g) {
			$peptides{$1}++;
		}
	}
}

say for keys %peptides;

