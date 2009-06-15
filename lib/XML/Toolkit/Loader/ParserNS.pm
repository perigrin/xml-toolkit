package XML::Toolkit::Loader::ParserNS;
use Moose;
use Moose::Autobox;

extends qw(XML::Toolkit::Loader::Parser);

has namespace_map => (
    isa     => 'HashRef',
    is      => 'ro',
    lazy    => 1,
    default => sub { {} },
);

has unresolved_namespace_map => (
    isa     => 'HashRef',
    is      => 'rw',
    lazy    => 1,
    default => sub { {} },
);

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

after 'end_document' => sub {
    my ($self) = @_;
    if ( keys %{ $self->unresolved_namespace_map } > 0 ) {
        die "These XML namespaces have no mapping:\n"
          . join( "\n", sort keys %{ $self->unresolved_namespace_map } ) . "\n";
    }
};

sub create_and_add_object {
    my ( $self, $class, $el ) = @_;

    my %params =
      map { $_->{LocalName} => $_->{Value} } values %{ $el->{Attributes} };

    my $obj = $class->new(%params);
    $self->add_object($obj);

}

sub append_to_parent {
    my ( $self, $parent, $el ) = @_;
    $self->append_text if $self->text;
    if ( my $method = $parent->can( $el->{LocalName} ) ) {
        $parent->$method( $self->current_object );
    }
}

no Moose;
1;

__END__

=head1 NAME

XML::Toolkit::Loader::Parser - A class to ...

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

use XML::Toolkit::Loader::Parser;

=head1 DESCRIPTION

The XML::Toolkit::Loader::Parser class implements ...

=head1 SUBROUTINES / METHODS

=head2 parent_object (method)

Parameters:
    none

Insert description of method here...

=head2 current_object (method)

Parameters:
    none

Insert description of method here...

=head2 root_object (method)

Parameters:
    none

Insert description of method here...

=head2 load_class (method)

Parameters:
    name

Insert description of method here...

=head2 get_class_name (method)

Parameters:
    name
    self
    el
    self
    el

Insert description of method here...

=head2 render

Parameters:
    none

Insert description of subroutine here...

=head1 DEPENDENCIES

Modules used, version dependencies, core yes/no

Moose

MooseX::AttributeHelpers

Moose::Autobox

=head1 NOTES

...

=head1 BUGS AND LIMITATIONS

None known currently, please email the author if you find any.

=head1 AUTHOR

Chris Prather (perigrin@domain.tld)

=head1 LICENCE

Copyright 2009 by Chris Prather.

This software is free.  It is licensed under the same terms as Perl itself.

=cut
