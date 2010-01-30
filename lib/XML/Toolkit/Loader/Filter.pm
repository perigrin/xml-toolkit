package XML::Toolkit::Loader::Filter;
use Moose;
use MooseX::AttributeHelpers;
use Moose::Autobox;             
use namespace::autoclean;

extends qw(XML::Filter::Moose);
with qw(XML::Toolkit::Builder::ClassRegistry);

has objects => (
    isa        => 'ArrayRef',
    is         => 'ro',
    auto_deref => 1,
    lazy_build => 1,
    traits     => ['Array'],
    handles    => { 'add_object' => ['push'], }

);

sub _build_objects { [] }

sub parent_object {
    my ($self) = @_;
    if ( $self->objects->length >= 2 ) {
        return $self->objects->[-2];
    }
    return undef if $self->objects->length == 1;
    return $self->objects->[-1];
}

sub current_object {
    my ($self) = @_;
    $self->objects->[-1];
}

sub root_object {
    my ($self) = @_;
    $self->objects->[0];
}

sub at_root_object { $_[0]->current_object == $_[0]->root_object }

sub load_class {
    my ( $self, $name ) = @_;
    Class::MOP::load_class($name);
    return $name;
}

sub get_class_name {
    my ( $self, $el ) = @_;
    return $self->namespace . '::' . ucfirst $el->{LocalName};
}

sub create_and_add_object {
    my ( $self, $class, $el ) = @_;
    my %params =
      map { $_->{Name} => $_->{Value} } values %{ $el->{Attributes} };

    my $obj = $class->new(%params);
    $self->add_object($obj);

}

augment 'start_element' => sub {
    my ( $self, $el ) = @_;

    my $classname = $self->get_class_name($el);
    $el->{classname} = $classname;

    if ( my $class = $self->load_class($classname) ) {
        $self->create_and_add_object( $class => $el );
    }
    return;
};

sub append_to_parent {
    my ( $self, $parent, $el ) = @_;
    if ( my $method = $parent->can("add_$el->{LocalName}") ) {
        $parent->$method( $self->current_object );
    }
}

sub set_object_text {
    my ($self) = @_;
    $self->current_object->text( $self->text )
      if $self->current_object->can('text');
}

augment 'end_element' => sub {
    my ( $self, $el ) = @_;
    $self->set_object_text if $self->has_text;
    if ( my $parent = $self->parent_object ) {
        $self->append_to_parent( $parent => $el );
    }
    $self->objects->pop unless $self->at_root_object;
};

sub render {
    warn shift->root_object->dump;
}

__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
__END__

=head1 NAME

XML::Toolkit::Loader::Filter - A class to ...

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

use XML::Toolkit::Loader::Filter;

=head1 DESCRIPTION

The XML::Toolkit::Loader::Filter class implements ...

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
