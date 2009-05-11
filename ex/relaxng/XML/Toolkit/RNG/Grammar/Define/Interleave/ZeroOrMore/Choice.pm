package XML::Toolkit::RNG::Grammar::Define::Interleave::ZeroOrMore::Choice;
use Moose;
use MooseX::AttributeHelpers;

has 'element_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Interleave::ZeroOrMore::Choice::Element]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'element' },
    description => { sort_order => 0, },
);
has 'ref_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Interleave::ZeroOrMore::Choice::Ref]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'ref' },
    description => { sort_order => 1, },
);

no Moose;
1;
__END__
