#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 10;

use XML::Toolkit::Builder ();
use XML::Toolkit::Loader  ();

my $xml1 = '<root xmlns="abc">test1</root>';
my $xml2 = '<my:root xmlns:my="abc">test2</my:root>';

my $args = { namespace_map => { 'abc' => 'ABC' } };

{
    my $builder = XML::Toolkit::Builder->new($args);
    $builder->parse_string($xml1);
    my $code = $builder->render();
    eval $code;
    my $root = ABC::Root->new();
    isa_ok( $root, 'ABC::Root' );
};

{
    my $loader = XML::Toolkit::Loader->new($args);
    $loader->parse_string($xml1);
    my $root = $loader->root_object;
    isa_ok( $root, 'ABC::Root' );
    is( $root->text, 'test1', 'root node text was loaded correctly' );
};

{
    my $loader = XML::Toolkit::Loader->new($args);
    $loader->parse_string($xml2);
    my $root = $loader->root_object;
    isa_ok( $root, 'ABC::Root' );
    is( $root->text, 'test2', 'root node text was loaded correctly' );
};
    
$args = { namespace_map => { 'abc' => 'XYZ' } };

{
    
    my $builder = XML::Toolkit::Builder->new($args);
    $builder->parse_string($xml2);
    my $code = $builder->render();
    eval $code;
    my $root = XYZ::Root->new();
    isa_ok( $root, 'XYZ::Root' );
};

{
    my $loader = XML::Toolkit::Loader->new($args);
    $loader->parse_string($xml1);
    my $root = $loader->root_object;
    isa_ok( $root, 'XYZ::Root' );
    ok( $root->text eq 'test1', 'root node text was not loaded correctly' );
};

{
    my $loader = XML::Toolkit::Loader->new($args);
    $loader->parse_string($xml2);
    my $root = $loader->root_object;
    isa_ok( $root, 'XYZ::Root' );
    ok( $root->text eq 'test2', 'root node text was not loaded correctly' );
};
