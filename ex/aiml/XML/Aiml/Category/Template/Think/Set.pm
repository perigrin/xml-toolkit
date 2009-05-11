package XML::Aiml::Category::Template::Think::Set;
use Moose;
use MooseX::AttributeHelpers;

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
        sort_order   => 0,
    },
);
has 'person_collection' => (
    isa        => 'ArrayRef[XML::Aiml::Category::Template::Think::Set::Person]',
    is         => 'ro',
    traits     => ['XML'],
    metaclass  => 'Collection::Array',
    lazy       => 1,
    auto_deref => 1,
    default    => sub { [] },
    provides   => { push => 'person' },
    description => { sort_order => 1, },
);
has 'set_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Think::Set::Set]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'set' },
    description => { sort_order => 2, },
);
has 'srai_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Think::Set::Srai]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'srai' },
    description => { sort_order => 3, },
);
has 'text' => (
    isa         => 'Str',
    is          => 'rw',
    traits      => ['XML'],
    description => { sort_order => 4, },
);

no Moose;
1;
__END__
