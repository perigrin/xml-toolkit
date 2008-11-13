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
requires 'MooseX::MetaDescription'    => '0.03';
requires 'MooseX::Types::Path::Class' => '0.04';
requires 'XML::SAX::Writer'           => '0.50';
requires 'Encode'                     => '2.26';
requires 'Template'                   => '2.20';

build_requires 'Test::More' => '0.42';

no_index 'directory' => 'ex';

WriteAll;
