while (1) {
	chomp($line = <STDIN>);
	my($b, $n) = split / /, $line;
	last if (($b == 0) && ($n == 0));
	my @arr;
	for (1..$n) {
		chomp($line = <STDIN>);
		my($fee, $fun) = split / /, $line;	
		push @arr, {fee => $fee, fun => $fun}; 
	}
	
		
}