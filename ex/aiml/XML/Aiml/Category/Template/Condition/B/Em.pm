package XML::Aiml::Category::Template::Condition::B::Em;
use Moose;
use MooseX::AttributeHelpers;

has 'input_collection' => (
    isa => 'ArrayRef[XML::Aiml::Category::Template::Condition::B::Em::Input]',
    is  => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'input' },
    description => { sort_order => 0, },
);
has 'that_collection' => (
    isa    => 'ArrayRef[XML::Aiml::Category::Template::Condition::B::Em::That]',
    is     => 'ro',
    traits => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'that' },
    description => { sort_order => 1, },
);

no Moose;
1;
__END__
