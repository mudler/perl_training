use Data::Dumper;

my @list = "string";

print Dumper( \@list );

my $string = qw(a b c);

print "$string\n";

$string = "Boo 43";

$string--;

print "$string\n";

$string = "43 Boo";

$string--;

print "$string\n";

my $count = scalar @{ [qw(a b c)] };

print "$count\n";
