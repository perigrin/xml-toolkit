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

        container Builder => as {
            service filter => (
                lifecycle    => 'Singleton',
                class        => 'XML::Toolkit::Builder::Filter',
                dependencies => {
                    namespace     => depends_on('/namespace'),
                    template      => depends_on('/template'),
                    namespace_map => depends_on('/namespace_map'),
                }
            );

            service parser => (
                class            => 'XML::SAX::ParserFactory',
                constructor_name => 'parser',
                dependencies     => { Handler => depends_on('filter') },
            );

            service instance => (
                class        => 'XML::Toolkit::Builder',
                dependencies => {
                    filter => depends_on('filter'),
                    parser => depends_on('parser'),

                },
            );
        };
        container Loader => as {
            service filter => (
                lifecycle    => 'Singleton',
                class        => 'XML::Toolkit::Loader::FilterNS',
                dependencies => {
                    namespace     => depends_on('/namespace'),
                    template      => depends_on('/template'),
                    namespace_map => depends_on('/namespace_map'),
                }
            );

            service parser => (
                class            => 'XML::SAX::ParserFactory',
                constructor_name => 'parser',
                dependencies     => { Handler => depends_on('filter') },
            );

            service generator => ( class => 'XML::Toolkit::Generator', );

            service instance => (
                class        => 'XML::Toolkit::Loader',
                dependencies => {
                    filter    => depends_on('filter'),
                    parser    => depends_on('parser'),
                    generator => depends_on('generator'),
                }
            );
        };

    };
}

sub builder { shift->fetch('Builder/instance')->get }
sub loader  { shift->fetch('Loader/instance')->get }

1;
__END__
