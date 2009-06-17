package XML::AIML::Li;
use Moose;
use MooseX::AttributeHelpers;
use XML::Toolkit;

has 'srai_collection' => (
     isa         => 'ArrayRef[XML::AIML::Srai]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'srai' },
     description => {
         sort_order => 0,
     },
);
has 'text' => (
     isa         => 'Str',
     is          => 'rw',
     traits      => [ 'XML' ],
  description => {
     sort_order => 1,
 },
);

no Moose;
1;
__END__
