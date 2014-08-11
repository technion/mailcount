#!/usr/bin/perl -w
use strict;

sub rounddown($);
sub main;

<>; #Throw away header line
&main;

sub main {

	#Builds a hash array of $times{count time occured in list}
	my %times = ();

	while(my $line = <>) {
		my @row = split(/,/, $line);
		my $fixed = &rounddown($row[3]);
        if(!defined($times{$fixed})) {
			$times{$fixed} = 0;
		}
		else {
			$times{$fixed}++;
		}
	}

    #Print out hash arra,csv compatible
	foreach my $key (keys %times) {
		print "$key,$times{$key} times\n";
	}
}
sub rounddown($) {
	# Format: 11/08/2014 12:04:14 AM
	my $date = shift or die "Missing input";
    chomp($date); #Date contains \r\n
	die "Invalid input $date" unless $date =~ /"(.*)(\d{2}):\d{2} (A|P)M/;
	my $minutes = sprintf("%02d", (int($2 / 5))*5);
	return "$1$minutes:00 $3M";
}

