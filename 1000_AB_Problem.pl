$in = <STDIN>;
chomp($in);

while ($in) {
	($a, $b) = split(" ", $in);
	print $a + $b, "\n";
	$in = <STDIN>;
	chomp($in);
}