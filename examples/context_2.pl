use Data::Dumper;

my @list = "string";

print Dumper(\@list);

my $string = qw(1 2 3);

print "$string\n";

$string = "Boo 43";

$string--;

print "$string\n";

$string = "43 Boo";

$string--;

print "$string\n";
