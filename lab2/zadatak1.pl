#!/usr/bin/perl -w

print "Upisite niz znakova: ";
chomp($characters = <STDIN>);
print "Upisite broj ponavljanja: ";
chomp($count = <STDIN>);

for (1..$count) {
	print "$characters\n";
}