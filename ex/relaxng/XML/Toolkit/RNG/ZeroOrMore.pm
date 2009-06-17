package XML::Toolkit::RNG::ZeroOrMore;
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
has 'choice_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Choice]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'choice' },
    description => { sort_order => 1, },
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
    description => { sort_order => 2, },
);

no Moose;
1;
__END__
