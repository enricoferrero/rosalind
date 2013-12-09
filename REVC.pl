#!/usr/bin/env perl

use strict;
use warnings;

print "Enter DNA: ";
chomp(my $string = <STDIN>);
$string = reverse $string;
$string =~ tr/ACGT/TGCA/;
print $string,"\n";
