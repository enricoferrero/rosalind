#!/usr/bin/env perl
use Modern::Perl;
use Algorithm::Permute;

chomp (my $n = <>);
my @N = 1 .. $n;

my $permObj = Algorithm::Permute->new(\@N);
my $permNumb = 0;
my @perms;

while (my @perm = $permObj->next) {
	$permNumb++;
	push @perms, (join ' ', @perm);
}

say $permNumb;
say for @perms;


