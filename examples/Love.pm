package Love;

use strict;

sub import {
    my $pkg = caller; # who's calling us?
    no strict 'refs'; # Avoid strict to be dushbag with symbolic dereference
    
    foreach my $glob (keys %Love::) { # Get all meta data-types in the package
        next if not defined *{$Love::{$glob}}{CODE} # We want to put in caller only functions
                or $glob eq 'import'; # But not import itself

        *{$pkg . "::$glob"} = \&{"Love::$glob"}; # Create a glob for the package.
	# Note, this is a bit magical, since globs can inference the assigned type.
    }
}

$Love::printer = "<3";

sub printer {
    print "a normal sub that just prints\n";
}

sub love {
    return join " <3 ", @_;
}

1;
