package XML::Toolkit::RNG::Grammar::Define::Choice::Element::Attribute;
use Moose;
use MooseX::AttributeHelpers;

has 'data_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Choice::Element::Attribute::Data]',
    is          => 'ro',
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'data' },
    description => { sort_order => 0, },
);
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
        sort_order   => 1,
    },
);

no Moose;
