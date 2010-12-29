# Load the Module::Install bundled in ./inc/
use inc::Module::Install 0.91;

# Define metadata
name 'XML-Toolkit';
all_from 'lib/XML/Toolkit.pm';

# Specific dependencies
requires 'aliased'                    => undef;
requires 'Bread::Board'               => undef;
requires 'Devel::PackagePath'         => '0.01';
requires 'Moose'                      => '0.92';
requires 'MooseX::Aliases'            => undef;
requires 'MooseX::App::Cmd'           => undef;
requires 'MooseX::MetaDescription'    => '0.03';
requires 'MooseX::Types::Path::Class' => '0.04';
requires 'namespace::autoclean'       => undef;
requires 'Template'                   => '2.20';
requires 'XML::SAX'                   => '0.96';
requires 'XML::SAX::Writer'           => '0.50';

build_requires 'Test::More' => '0.94';
build_requires 'Test::XML';
build_requires 'Test::Exception';

tests_recursive;

no_index 'directory' => 'ex';
install_script 'bin/xmltk';

auto_set_repository;
auto_manifest;
WriteAll;
