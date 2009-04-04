package XML::Toolkit::RNG::Grammar::Define::Interleave::Optional::Element;
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
has 'ref_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Interleave::Optional::Element::Ref]',
    is          => 'ro',
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'ref' },
    description => { sort_order => 1, },
);

no Moose;
