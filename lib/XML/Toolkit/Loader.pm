package XML::Toolkit::Loader;
use Moose;
use XML::SAX::Writer;
use XML::Toolkit::Parser;
use XML::Toolkit::Generator;
use XML::SAX::ParserFactory;

has output => (
    isa        => 'ArrayRef',
    is         => 'ro',
    default    => sub { [] },
    lazy       => 1,
    auto_deref => 1,
);

has handler => (
    isa        => 'Object',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_handler { XML::SAX::Writer->new( Output => scalar $_[0]->output ) }

has filter => (
    isa        => 'XML::Toolkit::Parser',
    is         => 'ro',
    lazy_build => 1,
    handles    => [qw(root_object)],
);

sub _build_filter { XML::Toolkit::Parser->new() }

has generator => (
    isa        => 'XML::Toolkit::Generator',
    is         => 'ro',
    lazy_build => 1,
    handles    => { render_xml => 'parse' },
);

sub _build_generator {
    XML::Toolkit::Generator->new( Handler => $_[0]->handler );
}

has parser => (
    is      => 'ro',
    lazy_build => 1,
    handles => [qw(parse_uri)]
);

sub _build_parser {
    XML::SAX::ParserFactory->parser( Handler => $_[0]->filter );
}

sub render {
    my ( $self, $object ) = @_;
    $self->render_xml( $self->root_object );
}

no Moose;
1;
__END__
