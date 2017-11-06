chomp($n = <STDIN>);

$sum = 0;
if ($n >= 0) {
	$sum = ($n * ($n + 1)) / 2;	
} else {
	$n *= -1;
	$sum = ($n * ($n + 1)) / 2;
	$sum--;
	$sum *= -1; 
}

print "$sum";
