package XML::Filter::Moose::NamespaceRegistry;
use Moose::Role;

has namespace_map => (
    isa        => 'HashRef',
    is         => 'ro',
    lazy_build => 1,
    trigger    => sub {
        my ($self) = @_;
        unless ( exists( $self->namespace_map->{''} ) ) {
            $self->namespace_map->{''} = $self->namespace;
        }
    },
);

sub _build_namespace_map { { '' => $_[0]->namespace, } }

has unresolved_namespace_map => (
    isa       => 'HashRef',
    is        => 'rw',
    lazy      => 1,
    default   => sub { {} },
    metaclass => 'Collection::Hash',
    provides  => {
        empty => 'has_unresolved_namespaces',
        keys  => 'unresolved_namespaces',
    }
);

no Moose::Role;
1;
