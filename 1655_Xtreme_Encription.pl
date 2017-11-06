$line = <STDIN>;

while($line) {
	chomp $line;
	@arr_line = split / /, $line;
	
	@s = split //, $arr_line[0];
	@t = split //, $arr_line[1];
	
	while (@s != 0 and @t != 0) {
		shift @s if ($s[0] eq $t[0]); 
		shift @t;	
	}
	
	if (@s == 0) {
		print "Yes\n";
	} else {
		print "No\n";
	}
	
	$line = <STDIN>;
}

