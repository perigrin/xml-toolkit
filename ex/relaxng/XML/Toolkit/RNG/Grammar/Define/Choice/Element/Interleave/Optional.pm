package XML::Toolkit::RNG::Grammar::Define::Choice::Element::Interleave::Optional;
use Moose;
use MooseX::AttributeHelpers;

has 'ref_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Choice::Element::Interleave::Optional::Ref]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'ref' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
