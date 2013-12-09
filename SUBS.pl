#!/usr/bin/env perl
use Modern::Perl;

my @strs;
my $string;
my $substring;
my $offset =0;
my @idx;

while (<>) {
	chomp;
	push @strs, $_;
}

for (@strs) {
	$string = $strs[0];
	$substring = $strs[1];
}

while (1) {
	my $pos = index($string, $substring, $offset);
	last if $pos < 0;
	push @idx, $pos;
	$offset = $pos+1;
}

for my $pos (@idx) {
	print $pos+1, " ";
}
print "\n";
