chomp($in = <STDIN>);

while ($in) {
	($s, $t) = split(" ", $in);
	@s_arr = split //, $s;
	@t_arr = split //, $t;
	
	if (scalar @s_arr > scalar @t_arr) {
		print "No\n";
	} else {
		$s_len = @s_arr;
		$t_len = @t_arr;
		
		$si = 0;
		$ti = 0;
		
		while ($si < $s_len && $ti < $t_len) {
			if ($s_arr[0] eq $t_arr[0]) {
				shift @s_arr;
				$si++;
			}
			shift @t_arr;
			$ti++;
		}
		
		if (@s_arr > 0) {
			print "No\n";
		} else {
			print "Yes\n";
		}
	}
	
	chomp($in = <STDIN>);
}