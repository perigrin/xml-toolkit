package XML::Toolkit::RNG::Grammar::Define::ZeroOrMore::Element::AnyName;
use Moose;
use MooseX::AttributeHelpers;

has 'except_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::ZeroOrMore::Element::AnyName::Except]',
    is          => 'ro',
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'except' },
    description => { sort_order => 0, },
);

no Moose;
