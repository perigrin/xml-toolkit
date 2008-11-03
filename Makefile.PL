# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# Define metadata
name 'XML-Toolkit';
all_from 'lib/XML/Toolkit.pm';

# Specific dependencies
requires 'Moose'                    => '0.60';
requires 'Moose::Autobox'           => '0.08';
requires 'MooseX::AttributeHelpers' => '0.13';
requires XML::SAX::Parser           => undef;
requires XML::SAX::ParserFactory    => undef;

build_requires 'Test::More' => '0.42';

no_index 'directory' => 'ex';

auto_install;
WriteAll;
