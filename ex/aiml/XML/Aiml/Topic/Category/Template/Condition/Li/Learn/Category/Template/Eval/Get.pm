package XML::Aiml::Topic::Category::Template::Condition::Li::Learn::Category::Template::Eval::Get;
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

no Moose;
1;
__END__
