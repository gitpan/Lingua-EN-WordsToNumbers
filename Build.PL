#!/usr/bin/perl

use strict;

use Module::Build;

Module::Build->new(
	module_name        => 'Lingua::EN::WordsToNumbers',
	requires           => {
                         'Lingua::EN::Words2Nums' => 0,
		                    },
  install_requires   => {
                         'Module::Build'          => 0.20,
                        },
	license            => 'unrestricted'
)->create_build_script;
