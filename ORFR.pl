#!/usr/bin/env perl
use Modern::Perl;
use Bio::Seq;

chomp (my $seq = <>);
my $seqObj = Bio::Seq->new(-seq => $seq);
my $orf = $seqObj->translate(-orf => "longest", start => "atg", complete => 1);
my $revOrf = $seqObj->revcom->translate(-orf => "longest", start => "atg", complete => 1);

if ($orf->length >= $revOrf->length) {
	say $orf->seq;
}
else {
	say $revOrf->seq;
}
