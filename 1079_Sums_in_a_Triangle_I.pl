chomp($t = <STDIN>);

sub max {
	return (sort { $a <=> $b } @_)[-1];
}

foreach (0..$t - 1){
	chomp($n = <STDIN>);
	my @matrix = ();
	for $i (0..$n - 1) {
		chomp($line = <STDIN>);
		my @arr_temp = split / /, $line;
		$matrix[$i] = \@arr_temp; 
		if ($i > 0) {
			for $j (0..@arr_temp - 1) {
				if ($j == 0) {
					$matrix[$i][$j] += $matrix[$i - 1][$j];  
				} elsif ($i == $j) {
					$matrix[$i][$j] += $matrix[$i - 1][$j - 1];
				} else {
					$matrix[$i][$j] += max($matrix[$i - 1][$j - 1], $matrix[$i - 1][$j]);
				}
			}
		}
	}
	printf "%d\n", &max(@{$matrix[-1]});	
}
