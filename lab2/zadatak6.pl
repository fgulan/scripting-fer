#!/usr/bin/perl -w

if (@ARGV < 1) {
	print "Caesar chiper error. Neispravan broj parametara!\n";
	print "Skripta kao argument prima prvo slovo abecede.\n";
	print "Opcionalno: Kao argument mozete zadati i datoteku, ili upisivati tekst u konzolu.\n";
	print "Ukoliko rucno unosite tekst pritisnite Ctrl+D za kraj unosa.\n";
	exit 1;
}

$startChar = uc shift(@ARGV);
$distance = ord($startChar) - ord("A") ;

while (<>) {
	chomp;
	$result = "";
	foreach my $char (split "") {
		$charInt = ord(uc $char);
		if ($charInt >= 65 && $charInt <= 90) {
			$offset = ($charInt - 65 + $distance) % 26;
			$char = uc chr(65 + $offset);
		}
		$result .= $char;
	}
	print $result . "\n";
}