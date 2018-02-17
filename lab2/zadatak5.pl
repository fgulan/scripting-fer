#!/usr/bin/perl -w

if (@ARGV != 1) {
	print "Neispravan broj parametara!\n";
	print "Skripta kao argument prima putanju do datoteke sa zapisima studenata.\n";
	exit 1;
}

if (! -e $ARGV[0]) { 
	print "Zadana putanja do datoteke nije ispravna.\n";
	exit 1;
}

@factors=();
my %results;
while (<>) {
	chomp;
	if ($_ =~ /[0-9]{10}/) {
		@values = split /;/;
		$sum = 0;
		foreach my $idx (3..9) {
			if ($values[$idx] eq "-") {
				$values[$idx] = 0;
			}
			$sum += $values[$idx] * $factors[$idx - 3];
		}
		$key = join(" ", "$values[1],", "$values[2]", "($values[0])");
		$results{$key} = $sum;
	} else {
		@factors = split /;/;
	}
}
$counter = 1;
print "Lista po rangu:\n";
print "---------------------\n";
foreach my $key (sort { $results{$b} <=> $results{$a} } keys %results) {
	printf("%3d. %-33s : %.2f\n", $counter, $key, $results{$key});
	$counter += 1;
}