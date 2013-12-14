#!/usr/bin/env perl
use Modern::Perl;
use Data::Dumper;

my ($AAAA, $AAAa, $AAaa, $AaAa, $Aaaa, $aaaa) = split /\s+/, <>;
my $k = 2;
my $n = 0;

$n += 1 * $k * $AAAA;
$n += 1 * $k * $AAAa;
$n += 1 * $k * $AAaa;
$n += .75 * $k * $AaAa;
$n += .5 * $k * $Aaaa;
$n += 0 * $k * $aaaa;

say $n;
