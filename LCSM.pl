#!/usr/bin/env perl
use Modern::Perl;
use Bio::SeqIO;
use Tree::Suffix;

my $seqio = Bio::SeqIO->new(
	-file => "rosalind_lcsm.txt",
	-format => "Fasta");

my @seqs;

while (my $seqobj = $seqio->next_seq) {
	push @seqs, $seqobj->seq;
}

my $tree = Tree::Suffix->new(@seqs);
my @lcss = $tree->lcs;

print Dumper @lcss;
print Dumper \@lcss;
