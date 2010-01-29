#!/usr/bin/perl -w
use strict;
use Test::More;
use Test::XML;

use aliased 'XML::Toolkit::Builder';
use aliased 'XML::Toolkit::Loader';
use aliased 'XML::Toolkit::Generator';

my $xml =<<'END_XML';
<?xml version="1.0" encoding="utf-8"?>
<playlist version="1" xmlns="http://xspf.org/ns/0/">
	<trackList>
		<track>
			<album>provider</album>
			<title>Videobox</title>
			<image>playlist/provider.jpg</image>
		</track>

		<track>
			<album>content</album>
			<image>playlist/poster.jpg</image>
			<location>http://server430.files.example.com/e1/hq_flv/321779.flv?h=9d512f72b8b19c863bbee572ad3be219</location>
			<meta rel="thumbvideo">http://server320.files.example.com/e1/preview_flv/321779.flv</meta>
			<meta rel="thumb">http://server320.files.example.com/e1/screenshot2/32/17/321779/321779_preview_{i}.jpg</meta>

			<meta rel="type">flv</meta>
		</track>
	</trackList>
</playlist>

END_XML

my $map = { 'http://xspf.org/ns/0/' => 'XML::XSPF', };

my $builder = Builder->new( { namespace_map => $map } );
$builder->parse_string($xml);
my $code = $builder->render();

eval $code;
if ($@) {
    diag "Couldn't EVAL code $@";
    done_testing;
    exit;
}
my $loader = Loader->new( { namespace_map => $map } );
$loader->parse_string($xml);
my $root = $loader->root_object;

 ok( scalar @{ $root->trackList_collection } > 0, 'have entries' );

my $generator = Generator->new(
    {
        namespace     => 'http://xspf.org/ns/0/',
        namespace_map => { '' => 'http://xspf.org/ns/0/', }
    }
);

$generator->render_object($root);

my $out_xml = join '', $generator->output;
is_xml( $out_xml, $xml, 'XML compares' );
done_testing;
