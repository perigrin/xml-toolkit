package XML::Toolkit::RNG::Grammar::Define::Optional::Attribute::Choice;
use Moose;
use MooseX::AttributeHelpers;

has 'value_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Optional::Attribute::Choice::Value]',
    is          => 'ro',
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'value' },
    description => { sort_order => 0, },
);

no Moose;
