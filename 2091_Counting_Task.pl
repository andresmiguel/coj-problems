chomp($t = <STDIN>);

foreach (1..$t){
	chomp($line = <STDIN>);	
	my %char_count;
	for my $c (split //, $line) {
		$char_count{$c} = 1;		
	}
	
	print scalar keys %char_count;
	print "\n" if $_ != $t; 			
}