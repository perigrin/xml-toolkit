#!/usr/bin/perl -w
use strict;
use Test::More;
use Test::XML;

use aliased 'XML::Toolkit::Builder';
use aliased 'XML::Toolkit::Loader';
use aliased 'XML::Toolkit::Generator';

my $xml = '<foo><bar /></foo>';

my $builder = Builder->new();
ok( $builder, 'Build XML::Toolkit::Builder' );
$builder->parse_string($xml);
my $code = $builder->render();

eval $code;

if ($@) {
    diag "Couldn't EVAL code $@";
    done_testing;
    exit;
}

my $loader = Loader->new();
ok( $loader, 'Build XML::Toolkit::Loader' );
$loader->parse_string($xml);
my $root = $loader->root_object;

ok( scalar @{ $root->bar_collection } > 0, 'have entries' );

my $generator = Generator->new( );
ok( $generator, 'Build XML::Toolkit::Loader' );
$generator->render_object($root);
my $out_xml = join '', $generator->output;
is_xml( $out_xml, $xml, 'XML compares' );

done_testing;
