sub list_or_scalar_or_void {
       !defined wantarray ? print "Void context\n"
      : wantarray         ? qw(1 2 3)
      :                     3;
}

my @array  = list_or_scalar_or_void();    # yields 1 2 3 - list context
my $string = list_or_scalar_or_void();    # gives 3 - scalar context

print "List context: @array\n";
print "Scalar context: $string\n";
list_or_scalar_or_void;                   # void context, returning undef.
