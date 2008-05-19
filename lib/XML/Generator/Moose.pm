package XML::Generator::Moose;
use Moose;

extends qw(XML::SAX::Base Moose::Object);

has Handler => (
    isa      => 'Object',
    is       => 'ro',
    required => 1,
    handles  => [qw(start_document end_document)]
);

after 'start_document' => sub {
    my ($self) = @_;
    $self->xml_decl( { Version => '1.0', Encoding => 'UTF-8' } );
    $self->newline;
};

sub start_element {
    my ( $self, $name, $attr ) = @_;
    $self->SUPER::start_element( { Name => $name, Attributes => $attr } );
}

sub end_element {
    my ( $self, $name ) = @_;
    $self->SUPER::end_element( { Name => $name } );
    $self->newline;
}

sub characters {
    my ( $self, $data ) = @_;
    $self->SUPER::characters( { Data => $data } );
}

sub newline {
    my $self = shift;
    $self->SUPER::characters( { Data => "\n" } );
}

sub cdata {
    my ( $self, $data ) = @_;
    $self->start_cdata();
    $self->characters($data);
    $self->end_cdata();
}

sub parse {
    my ($self) = @_;
    $self->start_document();
    inner();
    $self->end_document();
}

no Moose;
1;
