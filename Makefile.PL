# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# Define metadata
name 'XML-Toolkit';
all_from 'lib/XML/Toolkit.pm';

# Specific dependencies
requires 'Moose'                      => '0.60';
requires 'Moose::Autobox'             => '0.08';
requires 'MooseX::AttributeHelpers'   => '0.13';
requires 'XML::SAX'                   => '0.96';
requires 'MooseX::Types::Path::Class' => undef;
requires 'XML::SAX::Writer'           => undef;
requires 'Encode'                     => undef;
requires 'Template'                   => undef;

build_requires 'Test::More' => '0.42';

no_index 'directory' => 'ex';

WriteAll;
