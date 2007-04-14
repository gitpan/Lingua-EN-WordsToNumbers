#!/usr/bin/perl

use warnings;
use strict;

use Test::More tests => 10;
use Test::Warn;

BEGIN { use_ok('Lingua::EN::WordsToNumbers', qw(words_to_numbers)) }
 
is( words_to_numbers('Forty-two'), 42, 'words_to_numbers()' );

warning_is
  { Lingua::EN::WordsToNumbers::set_debug() } 
  'No value given to set_debug()', 
  'set_debug() without value warns';
  
warning_is
  { Lingua::EN::WordsToNumbers::set_debug('fred') } 
  "Unknown value 'fred' given to set_debug()", 
  'set_debug() with bogus value warns';

Lingua::EN::WordsToNumbers::set_debug('y');

warning_like
  { Lingua::EN::WordsToNumbers::set_billion(10**12) }
  qr/Value of billion set to 1000000000000/, 
  'set_billion() in debug mode';

is( words_to_numbers('One billion'), 1000000000000, 'set_billion()' );

# Deprecated methods. Resetting to default values for tests...
Lingua::EN::WordsToNumbers::set_debug('n');
Lingua::EN::WordsToNumbers::set_billion(10**9);

my $numberizer = Lingua::EN::WordsToNumbers->new;
isa_ok( $numberizer, 'Lingua::EN::WordsToNumbers' );

is ($numberizer->words2nums('Forty-two'), 42, 'words2nums()');
is ($numberizer->parse("Forty-two"), 42, 'parse()');

$numberizer->billion(10**12);
is ($numberizer->parse("One billion"), 1000000000000, 'billion()');
