package XML::Toolkit::Config::Container;
use Moose;
use namespace::autoclean;
use Bread::Board;

extends qw(Bread::Board::Container);
with qw(
  XML::Toolkit::Cmd::ClassTemplate
  XML::Toolkit::Builder::NamespaceRegistry
);

has '+name' => ( default => 'XML::Toolkit::Application' );

has filter_class => (
    isa     => 'Str',
    is      => 'ro',
    default => 'XML::Toolkit::Builder::Filter'
);

sub BUILD {
    my $self = shift;
    container $self => as {

        service 'template' => $self->template;

        service 'namespace'     => $self->namespace;
        service 'namespace_map' => (
            block => sub {
                $self->namespace_map || { '' => $_[0]->param('namespace') };
            },
            dependencies => { namespace => depends_on('namespace'), },
        );

        service filter_class => $self->filter_class;
        service filter       => (
            lifecycle    => 'Singleton',
            class        => $self->filter_class,
            dependencies => {
                namespace     => depends_on('namespace'),
                template      => depends_on('template'),
                namespace_map => depends_on('namespace_map'),
            }
        );

        service parser => (
            class            => 'XML::SAX::ParserFactory',
            constructor_name => 'parser',
            dependencies     => { Handler => depends_on('filter') },
        );

        service builder => (
            class        => 'XML::Toolkit::Builder',
            dependencies => {
                filter => depends_on('filter'),
                parser => depends_on('parser'),

            },
          )

    };
}

sub builder { shift->fetch('builder')->get }

1;
__END__
