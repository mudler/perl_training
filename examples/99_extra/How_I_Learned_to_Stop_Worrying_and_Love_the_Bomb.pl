use Data::Dump 'pp';
use Data::Dumper;
use Mojo::Log;
use Scalar::Util 'blessed';
$|++;

sub say { return print "\n" unless @_; print STDERR $_ . "\n" for @_ }

sub safe_call {

    # no critic is for symbol de/reference
    no strict 'refs';    ## no critic
    my $ret;
    say( "Safe call: " . pp(@_) );
    eval {
        $ret =
          blessed( $_[0] ) ? [ +shift->${ \+shift() }( splice @_, 1 ) ]
          : *{"$_[0]::$_[1]"}{CODE}
          ? [ *{"$_[0]::$_[1]"}{CODE}( splice @_, 2 ) ]
          : die(qq|Can't locate object method "$_[1]" via package "$_[0]"|);
    };
    say("Safe call error: $@") and return [] if $@;
    return $ret;
}

my $obj = Mojo::Log->new();

say "Calling debug() on $obj with arguments";
say "=" x 15;
safe_call $obj => debug => qw(something cool to write);
say;

say "Calling 4242() (does not exists) on $obj with arguments";
say "=" x 15;
safe_call $obj => 4242 =>
  qw(method does not exist, so will print nothing, but won't even crash);

say "Calling baz() on foo package (not instantiated) with arguments";
say "=" x 15;
safe_call foo => baz => qw(This would display something?);
say;

{

    package foo;
    use Mojo::Base -base;
    sub baz { main::say @_ }
}
