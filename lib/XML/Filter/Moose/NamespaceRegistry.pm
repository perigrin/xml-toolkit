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

sub end_document {}

after 'end_document' => sub {
    my ($self) = @_;
    if ( $self->has_unresolved_namespaces ) {
        die "These XML namespaces have no mapping:\n"
            . join( "\n", sort $self->unresolved_namespaces ) . "\n";
    }
};

sub get_class_name {
    my ( $self, $el ) = @_;

    # Get values for element
    my $xmlns     = $el->{'NamespaceURI'};
    my $namespace = $self->namespace_map->{$xmlns};

    # Add xmlns to unresolved list
    unless ($namespace) {
        $self->unresolved_namespace_map->{$xmlns} = 1;

        # Let's just return the local part here, even though it's wrong
        return ucfirst $el->{'LocalName'};
    }

    # Construct class name
    return $namespace . '::' . ucfirst $el->{'LocalName'};
}

no Moose::Role;
1;
