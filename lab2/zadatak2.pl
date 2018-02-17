#!/usr/bin/perl -w

print "Unesite niz brojeva. Nakon unosa jednog broja stisnite Enter. Za kraj upisite Ctrl+D.\n";

chomp(@numbers = <STDIN>);

for (@numbers) {
	$sum += $_;
}

print "Suma: ", $sum, "\n";
print "Velicina polja: ", scalar @numbers, "\n";
print "Prosjek polja: ", $sum/@numbers, "\n";