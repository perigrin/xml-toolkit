package XML::Filter::Moose::ClassRegistry;
use Moose::Role;

has namespace => (
    isa        => 'Str',
    is         => 'ro',
    builder    => 'default_namespace',
    lazy_build => 1,
);

sub default_namespace { 'MyApp::' }

has registry => (
    isa        => 'HashRef',
    is         => 'ro',
    lazy       => 1,
    default    => sub { {} },
    auto_deref => 1,
    metaclass  => 'Collection::Hash',
    provides   => {
        set    => 'add_class',
        values => 'classes',
        keys   => 'class_names',
        get    => 'get_class',
    }
);


no Moose::Role; 
1;
