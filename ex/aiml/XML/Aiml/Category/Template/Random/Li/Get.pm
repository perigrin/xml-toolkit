package XML::Aiml::Category::Template::Random::Li::Get;
use Moose;
use MooseX::AttributeHelpers;

has 'have' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "have",
        node_type    => "attribute",
        Name         => "have",
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
has 'text' => (
    isa         => 'Str',
    is          => 'rw',
    traits      => ['XML'],
    description => { sort_order => 2, },
);

no Moose;
1;
__END__
