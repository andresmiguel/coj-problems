$in = <STDIN>;
chomp($in);

while ($in) {
	$length = length($in);
	substr($in, 0, int($length / 2)) = scalar reverse substr($in, 0, int($length / 2));
	if ($length % 2 == 0) {
		substr($in, int($length / 2)) = scalar reverse substr($in, int($length / 2));	
	} else
	{
		substr($in, int($length / 2) + 1) = scalar reverse substr($in, int($length / 2) + 1);
	}
	
	print "$in\n";
	$in = <STDIN>;
	chomp($in);
}