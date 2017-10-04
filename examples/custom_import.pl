use lib '.';

use Data::Dump;

{
  package fun;
  $|++;
  use Love;

  printer();

  print "no \$printer defined\n"
      unless defined $printer;

  print "with love: ", love(qw( Perl Mojolicious )), "\n";

  print "fun package symbols: ".Data::Dump::pp(\%fun::)."\n";
  print "Love package symbols: ".Data::Dump::pp(\%Love::);
}

