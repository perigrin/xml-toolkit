package XML::Aiml::Category::Template::Think::Set::Set;
use Moose;
use MooseX::AttributeHelpers;

has 'get_collection' => (
    isa    => 'ArrayRef[XML::Aiml::Category::Template::Think::Set::Set::Get]',
    is     => 'ro',
    traits => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'get' },
    description => { sort_order => 0, },
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
        sort_order   => 1,
    },
);
has 'person_collection' => (
    isa => 'ArrayRef[XML::Aiml::Category::Template::Think::Set::Set::Person]',
    is  => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'person' },
    description => { sort_order => 2, },
);
has 'set_collection' => (
    isa    => 'ArrayRef[XML::Aiml::Category::Template::Think::Set::Set::Set]',
    is     => 'ro',
    traits => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'set' },
    description => { sort_order => 3, },
);
has 'star_collection' => (
    isa    => 'ArrayRef[XML::Aiml::Category::Template::Think::Set::Set::Star]',
    is     => 'ro',
    traits => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'star' },
    description => { sort_order => 4, },
);
has 'text' => (
    isa         => 'Str',
    is          => 'rw',
    traits      => ['XML'],
    description => { sort_order => 5, },
);

no Moose;
1;
__END__
