#!/usr/bin/env perl
use Modern::Perl;

while (<>) {
	print if $.%2==0;
}
