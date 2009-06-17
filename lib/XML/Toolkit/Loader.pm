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

has namespace_map => (
    isa     => 'HashRef',
    is      => 'ro',
    lazy    => 1,
    default => sub {
        { '' => $_[0]->namespace, };
    },
    trigger => sub {
        my ($self) = @_;
        unless ( exists( $self->namespace_map->{''} ) ) {
            $self->namespace_map->{''} = $self->namespace;
        }
    },
);

has filter_class => (
    isa        => 'Str',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_filter_class { 'XML::Toolkit::Loader::ParserNS' }

has filter => (
    isa        => 'XML::Toolkit::Loader::Parser',
    is         => 'ro',
    lazy_build => 1,
    handles    => [qw(root_object)],
);

sub _build_filter {
    my ($self) = @_;

    # Load and resolve filter class
    my $filter_class = $self->filter_class;
    Class::MOP::load_class($filter_class);

    # Create instance
    $filter_class->new(
        namespace     => $self->namespace,
        namespace_map => $self->namespace_map,
    );
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

=head1 NAME

XML::Toolkit::Loader - A set of tools for Loading XML into Moose Objects

=head1 SYNOPSIS

    use XML::Toolkit::Loader;
    my $loader = XML::Toolkit::Loader->new( namespace => 'MyApp' );
    $loader->parse_file( $$file );
    print join '', @{ $loader->render };

=head1 ATTRIBUTES

=over

=item namespace - The namespace for your output 

This will define the root level namespace for the classes generated by the
Builder. This defaults to "MyApp".

=item filter - An XML::SAX Filter

The render method is required. This is the class that renders the parsed
events into a set of Moose Objects. XML::Toolkit::Loader::Parser documented
elsewhere in this distribution is the default implementation.

=item generator - An XML::Toolkit::Generator

The render method is required. This is the class that renders a set of Moose
objects parsed by the Filter into XML again. XML::Toolkit::Generator
documented elsewhere in this distribution is the default implementation.

=item parser - A Parser Object

The methods parse_uri, parse_file and parse_string are required. This defaults
to a XML::SAX::ParserFactory parser.

=back 

=head1 METHODS

=over 

=item render()

Render the current root_object via the XML::Toolkit::Generator's render_object method

=back

=head1 INCOMPATIBILITIES

None reported.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-xml-toolkit@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.


=head1 AUTHOR

Chris Prather  C<< <chris@prather.org> >>

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2008, Chris Prather C<< <chris@prather.org> >>. Some rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.
