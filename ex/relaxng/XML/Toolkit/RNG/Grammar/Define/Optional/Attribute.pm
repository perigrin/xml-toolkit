package XML::Toolkit::RNG::Grammar::Define::Optional::Attribute;
use Moose;
use MooseX::AttributeHelpers;

has 'choice_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Optional::Attribute::Choice]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'choice' },
    description => { sort_order => 0, },
);
has 'data_collection' => (
    isa =>
      'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Optional::Attribute::Data]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'data' },
    description => { sort_order => 1, },
);
has 'name' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    description => {
        Prefix       => "",
        LocalName    => "name",
        node_type    => "attribute",
        Name         => "name",
        NamespaceURI => "",
        sort_order   => 2,
    },
);

no Moose;
1;
__END__
