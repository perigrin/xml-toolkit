package XML::Aiml::Category;
use Moose;
use MooseX::AttributeHelpers;

has 'pattern_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Pattern]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'pattern' },
    description => { sort_order => 0, },
);
has 'template_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'template' },
    description => { sort_order => 1, },
);
has 'that_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::That]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
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
