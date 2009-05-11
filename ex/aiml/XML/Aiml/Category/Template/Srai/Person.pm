package XML::Aiml::Category::Template::Srai::Person;
use Moose;
use MooseX::AttributeHelpers;

has 'thatstar_collection' => (
    isa    => 'ArrayRef[XML::Aiml::Category::Template::Srai::Person::Thatstar]',
    is     => 'ro',
    traits => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'thatstar' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
