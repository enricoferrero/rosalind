#!/usr/bin/env perl
use Modern::Perl;
use Bio::AlignIO;
use Bio::SimpleAlign;

my $input = Bio::AlignIO->new(
	-file => "rosalind_cons.txt",
	-format => "fasta");

my $aln = $input->next_aln;
my $consensus = $aln->consensus_string();

# @seqs is an array of array
my @seqs;
for ($aln->each_seq) {
	push @seqs, [ split '', $_->seq ];
}

# so is @counts
my @counts;
for my $pos (0 .. $aln->length-1) {
	my ($A, $C, $G, $T) = (0) x 4;
	for my $seqn (0 .. $#seqs) {
		$A++ if $seqs[$seqn][$pos] eq 'A';
		$C++ if $seqs[$seqn][$pos] eq 'C';
		$G++ if $seqs[$seqn][$pos] eq 'G';
		$T++ if $seqs[$seqn][$pos] eq 'T';
	}
	$counts[0][$pos] = $A;
	$counts[1][$pos] = $C;
	$counts[2][$pos] = $G;
	$counts[3][$pos] = $T;
}

say $consensus;

my @nt = qw(A C G T);
for my $i (0 .. $#counts) {
	print $nt[$i], ":", " ";
	for my $j (0 .. $#{ $counts[$i] }) {
		print $counts[$i][$j], " ";
	}
	print "\n";
}
