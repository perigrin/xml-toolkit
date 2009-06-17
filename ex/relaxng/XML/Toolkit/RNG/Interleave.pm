package XML::Toolkit::RNG::Interleave;
use Moose;
use MooseX::AttributeHelpers;
use XML::Toolkit;

has 'group_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Group]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'group' },
    description => { sort_order => 0, },
);
has 'oneOrMore_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::OneOrMore]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'oneOrMore' },
    description => { sort_order => 1, },
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
    description => { sort_order => 2, },
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
    description => { sort_order => 3, },
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
    description => { sort_order => 4, },
);

no Moose;
1;
__END__
