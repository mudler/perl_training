sub list_or_scalar_or_void {
       !defined wantarray ? print "Void context\n"
      : wantarray         ? qw(1 2 3)
      :                     3;
}

my @array = list_or_scalar_or_void();    # yields 1 2 3 - list context

my ( $one, $two, $three ) = list_or_scalar_or_void();
my ( $first, @others ) = list_or_scalar_or_void();

#  ^^ Lexical scope

my $string = list_or_scalar_or_void();    # gives 3 - scalar context

print "List context: @array\n";
print "Scalar context: $string\n";
list_or_scalar_or_void;                   # void context, returning undef.

print "Taken with lexical scope: $one $two $three\n";
print "Taken with lexical scope(2): $first @others\n";
