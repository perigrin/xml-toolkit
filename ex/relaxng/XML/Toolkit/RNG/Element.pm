package XML::Toolkit::RNG::Element;
use Moose;
use MooseX::AttributeHelpers;
use XML::Toolkit;

has 'anyName_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::AnyName]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'anyName' },
    description => { sort_order => 0, },
);
has 'attribute_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Attribute]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'attribute' },
    description => { sort_order => 1, },
);
has 'choice_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Choice]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'choice' },
    description => { sort_order => 2, },
);
has 'data_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Data]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'data' },
    description => { sort_order => 3, },
);
has 'interleave_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Interleave]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'interleave' },
    description => { sort_order => 4, },
);
has 'name' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "name",
        node_type    => "attribute",
        Name         => "name",
        NamespaceURI => "",
        sort_order   => 5,
    },
);
has 'optional_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Optional]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'optional' },
    description => { sort_order => 6, },
);
has 'ref_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Ref]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'ref' },
    description => { sort_order => 7, },
);
has 'text_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Text]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'text' },
    description => { sort_order => 8, },
);
has 'zeroOrMore_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::ZeroOrMore]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'zeroOrMore' },
    description => { sort_order => 9, },
);

no Moose;
1;
__END__
