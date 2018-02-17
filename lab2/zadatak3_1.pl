#!/usr/bin/perl -w

$currentFile = undef;

while (<>) {
	chomp;
	# Izracunaj statistiku
	@lineElements = split / /, $_;
	$hour = (split(/:/, $lineElements[3]))[1];
	$statistics[$hour] += 1;

	if (! defined($currentFile) || ($currentFile ne $ARGV)) {
		# Ispis datuma
		$currentFile = $ARGV;
		@fileNameParts = split /\./, $ARGV;
		$date = $fileNameParts[1];
		print " Datum: " . $date . "\n";
		print " sat : broj pristupa" . "\n";
		print "----------------------" . "\n";
	} elsif (eof) {
		# Ispis statistike
		foreach my $hour (0..23) {
			printf("  %02d : %d\n", $hour, $statistics[$hour]);
			$statistics[$hour] = 0;
		}
		print "\n";
	}
}