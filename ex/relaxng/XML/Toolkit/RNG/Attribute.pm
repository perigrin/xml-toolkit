package XML::Toolkit::RNG::Attribute;
use Moose;
use MooseX::AttributeHelpers;
use XML::Toolkit;

has 'anyName_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::AnyName]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'anyName' },
    description => { sort_order => 0, },
);
has 'choice_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Choice]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'choice' },
    description => { sort_order => 1, },
);
has 'data_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Data]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'data' },
    description => { sort_order => 2, },
);
has 'name' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "name",
        node_type    => "attribute",
        Name         => "name",
        NamespaceURI => "",
        sort_order   => 3,
    },
);

no Moose;
1;
__END__
