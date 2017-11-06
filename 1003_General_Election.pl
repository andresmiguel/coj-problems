chomp($t = <STDIN>);

foreach (1..$t){
	chomp($line = <STDIN>);
	my($n, $m) = split / /, $line;
	@votes = ();
	foreach (1..$m) {
		chomp($line = <STDIN>);
		@temp_arr = split / /, $line;
		$i = 0;
		foreach (@temp_arr) {
			$votes[$i++] += $_; 
		}	
	}
	
	$max_index = 0;
	
	for ($i = 1; $i < scalar @votes; $i++) {
		if ($votes[$i] > $votes[$max_index]) {
			$max_index = $i;
		}
	}
	$max_index++;
	
	$_ != $t ? print "$max_index\n" : print "$max_index"; 	
} 
