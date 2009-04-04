package XML::Toolkit::RNG::Grammar::Define::Choice::Element::Data;
use Moose;
use MooseX::AttributeHelpers;

has 'type' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    description => {
        Prefix       => "",
        LocalName    => "type",
        node_type    => "attribute",
        Name         => "type",
        NamespaceURI => "",
        sort_order   => 0,
    },
);

no Moose;
1;
__END__
