#!/usr/bin/env perl
use Modern::Perl;
use Bio::DB::SwissProt;

my @IDs;
my @newIDs;
while (<>) {
	chomp;
	push @IDs, $_;
	s/(.+?)_.+/$1/ if /_/;
	push @newIDs, $_;
}

my $SPobj = Bio::DB::SwissProt->new;
my $seqStream = $SPobj->get_Stream_by_id(\@newIDs);

my %matches;
while (my $seqObj = $seqStream->next_seq) {
	my $seq = $seqObj->seq;  # I have no idea why this is required
	while ($seq =~ /N[^P][ST][^P]/g) {
		my $SPid = $seqObj->accession_number;
		my $pos = $-[0] + 1;
		push @{ $matches{$SPid} }, $pos;
	}
}

for my $SPid (keys %matches) {
	for my $ID (@IDs) {
		if ($ID =~ /$SPid/) {
			say $ID;
		}
		elsif ($SPid =~ /$ID/) {
			say $ID;
		}
	}
	for my $i (0 .. $#{ $matches{$SPid} }) {
		print $matches{$SPid}[$i], " ";
	}
	print "\n";
}
