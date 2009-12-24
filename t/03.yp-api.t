#!/usr/bin/perl -w
use strict;
use Test::More;
use Test::XML;

use aliased 'XML::Toolkit::Builder';
use aliased 'XML::Toolkit::Loader';
use aliased 'XML::Toolkit::Generator';

use LWP::Simple;
my $xml = get 'http://www.youporn.com/api/iptv/1.0/1/listing/straight/rating/1';

my $map = {
    'http://www.w3.org/2005/Atom'                 => 'YP::XML::Atom',
    'http://www.w3.org/1999/02/22-rdf-syntax-ns#' => 'YP::XML::RDF',
    'http://purl.org/dc/elements/1.1/'            => 'YP::XML::DC',
    'http://a9.com/-/spec/opensearch/1.1/'        => 'YP::XML::OpenSearch',
    'http://search.yahoo.com/mrss/'               => 'YP::XML::Media',
    'http://youporn.com/schemas/2009/'            => 'YP::XML::YP',
    'http://purl.org/rss/1.0/modules/image/'      => 'YP::XML::Image',
    'http://xmlns.com/foaf/0.1/'                  => 'YP::XML::Foaf',
};

my $builder = Builder->new( { namespace_map => $map } );
$builder->parse_string($xml);
my $code = $builder->render();

#diag $code;
eval $code;
if ($@) {
    diag "Couldn't EVAL code $@";
    done_testing;
    exit;
}
can_ok( 'YP::XML::Atom::Feed', 'add_entry' );
my $loader = Loader->new( { namespace_map => $map } );
$loader->parse_string($xml);
my $root = $loader->root_object;
isa_ok( $root, 'YP::XML::Atom::Feed' );

ok( scalar @{ $root->entry_collection } > 0, 'have entries' );

my $generator = Generator->new(
    {
        namespace     => 'http://www.w3.org/2005/Atom',
        namespace_map => {
            ''         => 'http://www.w3.org/2005/Atom',
            rdf        => 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
            dc         => 'http://purl.org/dc/elements/1.1/',
            openSearch => 'http://a9.com/-/spec/opensearch/1.1/',
            media      => 'http://search.yahoo.com/mrss/',
            yp         => 'http://youporn.com/schemas/2009/',
            image      => 'http://purl.org/rss/1.0/modules/image/',
            foaf       => 'http://xmlns.com/foaf/0.1/',

        }
    }
);

$generator->render_object($root);

my $out_xml = join '', $generator->output;
is_xml( $out_xml, $xml, 'XML compares' );
done_testing;
