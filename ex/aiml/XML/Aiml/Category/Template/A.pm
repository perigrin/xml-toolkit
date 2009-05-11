package XML::Aiml::Category::Template::A;
use Moose;
use MooseX::AttributeHelpers;

has 'href' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "href",
        node_type    => "attribute",
        Name         => "href",
        NamespaceURI => "",
        sort_order   => 0,
    },
);
has 'target' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "target",
        node_type    => "attribute",
        Name         => "target",
        NamespaceURI => "",
        sort_order   => 1,
    },
);
has 'text' => (
    isa         => 'Str',
    is          => 'rw',
    traits      => ['XML'],
    description => { sort_order => 2, },
);

no Moose;
1;
__END__
