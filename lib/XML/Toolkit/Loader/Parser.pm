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

augment 'start_element' => sub {
    my ( $self, $el ) = @_;

    my $classname = $self->get_class_name( $el->{Name} );
    $el->{classname} = $classname;
    my $class = $self->load_class($classname);

    return unless $class;
    my %params =
      map { $_->{Name} => $_->{Value} } values %{ $el->{Attributes} };

    my $obj = $class->new(%params);
    $self->add_object($obj);
};

augment 'end_element' => sub {
    my ( $self, $el ) = @_;

    if ( my $parent = $self->parent_object ) {

        if ( $self->text ) {
            $self->current_object->text( $self->text )
              if $self->current_object->can('text');
        }

        my $name = $el->{Name};
        if ( my $method = $parent->can($name) ) {
            $parent->$method( $self->current_object );
        }

    }
    $self->objects->pop unless $self->current_object == $self->root_object;
};

sub render {
    warn shift->root_object->dump;
}

no Moose;
1;
