package XML::Toolkit::RNG::Grammar::Define::Choice::Element::Interleave::Group::Optional;
use Moose;
use MooseX::AttributeHelpers;

has 'element_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Choice::Element::Interleave::Group::Optional::Element]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'element' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
