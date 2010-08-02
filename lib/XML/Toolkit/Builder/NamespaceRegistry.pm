package XML::Toolkit::Builder::NamespaceRegistry;
use Moose::Role;
use MooseX::Aliases;
use namespace::autoclean;

sub namespace {
    return $_[0]->xmlns->{''} = $_[1] if defined $_[1];
    return $_[0]->xmlns->{''};
}

has xmlns => (
    isa        => 'HashRef',
    is         => 'ro',
    lazy_build => 1,
    traits     => [qw(MooseX::Aliases::Meta::Trait::Attribute)],
    alias      => ['namespace_map'],
    trigger    => sub {
        my ($self) = @_;
        unless ( exists( $self->namespace_map->{''} ) ) {
            $self->namespace_map->{''} = $self->namespace;
        }
    },
);

sub _build_xmlns { { '' => 'MyApp', } }

has _unresolved_namespace_map => (
    isa      => 'HashRef',
    accessor => 'unresolved_namespace_map',
    lazy     => 1,
    default  => sub { {} },
    traits   => [qw(Hash MooseX::Aliases::Meta::Trait::Attribute)],
    alias    => ['unresolved_xmln'],
    handles  => {
        'no_unresolved_namespaces' => ['is_empty'],
        'unresolved_namespaces'    => ['keys'],
    }
);

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
        warn $self->xmlns->{''} . '::' . ucfirst $el->{'LocalName'};
        return $self->xmlns->{''} . '::' . ucfirst $el->{'LocalName'};
    }

    # Construct class name
    return $namespace . '::' . ucfirst $el->{'LocalName'};
}

1;
__END__
