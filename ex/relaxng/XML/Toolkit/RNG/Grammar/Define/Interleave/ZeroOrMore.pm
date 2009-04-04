package XML::Toolkit::RNG::Grammar::Define::Interleave::ZeroOrMore;
use Moose;
use MooseX::AttributeHelpers;

has 'choice_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Interleave::ZeroOrMore::Choice]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
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
