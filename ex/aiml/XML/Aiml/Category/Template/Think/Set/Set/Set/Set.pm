package XML::Aiml::Category::Template::Think::Set::Set::Set::Set;
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
    isa =>
'ArrayRef[XML::Aiml::Category::Template::Think::Set::Set::Set::Set::Person]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'person' },
    description => { sort_order => 1, },
);

no Moose;
1;
__END__
