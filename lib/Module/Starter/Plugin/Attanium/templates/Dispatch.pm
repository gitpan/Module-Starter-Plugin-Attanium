package <tmpl_var main_module>::Dispatch;

use base 'CGI::Application::Dispatch';

sub dispatch_args {
	return {
		prefix      => <tmpl_var main_module>::C,
		args_to_new =>{PARAMS =>{cfg_file => $ENV{CONFIG_FILE}}},
		table       => [
			''                   => {app => 'home'},
			':app'               => {},
			':app/:rm/:id?'      => {},
			':app/:rm/:id/:extra1?' => {},

		],
		default => 'home'

	};
}
1;
