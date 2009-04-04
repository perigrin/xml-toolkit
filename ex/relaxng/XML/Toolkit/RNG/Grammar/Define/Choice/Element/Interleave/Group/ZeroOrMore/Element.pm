package XML::Toolkit::RNG::Grammar::Define::Choice::Element::Interleave::Group::ZeroOrMore::Element;
use Moose;
use MooseX::AttributeHelpers;

has 'attribute_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Choice::Element::Interleave::Group::ZeroOrMore::Element::Attribute]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'attribute' },
    description => { sort_order => 0, },
);
has 'name' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    description => {
        Prefix       => "",
        LocalName    => "name",
        node_type    => "attribute",
        Name         => "name",
        NamespaceURI => "",
        sort_order   => 1,
    },
);
has 'ref_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Choice::Element::Interleave::Group::ZeroOrMore::Element::Ref]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'ref' },
    description => { sort_order => 2, },
);
has 'text_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Choice::Element::Interleave::Group::ZeroOrMore::Element::Text]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'text' },
    description => { sort_order => 3, },
);

no Moose;
1;
__END__
