#!/usr/bin/perl
use strict;
use warnings;
use FindBin qw/$Bin/;
use DBIx::Class::Schema::Loader qw/ make_schema_at /;

=head1 SYNOPSIS


    ~/tmp$ attanium-starter.pl --module=MyApp1 \
                                                --author=gordon \
                                                --email="vanamburg@cpan.org" \
                                                --verbose
    Created MyApp1
    Created MyApp1/lib
    Created MyApp1/lib/MyApp1.pm                      # YOUR *CONTROLLER BASE CLASS* !
    Created MyApp1/t
    Created MyApp1/t/pod-coverage.t
    Created MyApp1/t/pod.t
    Created MyApp1/t/01-load.t
    Created MyApp1/t/test-app.t
    Created MyApp1/t/perl-critic.t
    Created MyApp1/t/boilerplate.t
    Created MyApp1/t/00-signature.t
    Created MyApp1/t/www
    Created MyApp1/t/www/PUT.STATIC.CONTENT.HERE
    Created MyApp1/templates/MyApp1/C/Home
    Created MyApp1/templates/MyApp1/C/Home/index.tmpl # DEFAULT HOME PAGE TEMPLATE
    Created MyApp1/Makefile.PL
    Created MyApp1/Changes
    Created MyApp1/README
    Created MyApp1/MANIFEST.SKIP
    Created MyApp1/t/perlcriticrc
    Created MyApp1/lib/MyApp1/C                       # YOUR CONTROLLERS GO HERE 
    Created MyApp1/lib/MyApp1/C/Home.pm               # YOUR *DEFAULT CONTROLLER SUBCLASS*
    Created MyApp1/lib/MyApp1/Dispatch.pm             # YOUR CUSTOM DISPATCHER
    Created MyApp1/config
    Created MyApp1/config/config-dev.pl               # YOU CONFIG -- MUST BE EDITED BY YOU!
    Created MyApp1/script
    Created MyApp1/script/create_dbic_schema.pl       # IMPORTANT HELPER SCRIPT
    Created MyApp1/script/create_controller.pl        # ANOTHER IMPORTANT HELPER SCRIPT.
    Created MyApp1/server.pl                          # SERVER USES YOUR CUSTOM DISPATCH.PM
    Created MyApp1/MANIFEST
    Created starter directories and files

=cut

use Config::Auto;
use FindBin qw/$Bin/;

use lib "$Bin/../lib";

$| = 1;

my $config = Config::Auto::parse( 
	File::Spec->catfile("..","config","config-dev.pl"), format => "perl" 
	);


make_schema_at(
        '<tmpl_var main_module>::DB',
        { debug => 1,relationships => 1, use_namespaces => 1, dump_directory => "$Bin/../lib" },
        [ $config->{db_dsn}, $config->{db_user}, $config->{db_pw} ],
);



=head1 AUTHOR

    Gordon Van Amburg
    CPAN ID: VANAMBURG
    vanamburg at cpan.org

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

