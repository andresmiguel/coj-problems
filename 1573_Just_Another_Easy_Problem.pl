use bigint qw/hex/;

chomp($n = <STDIN>);

for my $i (1..$n) {
	chomp($x = <STDIN>);
	$dec_x = hex($x);
	$sum = int($dec_x * ($dec_x + 1) / 2);
	$sum % $dec_x == 0 
		? $i != 1 ? print "\nYES" : print "YES" 
		: $i != 1 ? print "\nNO" : print "NO"; 
}