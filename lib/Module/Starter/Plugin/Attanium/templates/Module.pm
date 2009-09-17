package <tmpl_var module>;

use base 'Attanium';
use FindBin qw/$Bin/;
use  <tmpl_var module>::DB;


=head1 NAME

<tmpl_var module> 

=head1 SYNOPSIS

    A controller module for <tmpl_var main_module>.

=head1 DESCRIPTION

This module acts as the base class for Controllers for this app. Subclasses are found
in the <tmpl_var module>::C package.

=head1 METHODS

=head2 SUBCLASSED METHODS

=head3 error

This error page is suitable for development but you will want 
to customize this runmode for your application.

=cut 


=head3 cgiapp_init

Initializes the Controller base class for app, configures DBIx::Class plugin,
sets an error mode and configures the TT template directory.

Use 'setup' in your subclasses to futher configure for each Controller 
subclass.  'setup' is called after 'cgiapp_init'.

TODO: change all these values to ones more appropriate for your application.

=cut


# ---------------------------------------------------------------------------------------- #
# init app here.  setup is called after so shouldput app instance specifics there
# ---------------------------------------------------------------------------------------- #
sub error {
	my $c = shift;
	
	my $result = "<h1>error</h1>";
	$result .= "<h2>$@</h2>";
	return $result;

}



sub cgiapp_init {
	my $self = shift;
	
	#
	# set a method to catch any unhandled errors
	#
	$self->error_mode("error");

	#
	# setup main tt2 template paths
	#
	my @template_paths = ($self->cfg("tt2_dir") );
	$self->tt_include_path( \@template_paths );

	
	#
	# Configure CGI::Application::Plugin::DBIC::Schema
	#
	
	# allow this statement even if MyApp::DB.pm has not
	# yet been created.

	$self->dbic_config(
	    {
		schema       => '<tmpl_var module>::DB',
		connect_info => [
		    $self->cfg('db_dsn'), 
		    $self->cfg('db_user'),
		    $self->cfg('db_pw')
		    ]    # use same args as DBI connect
	    }
	    );
	

# ------------------------------------------------------- #
#    Optionally you can configire a wrapper template 
#    for all pages in the application.
#
#     $self->tt_config( 
#	TEMPLATE_OPTIONS => { WRAPPER => 'site_wrapper.tmpl' } );
#
# ------------------------------------------------------- #
#       SOME USEFUL CONFIGURATION OPTIONS FOR 
#       CGI::Application::Plugin::ValidateRM.
#
#	$self->param('dfv_defaults')
#	  || $self->param(
#		'dfv_defaults',
#		{
#			missing_optional_valid => 1,
#			filters                => 'trim',
#			msgs                   => {
#				any_errors => 'some_errors',
#				prefix     => 'err_',
#				invalid    => 'Invalid',
#				missing    => 'Missing',
#				format     => '<span class="dfv-errors">%s</span>',
#			},
#		}
#	  );
# ------------------------------------------------------- #


}

1;



=pod

TODO: Other methods in your public interface go here.

=cut

# TODO: Private methods go here. Start their names with an _ so they are skipped
# by Pod::Coverage.

=head1 BUGS AND LIMITATIONS

There are no known problems with this module.

Please report any bugs or feature requests to
C<bug-<tmpl_var rtname> at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=<tmpl_var distro>>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SEE ALSO

L<CGI::Application>

=head1 THANKS

List acknowledgements here or delete this section.

=head1 AUTHOR

<tmpl_var author>, C<< <<tmpl_var email_obfuscated>> >>

=head1 LICENSE AND COPYRIGHT

Copyright <tmpl_var year> <tmpl_var author>, all rights reserved.

<tmpl_var license_blurb>

=cut


__END__
