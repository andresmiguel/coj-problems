chomp($line = <STDIN>);
($n, $m) = split / /, $line;

for (1..$n) {
	chomp($line = <STDIN>);
	my @line_arr = split //, $line;
	push @matrix, \@line_arr
}

@ind = ([-1, 0], [0, 1], [1, 0], [0, -1]);

$count = 0;

for $i (0..$n - 1) {
	CHAR: for $j (0..$m - 1) {
		if ($matrix[$i][$j] eq "+") {
			for $k (0..3) {
				($i + $ind[$k][0]) >= 0 or next;
				($j + $ind[$k][1]) >= 0 or next;
				if ($matrix[$i + $ind[$k][0]][$j + $ind[$k][1]] eq "-") {
					$count++;
					next CHAR;					
				}	
			}
		}
	}
}

print $count;