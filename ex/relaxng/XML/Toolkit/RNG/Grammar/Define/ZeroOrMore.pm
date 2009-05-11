package XML::Toolkit::RNG::Grammar::Define::ZeroOrMore;
use Moose;
use MooseX::AttributeHelpers;

has 'attribute_collection' => (
    isa =>
      'ArrayRef[XML::Toolkit::RNG::Grammar::Define::ZeroOrMore::Attribute]',
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
    isa => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::ZeroOrMore::Element]',
    is  => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'element' },
    description => { sort_order => 1, },
);

no Moose;
1;
__END__
