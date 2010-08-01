#!/usr/bin/env perl
use Test::More;
use Path::Class qw(dir);
my $test_dir = dir('t/data');

use aliased 'XML::Toolkit::Config::Container' => 'XMLTK::App';
use aliased 'XML::Toolkit::Loader';
use aliased 'XML::Toolkit::Generator';

ok(
    my $builder = XMLTK::App->new(
        namespace_map => {
            ''                       => 'XMLTK::Test',
            'http://example.org/my/' => 'My'
        }
      )->builder
);

my $xml = '<foo xmlns:my="http://example.org/my/"><my:bar /></foo>';

$builder->parse_string($xml);
my $class = $builder->render;

::ok( defined $class, 'build a class' );
eval $class;
::can_ok( 'XMLTK::Test::Foo', 'new' );
::can_ok( 'My::Bar',          'new' );

ok(
    my $loader = XMLTK::App->new(
        namespace     => 'XMLTK::Test',
        namespace_map => {
            ''                       => 'XMLTK::Test',
            'http://example.org/my/' => 'My'
        }
      )->loader,
    'Build XML::Toolkit::Loader'
);
$loader->parse_string($xml);
my $tree = $loader->root_object;
::ok( $tree, 'parse_string' );

my $tree2 = XMLTK::Test::Foo->new( bar_collection => [ My::Bar->new() ] );

ok( my $generator = Generator->new() );
$generator->render_object($tree2);
::ok( my @output = $generator->output, 'got output' );

done_testing;
