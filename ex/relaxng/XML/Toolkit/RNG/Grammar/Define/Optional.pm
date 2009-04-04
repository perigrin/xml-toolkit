package XML::Toolkit::RNG::Grammar::Define::Optional;
use Moose;
use MooseX::AttributeHelpers;

has 'attribute_collection' => (
    isa => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Optional::Attribute]',
    is  => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'attribute' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
