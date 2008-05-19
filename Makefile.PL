# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# Define metadata
name 'XML-Toolkit';
all_from 'lib/XML/Toolkit.pm';

# Specific dependencies
# requires 'Moose' => '0.25';

build_requires 'Test::More' => '0.42';

no_index 'directory' => 'ex';

sub kwalitee() {
    return <<'END';
use Test::More;
eval "use Test::Kwalitee";
plan skip_all => "Test::Kwalitee not installed; skipping" if $@;
END
}

if ( $ENV{DEVELOPER_TESTS} ) {
    use_test_base;
    use_standard_tests;
    write_test( '000_kwalitee' => kwalitee );
}

auto_install;
WriteAll;
