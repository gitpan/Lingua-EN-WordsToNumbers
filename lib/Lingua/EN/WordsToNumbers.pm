package Lingua::EN::WordsToNumbers;

use warnings;
use strict;

our $VERSION = 0.2;

use base qw(Exporter);
our @EXPORT_OK = qw(words_to_numbers);

use Carp;
use Lingua::EN::Words2Nums ();

sub words_to_numbers {
  Lingua::EN::Words2Nums::words2nums(shift());
}

sub set_debug {
  my $debug = shift;
  
  if (!$debug) {
    warn 'No value given to set_debug()';
    return;
  }
  
  if ($debug =~ /^y$/i) {
    $Lingua::EN::Words2Nums::debug = 1;
  } elsif ($debug =~ /^n$/i) {
    $Lingua::EN::Words2Nums::debug = 0;
  } else {
    carp "Unknown value '$debug' given to set_debug()";
  }
}

sub set_billion {
  my $billion = shift;

  $Lingua::EN::Words2Nums::billion = $billion;

  carp "Value of billion set to $billion."
    if $Lingua::EN::Words2Nums::debug && $Lingua::EN::Words2Nums::debug == 1;
}

# ---------------------------------------------------------------------------
# Curious, deprecated OO methods follow.
# ---------------------------------------------------------------------------

sub new {
  my $class = shift;
  my $self = bless {}, $class;
  
  return $self;
}

sub parse {
  my ($self, $number) = @_;

  Lingua::EN::Words2Nums::words2nums($number);  
}

sub words2nums {
  my ($self, $number) = @_;

  Lingua::EN::Words2Nums::words2nums($number);  
}

sub debug {
  my ($self, $debug) = @_;

  if ($debug) {
    $Lingua::EN::Words2Nums::debug = 1;
  } else {
    $Lingua::EN::Words2Nums::debug = 0;
  }
}

sub billion {
  my ($self, $billion) = @_;
  
  $Lingua::EN::Words2Nums::billion = $billion;
}

1;

__END__

=head1 NAME

Lingua::EN::WordsToNumbers - convert numbers written in English to actual numbers

=head1 DESCRIPTION

This module is a tiny wrapper for L<Lingua::EN::Words2Nums>, which is very nice, but has an unfortunate name (which doesn't help when you're searching CPAN for modules that turn words into numbers).

=head1 SYNOPSIS

   use Lingua::EN::WordsToNumbers qw(words_to_numbers);
   
   print words_to_numbers("Forty-two");             # "42"

   Lingua::EN::WordsToNumbers->set_debug('y');      # debug mode on
   Lingua::EN::WordsToNumbers->set_debug('n');      # debug mode on
   
   Lingua::EN::WordsToNumbers->set_billion(10**12); # use "English billion"
   
=head1 METHODS

=head2 C<words_to_numbers()>

An alias for L<Lingua::EN::Words2Nums>'s C<words2nums> method. Read that 
module's documentation to see how it works. 

=head2 C<set_debug()>

   Lingua::EN::WordsToNumbers->set_debug('y');
   
Set L<Lingua::EN::Words2Nums> debug mode. 'y' or 'Y' is on, 'n' or 'N' is off.
Not exportable; call directly.
   
=head2 C<set_billion()>

   Lingua::EN::WordsToNumbers->set_billion(10**12);

Define the value of a billion (C<$Lingua::EN::Words2Nums::billion>). Not
exportable; call directly.

=head1 DEPRECATED METHODS

You know how, every now and then, you look at some of your code from a few
years ago and think "What the hell was I smoking?" Well, this is that code.
The following methods are a completely pointless OO interface to this module
and I recommend ignoring them completely. They'll go away in the next version
of this module - say in about a year's time.

=head3 C<new()>

   my $numberizer = Lingua::EN::WordsToNumbers->new;

Gives you a new "object". Doesn't really do much.

=head3 C<parse()>

   print $numberizer->parse("Forty-two"); # "42"

An alias for L<Lingua::EN::Words2Nums>'s C<words2nums> method. Read that module's documentation to see how it works.

=head3 C<words2nums()>

   print $numberizer->words2nums("Forty-two"); # "42"

Same as above. Legacy method; deprecated.

=head3 C<debug()>

   $numberizer->debug(1);
   
Set L<Lingua::EN::Words2Nums> debug mode. True values are on, anything else is off.
   
=head3 C<billion()>

   $numberizer->billion(10**12);

Define the value of a billion (C<$Lingua::EN::Words2Nums::billion>).

=head1 AUTHOR

Earle Martin <hex@cpan.org>

L<http://downlode.org/>

=head1 CREDITS

All credit is due to Joey Hess (JOEY) for writing L<Lingua::EN::Words2Nums> which does the actual work.

This module was jointly conceived with Leon Brocard (LBROCARD) one lunchtime.

=head1 LEGAL

Copyright 2004-2007 Earle Martin. All rights reserved.

This module is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=cut
