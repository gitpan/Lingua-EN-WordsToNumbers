#!/usr/bin/perl

use warnings;
use strict;

use Module::Build;

Module::Build->new(
                   module_name       =>   'Lingua::EN::WordsToNumbers',
                   requires          => { 'Lingua::EN::Words2Nums' => 0    },
                   install_requires  => { 'Module::Build'          => 0.20 },
                   license           => 'perl'
                  )->create_build_script;
