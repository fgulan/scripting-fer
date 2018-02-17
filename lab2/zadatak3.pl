#!/usr/bin/perl -w

$currentFile = undef;
my $totalArgs = $#ARGV + 1;

foreach my $hour (0..23) {
	$statistics[$hour] = 0;
}

if ($totalArgs == 0) {
	print " Citanje s ulaznog retka\n";
}

while (<>) {
	chomp;
	# Izracunaj statistiku
	@lineElements = split / /, $_;
	$hour = (split(/:/, $lineElements[3]))[1];
	$statistics[$hour] += 1;

	if ((! defined($currentFile) || ($currentFile ne $ARGV))
		&& $totalArgs != 0) {
		# Ispis datuma
		$currentFile = $ARGV;
		@fileNameParts = split /\./, $ARGV;
		$date = $fileNameParts[1];
		print " Datum: " . $date . "\n";
		print " sat : broj pristupa" . "\n";
		print "----------------------" . "\n";
	} elsif (eof) {
		# Ispis statistike
		if ($totalArgs == 0) {
			print " Citanje s ulaznog retka\n";
			print " sat : broj pristupa" . "\n";
			print "----------------------" . "\n";
		} 
		foreach my $hour (0..23) {
			printf("  %02d : %d\n", $hour, $statistics[$hour]);
			$statistics[$hour] = 0;
		}
		print "\n";
	}
}