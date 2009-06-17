package XML::Toolkit::Loader::Parser;
use Moose;
use MooseX::AttributeHelpers;
use Moose::Autobox;
extends qw(XML::Filter::Moose);
with qw(XML::Filter::Moose::ClassRegistry);

has default_namespace => (
    isa      => 'Str',
    is       => 'ro',
    required => 1,
);

has objects => (
    isa        => 'ArrayRef',
    is         => 'ro',
    auto_deref => 1,
    lazy       => 1,
    default    => sub { [] },
    metaclass  => 'Collection::Array',
    provides   => { push => 'add_object', }

);

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
    my $name = $el->{LocalName};
    my $namespace =
        $self->parent_element
      ? $self->parent_element->{classname}
      : $self->namespace;
    return $namespace . '::' . ucfirst $name;
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
    $self->append_text if $self->text;
    if ( my $method = $parent->can("add_$el->{LocalName}") ) {
        $parent->$method( $self->current_object );
    }
}

sub append_text {
    my ($self) = @_;
    $self->current_object->text( $self->text )
      if $self->current_object->can('text');
}

augment 'end_element' => sub {
    my ( $self, $el ) = @_;
    if ( my $parent = $self->parent_object ) {
        $self->append_to_parent( $parent => $el );
    }
    $self->objects->pop unless $self->at_root_object;
};

sub render {
    warn shift->root_object->dump;
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
