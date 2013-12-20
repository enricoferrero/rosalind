#!/usr/bin/env perl
use Modern::Perl;
use Bio::DB::SwissProt;

my @rosalindIds;
my @swissProtIds;
while (<>) {
	chomp;
	push @rosalindIds, $_;
	s/(.+?)_.+/$1/ if /_/;
	push @swissProtIds, $_;
}

my $swissProtObj = Bio::DB::SwissProt->new;

my %matches;
for my $i (0 .. $#swissProtIds) {
	my $seqObj= $swissProtObj->get_Seq_by_acc($swissProtIds[$i]);
	my $seq = $seqObj->seq;  # I have no idea why this is required
	while ($seq =~ /(?=N[^P][ST][^P])/g) {
		my $id = $rosalindIds[$i];
		my $pos = $-[0] + 1;
		push @{ $matches{$id} }, $pos;
	}
}

for my $id (keys %matches) {
	say $id;
	for my $i (0 .. $#{ $matches{$id} }) {
		print $matches{$id}[$i], " ";
	}
	print "\n";
}
