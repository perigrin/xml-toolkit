package XML::Toolkit::RNG::Grammar::Define::Choice::Element::Choice::Attribute::Data;
use Moose;
use MooseX::AttributeHelpers;

has 'type' => (
    isa         => 'Str',
    is          => 'ro',
    metaclass   => 'MooseX::MetaDescription',
    description => {
        Prefix       => "",
        LocalName    => "type",
        node_type    => "attribute",
        Name         => "type",
        NamespaceURI => "",
        sort_order   => 0,
    },
);

no Moose;
