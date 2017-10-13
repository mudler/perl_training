#!/usr/bin/perl
#
# $@ is always defined
print "Error is always defined\n" if defined $@;

{
    eval { die "death" };
    print $@ if $@;
}

# $@ is propagated.
print $@ if $@;

# Even if called inside a Package method
Boo->death();
print $@ if $@;

{

    package Boo;

    sub death {
        eval { die "death 2" };
    }
}
