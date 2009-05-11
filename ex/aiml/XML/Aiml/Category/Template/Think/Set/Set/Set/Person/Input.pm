package XML::Aiml::Category::Template::Think::Set::Set::Set::Person::Input;
use Moose;
use MooseX::AttributeHelpers;

has 'index' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "index",
        node_type    => "attribute",
        Name         => "index",
        NamespaceURI => "",
        sort_order   => 0,
    },
);

no Moose;
1;
__END__
