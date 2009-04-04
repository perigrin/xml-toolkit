package XML::Toolkit::RNG::Grammar::Define::Choice::Element::Interleave::Group;
use Moose;
use MooseX::AttributeHelpers;

has 'optional_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Choice::Element::Interleave::Group::Optional]',
    is          => 'ro',
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'optional' },
    description => { sort_order => 0, },
);
has 'zeroOrMore_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Choice::Element::Interleave::Group::ZeroOrMore]',
    is          => 'ro',
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'zeroOrMore' },
    description => { sort_order => 1, },
);

no Moose;
