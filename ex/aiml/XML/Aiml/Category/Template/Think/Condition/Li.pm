package XML::Aiml::Category::Template::Think::Condition::Li;
use Moose;
use MooseX::AttributeHelpers;

has 'set_collection' => (
    isa => 'ArrayRef[XML::Aiml::Category::Template::Think::Condition::Li::Set]',
    is  => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'set' },
    description => { sort_order => 0, },
);
has 'value' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "value",
        node_type    => "attribute",
        Name         => "value",
        NamespaceURI => "",
        sort_order   => 1,
    },
);

no Moose;
1;
__END__
