$in = <STDIN>;
while ($in) {
	1 while ($in =~ s/BUG//g);
	print $in;
	$in = <STDIN>;
}
