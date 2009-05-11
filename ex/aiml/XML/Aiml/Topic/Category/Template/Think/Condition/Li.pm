package XML::Aiml::Topic::Category::Template::Think::Condition::Li;
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
has 'set_collection' => (
    isa =>
'ArrayRef[XML::Aiml::Topic::Category::Template::Think::Condition::Li::Set]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'set' },
    description => { sort_order => 1, },
);
has 'value' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "value",
        node_type    => "attribute",
        Name         => "value",
        NamespaceURI => "",
        sort_order   => 2,
    },
);

no Moose;
1;
__END__
