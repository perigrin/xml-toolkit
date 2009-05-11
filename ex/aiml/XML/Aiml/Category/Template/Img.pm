package XML::Aiml::Category::Template::Img;
use Moose;
use MooseX::AttributeHelpers;

has 'src' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "src",
        node_type    => "attribute",
        Name         => "src",
        NamespaceURI => "",
        sort_order   => 0,
    },
);

no Moose;
1;
__END__
