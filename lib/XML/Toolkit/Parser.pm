package XML::Toolkit::Parser;
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

has push_thumbs => (
    isa     => 'Bool',
    is      => 'rw',
    default => sub { 0 },
);

sub load_class {
    my ( $self, $name ) = @_;
    Class::MOP::load_class($name);
    return $name;
}

sub get_class_name {
    my ( $self, $name ) = @_;
    my $namespace =
        $self->parent_element
      ? $self->parent_element->{classname}
      : $self->namespace;
    return $namespace . '::' . ucfirst $name;
}


sub render {
    warn shift->root_object->dump;
}

no Moose;
1;
