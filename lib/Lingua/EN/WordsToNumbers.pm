package Lingua::EN::WordsToNumbers;

use warnings;
use strict;

use vars qw($VERSION);

$VERSION = 0.1;

use Lingua::EN::Words2Nums ();

sub new
{
  my $class = shift;
  my $self = bless {}, $class;
  
  return $self;
}

sub parse
{
  my ($self, $number) = @_;

  Lingua::EN::Words2Nums::words2nums($number);  
}

sub words2nums
{
  my ($self, $number) = @_;

  Lingua::EN::Words2Nums::words2nums($number);  
}

sub debug
{
  my ($self, $debug) = @_;

  warn $debug;

  if ($debug)
  {
    $Lingua::EN::Words2Nums::debug = 1;
  }
  else
  {
    $Lingua::EN::Words2Nums::debug = 0;
  }

  warn $Lingua::EN::Words2Nums::debug;
}

sub billion
{
  my ($self, $billion) = @_;
  
  $Lingua::EN::Words2Nums::billion = $billion;
}

1;

__END__

=head1 NAME

Lingua::EN::WordsToNumbers - convert numbers written in English to actual numbers

=head1 DESCRIPTION

This module is an OO wrapper for L<Lingua::EN::Words2Nums>, which is very nice, but has an unfortunate name (which doesn't help when you're searching CPAN for modules that turn words into numbers).

=head1 SYNOPSIS

   use Lingua::EN::WordsToNumbers;
   
   my $numberizer = Lingua::EN::WordsToNumbers->new;
   
   print $numberizer->parse("Forty-two"); # "42"

   $numberizer->debug(1);                 # debug on
   $numberizer->debug(undef);             # debug off
   
   $numberizer->billion(10**12);          # use "English billion"
   
=head1 METHODS

=head2 C<new>

   my $numberizer = Lingua::EN::WordsToNumbers->new;

Gives you a new "object". Doesn't really do much.

=head2 C<parse>

   print $numberizer->parse("Forty-two"); # "42"

An alias for L<Lingua::EN::Words2Nums>'s C<words2nums> method. Read that module's documentation to see how it works. You can also call this method as C<words2nums> if you really want to.

=head2 C<debug>

   $numberizer->debug(1);
   
Set L<Lingua::EN::Words2Nums> debug mode. True values are on, anything else is off.
   
=head2 C<billion>

   $numberizer->billion(10**12);

Define the value of a billion (C<$Lingua::EN::Words2Nums::billion>).

=head1 AUTHOR

Earle Martin <EMARTIN@cpan.org>

=over 4 

=item * L<http://purl.oclc.org/net/earlemartin/>

=back

=head1 CREDITS

Thanks to Joey Hess (JOEY) for writing L<Lingua::EN::Words2Nums> which does the real work.

This module was jointly conceived with Leon Brocard (LBROCARD) one lunchtime.

=head1 LICENSE

This work is licensed under the Creative Commons Attribution-ShareAlike License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/1.0/ or send a letter to Creative Commons, 559 Nathan Abbott Way, Stanford, California 94305, USA.

=cut
