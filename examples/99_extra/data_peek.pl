use Devel::Peek 'Dump';


my $cb;

$cb = sub {
	my $c_n = shift;
	print "N is $c_n\n";
	
	return if $c_n == 10;
	$c_n++;
	Dump($cb);
	$cb->($c_n);

};
Dump($cb);
$cb->(1);
Dump($cb);
