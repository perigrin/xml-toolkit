#!/usr/bin/perl -w
use strict;
use Test::More;
use Test::XML;

use aliased 'XML::Toolkit::Builder';
use aliased 'XML::Toolkit::Loader';
use aliased 'XML::Toolkit::Generator';

my $xml = '<foo><bar /></foo>';

ok( my $builder = Builder->new(), 'Build XML::Toolkit::Builder' );
$builder->parse_string($xml);
ok( my $code = $builder->render(), 'render code' );

eval $code;

if ($@) {
    diag "Couldn't EVAL code $@";
    done_testing;
    exit;
}

ok( my $loader = Loader->new(), 'Build XML::Toolkit::Loader' );
$loader->parse_string($xml);
ok( my $root = $loader->root_object, 'extract root object' );

ok( scalar @{ $root->bar_collection } > 0, 'have entries' );

ok( my $generator = Generator->new(), 'Build XML::Toolkit::Loader' );
$generator->render_object($root);
is_xml( $xml, join( '', $generator->output ), 'XML compares' );

done_testing;
