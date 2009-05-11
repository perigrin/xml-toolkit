package XML::Aiml::Meta;
use Moose;
use MooseX::AttributeHelpers;

has 'content' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "content",
        node_type    => "attribute",
        Name         => "content",
        NamespaceURI => "",
        sort_order   => 0,
    },
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

no Moose;
1;
__END__
