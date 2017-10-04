use Memory::Usage;
use Scalar::Util 'weaken';

my $mu = Memory::Usage->new();
my $mu_w = Memory::Usage->new();

$mu_w->record('before');

circular_ref() for 1..100000;

$mu_w->record('after');

$mu_w->dump();

sub circular_ref {
	my $a;
	my $b;

	$a->{b} = \$b;
	$b->{a} = \$a;
	weaken $b->{a};
}
