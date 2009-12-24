use Test::More;

BEGIN {
    use_ok('XML::Toolkit');
    use_ok('XML::Toolkit::Builder');
    use_ok('XML::Toolkit::Loader');
    use_ok('XML::Toolkit::Generator');
}

diag("Testing XML::Toolkit $XML::Toolkit::VERSION");
diag("\twith Moose $Moose::VERSION");
diag("\tand CMOP $Class::MOP::VERSION");

done_testing;
