package XML::Toolkit::RNG::Grammar::Define::ZeroOrMore::Element::ZeroOrMore;
use Moose;
use MooseX::AttributeHelpers;

has 'choice_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::ZeroOrMore::Element::ZeroOrMore::Choice]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'choice' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
