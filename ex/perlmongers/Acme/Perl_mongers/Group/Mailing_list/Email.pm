package Acme::Perl_mongers::Group::Mailing_list::Email;
use Moose;
use MooseX::AttributeHelpers;

has 'text' => (
     isa         => 'Str',
     is          => 'rw',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ], description => {
     sort_order => 0,
 },
);
has 'tpye' => (
     isa         => 'Str',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ], description => {
     Prefix => "",
     LocalName => "tpye",
     node_type => "attribute",
     Name => "tpye",
     NamespaceURI => "",
     sort_order => 1,
 },
);
has 'type' => (
     isa         => 'Str',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ], description => {
     Prefix => "",
     LocalName => "type",
     node_type => "attribute",
     Name => "type",
     NamespaceURI => "",
     sort_order => 2,
 },
);

no Moose;
1;
__END__
