package XML::Aiml::Category::Template::Date;
use Moose;
use MooseX::AttributeHelpers;

has 'format' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "format",
        node_type    => "attribute",
        Name         => "format",
        NamespaceURI => "",
        sort_order   => 0,
    },
);

no Moose;
1;
__END__
