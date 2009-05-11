package XML::Aiml;
use Moose;
use MooseX::AttributeHelpers;

has 'category_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'category' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
