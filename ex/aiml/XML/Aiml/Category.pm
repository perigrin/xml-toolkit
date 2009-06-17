package XML::AIML::Category;
use Moose;
use MooseX::AttributeHelpers;
use XML::Toolkit;

has 'pattern_collection' => (
     isa         => 'ArrayRef[XML::AIML::Pattern]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'pattern' },
     description => {
         sort_order => 0,
     },
);
has 'template_collection' => (
     isa         => 'ArrayRef[XML::AIML::Template]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'template' },
     description => {
         sort_order => 1,
     },
);
has 'that_collection' => (
     isa         => 'ArrayRef[XML::AIML::That]',
     is          => 'ro',
     traits      => [ 'XML' ],
      metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'that' },
     description => {
         sort_order => 2,
     },
);

no Moose;
1;
__END__
