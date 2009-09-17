
use ExtUtils::MakeMaker;


WriteMakefile(
    NAME         => 'Module::Starter::Plugin::Attanium',
    VERSION_FROM => 'lib/Module/Starter/Plugin/Attanium.pm',   # finds \$VERSION
    PREREQ_PM  => {
	'DBIx::Class::Schema::Loader' => 0,
	'ExtUtils::Command'           => 0,
	'File::Basename'              => 0,
	'File::Spec'                  => 0,
	'FindBin'                     => 0,
	'File::Slurp'                 => 0,
	'HTML::Template'              => 0,
	'Module::Signature'           => 0,
	'Test::WWW::Mechanize::CGIApp'=> 0,
	'Module::Starter'             => 0,
	'Pod::Coverage'               => '0.18',
	'Pod::Usage'                  => 0,
	'Test::More'                  => 0,
	'Test::Pod'                   => '1.22',
	'Test::Pod::Coverage'         => '1.08',
    },
    INSTALLDIRS => 'site',
    PL_FILES    => {},
    EXE_FILES => ['scripts/attanium-starter.pl'],
    
    );
