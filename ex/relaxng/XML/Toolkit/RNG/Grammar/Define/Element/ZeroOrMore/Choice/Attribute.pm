package XML::Toolkit::RNG::Grammar::Define::Element::ZeroOrMore::Choice::Attribute;
use Moose;
use MooseX::AttributeHelpers;

has 'anyName_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Element::ZeroOrMore::Choice::Attribute::AnyName]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'anyName' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
