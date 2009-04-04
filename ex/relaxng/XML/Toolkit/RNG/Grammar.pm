package XML::Toolkit::RNG::Grammar;
use Moose;
use MooseX::AttributeHelpers;

has 'datatypeLibrary' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    description => {
        Prefix       => "",
        LocalName    => "datatypeLibrary",
        node_type    => "attribute",
        Name         => "datatypeLibrary",
        NamespaceURI => "",
        sort_order   => 0,
    },
);
has 'define_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'define' },
    description => { sort_order => 1, },
);
has 'ns' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    description => {
        Prefix       => "",
        LocalName    => "ns",
        node_type    => "attribute",
        Name         => "ns",
        NamespaceURI => "",
        sort_order   => 2,
    },
);
has 'start_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Start]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'start' },
    description => { sort_order => 3, },
);
has 'xmlns' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    description => {
        Prefix       => "",
        LocalName    => "xmlns",
        node_type    => "attribute",
        Name         => "xmlns",
        NamespaceURI => "",
        sort_order   => 4,
    },
);

no Moose;
1;
__END__
