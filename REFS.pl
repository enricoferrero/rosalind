#!/usr/bin/env perl
use Modern::Perl;
use Bio::DB::Query::GenBank;

chomp( my( $species, $min, $max, $date ) = <> );
my $queryObj = Bio::DB::Query::GenBank->new(
	-db => 'nucleotide',
	-query => "$species [ORGN] AND $min:$max [SLEN] AND 1900/01/01:$date [PDAT] AND srcdb_refseq [PROP]"
);

say $queryObj->count;
