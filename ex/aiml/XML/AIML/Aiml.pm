package XML::AIML::Aiml;
use Moose;
use MooseX::AttributeHelpers;
use XML::Toolkit;

has 'category_collection' => (
     isa         => 'ArrayRef[XML::AIML::Category]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'category' },
     description => {
         sort_order => 0,
     },
);
has 'version' => (
     isa         => 'Str',
     is          => 'ro',
     traits      => [ 'XML' ],
  description => {
     Prefix => "",
     LocalName => "version",
     node_type => "attribute",
     Name => "version",
     NamespaceURI => "",
     sort_order => 1,
 },
);

no Moose;
1;
__END__
