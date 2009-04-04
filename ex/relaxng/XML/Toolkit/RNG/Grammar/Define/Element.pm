package XML::Toolkit::RNG::Grammar::Define::Element;
use Moose;
use MooseX::AttributeHelpers;

has 'anyName_collection' => (
    isa => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Element::AnyName]',
    is  => 'ro',
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'anyName' },
    description => { sort_order => 0, },
);
has 'attribute_collection' => (
    isa => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Element::Attribute]',
    is  => 'ro',
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'attribute' },
    description => { sort_order => 1, },
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
        sort_order   => 2,
    },
);
has 'ref_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Element::Ref]',
    is          => 'ro',
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'ref' },
    description => { sort_order => 3, },
);
has 'zeroOrMore_collection' => (
    isa => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Element::ZeroOrMore]',
    is  => 'ro',
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'zeroOrMore' },
    description => { sort_order => 4, },
);

no Moose;
