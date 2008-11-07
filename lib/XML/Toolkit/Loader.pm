package XML::Toolkit::Loader;
use Moose;
use XML::SAX::Writer;
use XML::Toolkit::Loader::Parser;
use XML::Toolkit::Generator;
use XML::SAX::ParserFactory;

has namespace => (
    isa        => 'Str',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_namespace { 'MyApp' }

has filter => (
    isa        => 'XML::Toolkit::Loader::Parser',
    is         => 'ro',
    lazy_build => 1,
    handles    => [qw(root_object)],
);

sub _build_filter {
    XML::Toolkit::Loader::Parser->new( namespace => shift->namespace );
}

has generator => (
    isa        => 'XML::Toolkit::Generator',
    is         => 'ro',
    lazy_build => 1,
    handles    => [qw(render_object output)],
);

sub _build_generator {
    XML::Toolkit::Generator->new();
}

has parser => (
    is         => 'ro',
    lazy_build => 1,
    handles    => [qw(parse_uri parse_file parse_string)]
);

sub _build_parser {
    XML::SAX::ParserFactory->parser( Handler => $_[0]->filter );
}

sub render {
    my ($self) = @_;
    $self->render_object( $self->root_object );
}

no Moose;
1;
__END__
