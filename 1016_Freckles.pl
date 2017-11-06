{
	package PriorityQueue;

	sub new {
		my $class = shift;

		my $self = {
			heap => [],
			size => 0
		};
		bless $self, $class;
	}

	sub isEmpty {
		my $self = shift;
		return ($self->{size} == 0);
	}

	sub enqueue {
		my $self = shift;
		my $index = $self->{size};
		$self->{heap}[$index] = shift;
		$self->{size}++;

		return 1 if $index == 0; # first insertion
		my $parent;
		do {
			$parent = int(($index - 1) / 2);
			if ($self->{heap}[$index]{weight} < $self->{heap}[$parent]{weight}) {
				($self->{heap}[$index], $self->{heap}[$parent]) = ($self->{heap}[$parent], $self->{heap}[$index]);
				$index = $parent;
			} else {
				return 1;
			}
		} while ($parent != 0);

	}

	sub dequeue {
		my $self = shift;
		return undef if $self->isEmpty();

		sub heapify;

		my $root = $self->{heap}[0];
		&heapify($self);
		return $root;

		sub heapify {
			my $self = shift;
			$self->{size}--;
			$self->{heap}[0] = $self->{heap}[$self->{size}];
			$self->{heap}[$self->{size}] = undef;

			my $root = 0;
			my ($left, $right);
			while (1) {
				$left = 2 * $root + 1;
				$right = 2 * $root + 2;

				last if !defined($self->{heap}[$left]);

				my $min;
				if (!defined($self->{heap}[$right])) {
					$min = $left;
				} else {
					$min = $self->{heap}[$left]{weight} < $self->{heap}[$right]{weight}
						? $left
						: $right;
				}

				if ($self->{heap}[$min]{weight} < $self->{heap}[$root]{weight}) {
					($self->{heap}[$min], $self->{heap}[$root]) = ($self->{heap}[$root], $self->{heap}[$min]);
					$root = $min;
				} else {
					last;
				}
			}

		}
	}

}

use Data::Dumper;

$n = <STDIN>;
$total_vertex = $n;
@matrix = [];

$points = ();
while ($n--) {
	chomp (my $line = <>);
	my ($x, $y) = split / /, $line;
	push @points, [$x, $y];
}

for (my $i = 0; $i < @points; $i++) {
	for (my $j = 0; $j < @points; $j++) {
		if ($j != $i) {
			$weight = sqrt(($points[$i][0] - $points[$j][0])**2 + ($points[$i][1] - $points[$j][1])**2);
			$matrix[$i][$j] = $weight;
			$matrix[$j][$i] = $weight;
		} else {
			$matrix[$i][$j] = undef;
		}
	}
}

my @marked;
my $proc_v = 1;
$marked[0] = 1;
$pq = PriorityQueue->new();

for (my $i = 1; $i < $total_vertex; $i++) {
	if ($matrix[0][$i]) {
		$pq->enqueue({
			weight => $matrix[0][$i],
			v1 => 0,
			v2 => $i
		});
	}
}

while ($proc_v < $total_vertex) {
	%edge = %{$pq->dequeue()};
	if (!$marked[$edge{v2}]) {
		$proc_v++;
		$marked[$edge{v2}] = 1;
		$total_w += $edge{weight};
		for (my $i = 0; $i < $total_vertex; $i++) {
			if ($matrix[$edge{v2}][$i]) {
				$pq->enqueue({
					weight => $matrix[$edge{v2}][$i],
					v1 => $edge{v2},
					v2 => $i
				});
			}
		}
	}
}


printf "%.2f\n", $total_w;
