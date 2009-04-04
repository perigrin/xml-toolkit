package XML::Toolkit::RNG::Grammar::Define::ZeroOrMore::Element::AnyName::Except;
use Moose;
use MooseX::AttributeHelpers;

has 'nsName_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::ZeroOrMore::Element::AnyName::Except::NsName]',
    is          => 'ro',
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'nsName' },
    description => { sort_order => 0, },
);

no Moose;
