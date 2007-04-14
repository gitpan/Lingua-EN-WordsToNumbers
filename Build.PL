use Module::Build;

Module::Build->new(
	module_name        =>   'Lingua::EN::WordsToNumbers',
	license            => 'perl',
	build_requires     => {
		'Test::Pod'           => 0,
		'Test::Pod::Coverage' => 0,
		'Test::Warn'          => 0,
	},
	requires           => {
		'Lingua::EN::Words2Nums' => 0,
	},
	dist_version_from  => 'lib/Lingua/EN/WordsToNumbers.pm',
	create_makefile_pl => 'traditional',
)->create_build_script();
