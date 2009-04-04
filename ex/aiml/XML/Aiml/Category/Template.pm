package XML::Aiml::Category::Template;
use Moose;
use MooseX::AttributeHelpers;

has 'random_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Random]',
    is          => 'ro',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'random' },
    description => { sort_order => 0, },
);
has 'text' => (
    isa         => 'Str',
    is          => 'rw',
    traits      => ['MooseX::MetaDescription::Meta::Trait'],
    description => { sort_order => 1, },
);

no Moose;
1;
__END__
