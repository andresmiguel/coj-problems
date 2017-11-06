sub countOnes {
	my ($n) = @_;
	my $count = 0;
	while ($n) {
		$count += $n & 1; 
		$n = $n >> 1;
	}
	
	return $count;
}


my @oneCount;
$oneCount[0] = 0;

for (1..1000) {
	$oneCount[$_] = $oneCount[$_ - 1] + countOnes($_);
}

chomp($t = <STDIN>);

for (1..$t) {
	chomp($line = <STDIN>);	
	my ($a, $b) = split / /, $line;
	printf "%d\n", $oneCount[$b] - $oneCount[$a - 1];
}