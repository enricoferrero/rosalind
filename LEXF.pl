#!/usr/bin/env perl
use Modern::Perl;
use Algorithm::Combinatorics 'variations_with_repetition';

chomp( my @alphabet = split /\s+/, <> );
chomp( my $k = <> );

my @perms = variations_with_repetition(\@alphabet, $k);
say @{ $_ } for @perms;

