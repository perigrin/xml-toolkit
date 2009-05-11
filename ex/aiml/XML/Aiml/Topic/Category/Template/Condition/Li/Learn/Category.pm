package XML::Aiml::Topic::Category::Template::Condition::Li::Learn::Category;
use Moose;
use MooseX::AttributeHelpers;

has 'pattern_collection' => (
    isa =>
'ArrayRef[XML::Aiml::Topic::Category::Template::Condition::Li::Learn::Category::Pattern]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'pattern' },
    description => { sort_order => 0, },
);
has 'template_collection' => (
    isa =>
'ArrayRef[XML::Aiml::Topic::Category::Template::Condition::Li::Learn::Category::Template]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'template' },
    description => { sort_order => 1, },
);
has 'that_collection' => (
    isa =>
'ArrayRef[XML::Aiml::Topic::Category::Template::Condition::Li::Learn::Category::That]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'that' },
    description => { sort_order => 2, },
);

no Moose;
1;
__END__
