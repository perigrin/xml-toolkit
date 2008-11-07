package XML::Filter::Moose;
use Moose;
use Moose::Autobox;

extends qw(XML::SAX::Base Moose::Object);

has stack => (
    isa     => 'ArrayRef',
    is      => 'ro',
    lazy    => 1,
    default => sub { [] },
    clearer => 'reset_stack',
);

has text => (
    isa       => 'Str',
    is        => 'rw',
    metaclass => 'String',
    lazy      => 1,
    clearer   => 'reset_text',
    predicate => 'has_text',
    default   => sub { '' },
    provides  => { append => 'append_text', },
);

sub root {
    shift->stack->[0];
}

sub current_element {
    shift->stack->[-1];
}

sub is_root { return shift->stack->length == 0 }

sub parent_element {
    my ($self) = @_;
    if ( $self->stack->length > 1 ) {
        return $self->stack->[-1];
    }
    $self->root;
}

sub start_document {
    my ( $self, $doc ) = @_;
    inner();
    $self->reset_stack;
}

sub start_element {
    my ( $self, $el ) = @_;
    inner();
    $self->stack->push($el);
}

sub characters {
    my ( $self, $el ) = @_;
    inner();
    $self->append_text( $el->{Data} ) if $el->{Data} =~ /\S/;
}

sub end_element {
    my ( $self, $el ) = @_;
    inner();
    $self->stack->pop;
    $self->reset_text;
}

sub end_document {
    my ( $self, $doc ) = @_;
    inner();
}

no Moose;
1;
__END__
