package XML::Toolkit::RNG::NsName;
use Moose;
use MooseX::AttributeHelpers;
use XML::Toolkit;

has 'ns' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "ns",
        node_type    => "attribute",
        Name         => "ns",
        NamespaceURI => "",
        sort_order   => 0,
    },
);

no Moose;
1;
__END__
