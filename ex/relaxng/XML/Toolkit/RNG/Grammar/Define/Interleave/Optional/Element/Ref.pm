package XML::Toolkit::RNG::Grammar::Define::Interleave::Optional::Element::Ref;
use Moose;
use MooseX::AttributeHelpers;

has 'name' => (
    isa         => 'Str',
    is          => 'ro',
    metaclass   => 'MooseX::MetaDescription',
    description => {
        Prefix       => "",
        LocalName    => "name",
        node_type    => "attribute",
        Name         => "name",
        NamespaceURI => "",
        sort_order   => 0,
    },
);

no Moose;
