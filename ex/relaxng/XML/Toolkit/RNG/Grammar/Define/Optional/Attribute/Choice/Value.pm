package XML::Toolkit::RNG::Grammar::Define::Optional::Attribute::Choice::Value;
use Moose;
use MooseX::AttributeHelpers;

has 'text' => (
    isa         => 'Str',
    is          => 'rw',
    metaclass   => 'MooseX::MetaDescription',
    description => { sort_order => 0, },
);

no Moose;
