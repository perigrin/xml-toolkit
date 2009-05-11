package XML::Aiml::Topic::Category::Template;
use Moose;
use MooseX::AttributeHelpers;

has 'condition_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Topic::Category::Template::Condition]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'condition' },
    description => { sort_order => 0, },
);
has 'think_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Topic::Category::Template::Think]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'think' },
    description => { sort_order => 1, },
);

no Moose;
1;
__END__
