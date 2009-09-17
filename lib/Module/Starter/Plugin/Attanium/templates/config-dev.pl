use strict;
my %CFG;

$CFG{db_dsn} = "dbi:mysql:myapp1_dev";
$CFG{db_user} = "root";
$CFG{db_pw} = "root";
$CFG{tt2_dir} = "templates";
return \%CFG;
