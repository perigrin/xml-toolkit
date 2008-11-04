package XML::Toolkit::Builder;
use Moose;
use XML::SAX::Writer;
use XML::Filter::Moose::Class;
use XML::SAX::ParserFactory;

has namespace => (
    isa        => 'Str',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_namespace { 'MyApp' }

has template => (
    isa => 'Str',
    is  => 'ro',
);

has output => (
    isa        => 'ArrayRef',
    is         => 'ro',
    default    => sub { [] },
    lazy       => 1,
    auto_deref => 1,
);

has filter => (
    isa        => 'XML::Filter::Moose::Class',
    is         => 'ro',
    lazy_build => 1,
    handles    => [qw(render)],
);

sub _build_filter {
    my %params = ( namespace => $_[0]->namespace, );
    $params{template} = $_[0]->template if defined $_[0]->template;
    XML::Filter::Moose::Class->new(%params);
}

has parser => (
    is         => 'ro',
    lazy_build => 1,
    handles    => [qw(parse_uri parse_file parse_string)]
);

sub _build_parser {
    XML::SAX::ParserFactory->parser( Handler => $_[0]->filter );
}

no Moose;
1;
__END__
