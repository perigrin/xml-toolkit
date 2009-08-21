use Test::More tests => 1;

BEGIN {
    use_ok('XML::Toolkit');
}

diag("Testing XML::Toolkit $XML::Toolkit::VERSION");
diag("\twith Moose $Moose::VERSION");
diag("\tand CMOP $Class::MOP::VERSION");
