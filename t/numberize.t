#!/usr/bin/perl

use warnings;
use strict;

use Test::More tests => 6;

require_ok("Lingua::EN::Words2Nums");
use_ok("Lingua::EN::WordsToNumbers");

my $numberizer = Lingua::EN::WordsToNumbers->new;
isa_ok($numberizer, "Lingua::EN::WordsToNumbers");

is ($numberizer->words2nums("Forty-two"), 42, 'words2nums()');
is ($numberizer->parse("Forty-two"), 42, 'parse()');
$numberizer->billion(10**12);
is ($numberizer->parse("One billion"), 1000000000000, 'billion()');
