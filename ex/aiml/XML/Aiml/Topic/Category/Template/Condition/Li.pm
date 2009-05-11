package XML::Aiml::Topic::Category::Template::Condition::Li;
use Moose;
use MooseX::AttributeHelpers;

has 'srai_collection' => (
    isa =>
      'ArrayRef[XML::Aiml::Topic::Category::Template::Condition::Li::Srai]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'srai' },
    description => { sort_order => 0, },
);
has 'star_collection' => (
    isa =>
      'ArrayRef[XML::Aiml::Topic::Category::Template::Condition::Li::Star]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'star' },
    description => { sort_order => 1, },
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
        sort_order   => 2,
    },
);

no Moose;
1;
__END__
