package XML::Toolkit::Builder::NamespaceRegistry;
use Moose::Role;
use namespace::autoclean;
requires 'namespace';

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
    isa        => 'HashRef',
    is         => 'rw',
    lazy_build => 1,
    traits     => ['Hash'],
    handles    => {
        'no_unresolved_namespaces' => ['is_empty'],
        'unresolved_namespaces'     => ['keys'],
    }
);

sub _build_unresolved_namespace_map { {} }

sub end_document { }

after 'end_document' => sub {
    my ($self) = @_;
    unless ( $self->no_unresolved_namespaces ) {
        warn "These XML namespaces have no mapping:\n"
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
        return $self->namespace_map->{''} . '::' . ucfirst $el->{'LocalName'};
    }

    # Construct class name
    return $namespace . '::' . ucfirst $el->{'LocalName'};
}

1;
__END__
