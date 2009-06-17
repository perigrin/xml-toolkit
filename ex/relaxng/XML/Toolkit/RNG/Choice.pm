package XML::Toolkit::RNG::Choice;
use Moose;
use MooseX::AttributeHelpers;
use XML::Toolkit;

has 'attribute_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Attribute]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'attribute' },
    description => { sort_order => 0, },
);
has 'element_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Element]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'element' },
    description => { sort_order => 1, },
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
    description => { sort_order => 2, },
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
    description => { sort_order => 3, },
);
has 'value_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Value]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'value' },
    description => { sort_order => 4, },
);

no Moose;
1;
__END__
