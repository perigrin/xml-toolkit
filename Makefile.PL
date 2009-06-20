# Load the Module::Install bundled in ./inc/
use inc::Module::Install 0.91;

# Define metadata
name 'XML-Toolkit';
all_from 'lib/XML/Toolkit.pm';

# Specific dependencies
requires 'Devel::PackagePath'         => '0.01';
requires 'Moose'                      => '0.74';
requires 'Moose::Autobox'             => '0.08';
requires 'MooseX::AttributeHelpers'   => '0.13';
requires 'MooseX::MetaDescription'    => '0.03';
requires 'MooseX::Types::Path::Class' => '0.04';
requires 'MooseX::App::Cmd'           => '0.04';
requires 'Template'                   => '2.20';
requires 'XML::SAX'                   => '0.96';
requires 'XML::SAX::Writer'           => '0.50';

build_requires 'Test::More' => '0.42';

tests_recursive;

no_index 'directory' => 'ex';
install_script 'bin/xmltk';

auto_set_repository;
auto_manifest;
WriteAll;
