#!/usr/bin/env perl
use Modern::Perl;
use Bio::SeqIO;
use Data::Dumper;

my $k = 3;
my %suffixes;
my %prefixes;
my %graph;

my $seqio = Bio::SeqIO->new(
	-file => "rosalind_grph.txt",
	-format => "Fasta");

while (my $s = $seqio->next_seq) {
	$suffixes{$s->id} = substr($s->seq, -$k, $k);
	$prefixes{$s->id} = substr($s->seq, 0, $k);
}


for my $i (keys %suffixes) {
	for my $j (keys %prefixes) {
		if ($suffixes{$i} eq $prefixes{$j}) {
			push @{ $graph{$i} }, $j unless $i eq $j;
		}
	}
}

for my $id (keys %graph) {
	for my $i (0 .. $#{ $graph{$id} }) {
		say "$id $graph{$id}[$i]";
	}
}
