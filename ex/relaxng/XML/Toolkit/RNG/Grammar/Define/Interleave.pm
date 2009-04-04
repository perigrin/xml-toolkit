package XML::Toolkit::RNG::Grammar::Define::Interleave;
use Moose;
use MooseX::AttributeHelpers;

has 'oneOrMore_collection' => (
    isa =>
      'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Interleave::OneOrMore]',
    is          => 'ro',
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'oneOrMore' },
    description => { sort_order => 0, },
);
has 'optional_collection' => (
    isa => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Interleave::Optional]',
    is  => 'ro',
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'optional' },
    description => { sort_order => 1, },
);
has 'ref_collection' => (
    isa => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Interleave::Ref]',
    is  => 'ro',
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'ref' },
    description => { sort_order => 2, },
);
has 'zeroOrMore_collection' => (
    isa =>
      'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Interleave::ZeroOrMore]',
    is          => 'ro',
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'zeroOrMore' },
    description => { sort_order => 3, },
);

no Moose;
