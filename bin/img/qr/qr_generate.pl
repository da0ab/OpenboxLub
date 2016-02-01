use strict;
use warnings;

my $FULL_TEXT = 'http://rarebook.mgimo.ru/book_r/%s/index.php';
my $ZINT_CMD = 'zint -o %s -b 58  --scale=7  --border=0 -d "%s"';
my $OUTPUT_FN = 'img.png';

my ($infile, $root) = @ARGV;
die "Usage: qr_generate.pl <input file> <output folder>" if ! $root;

open (IN, "<$infile") or die "$!: $infile";

while (my $line = <IN>) {
	chomp ($line);
	mkdir ("$root/$line") or die "$!: $root/$line";
	my $text = sprintf ($FULL_TEXT, $line);
	my $outfile = "$root/$line/$OUTPUT_FN";
	my $cmd = sprintf ($ZINT_CMD, $outfile, $text);
	print ("$cmd\n");
	system ($cmd);
}
close (IN);
