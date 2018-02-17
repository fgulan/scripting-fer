#!/usr/bin/perl -w

while (<>) {
	chomp;
	next if $_ !~ /[0-9]{10}/;

	@values = split /;/;
	$labTime = $values[3];
	$lockTime = $values[4];

	@labTimeComponents = split / /, $labTime;
	@lockTimeComponents = split / /, $lockTime;

	$labDate = $labTimeComponents[0];
	$lockDate = $lockTimeComponents[0];

	$labStartHour = (split /:/, $labTimeComponents[1])[0];
	$lockHour = (split /:/, $lockTimeComponents[1])[0];

	$hoursSpent = $lockHour - $labStartHour;

	if ($lockDate gt $labDate || $hoursSpent > 0) {
		print "$values[0] $values[1] $values[2]";
		print " - PROBLEM: $labTimeComponents[0] $labTimeComponents[1]";
		print " --> @lockTimeComponents" . "\n";
	}

}