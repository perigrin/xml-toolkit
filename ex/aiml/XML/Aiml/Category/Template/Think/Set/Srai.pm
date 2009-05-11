package XML::Aiml::Category::Template::Think::Set::Srai;
use Moose;
use MooseX::AttributeHelpers;

has 'set_collection' => (
    isa    => 'ArrayRef[XML::Aiml::Category::Template::Think::Set::Srai::Set]',
    is     => 'ro',
    traits => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'set' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
