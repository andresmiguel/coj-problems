$n = <STDIN>;
chomp($n);

my $x = "ap";
my $y = "papap";
my $count = 0;

while ($y =~ /(a{1}.*?p{1}.*?)/g) {
	print "$1\n";
	$count++;
}
print "$count\n";