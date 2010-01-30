package XML::Toolkit::Generator;
use Moose;
use XML::SAX::Writer;
use namespace::autoclean;

has namespace => (
    isa        => 'Str',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_namespace { '' }

with qw(XML::Toolkit::Builder::NamespaceRegistry);    # provides get_class_name

has output => (
    isa        => 'ArrayRef',
    is         => 'ro',
    lazy_build => 1,
    auto_deref => 1,
);

sub _build_output { [] }

has handler => (
    isa        => 'Object',
    is         => 'ro',
    lazy_build => 1,
);

has quote_charecter => (
    isa     => 'Str',
    is      => 'ro',
    default => q['],
);

sub _build_handler {
    XML::SAX::Writer->new(
        Output         => scalar $_[0]->output,
        QuoteCharacter => $_[0]->quote_charecter,
    );
}

has generator => (
    does       => 'XML::Toolkit::Generator::Interface',
    is         => 'ro',
    lazy_build => 1,
    handles    => { render_object => 'parse' },
);

sub _build_generator {
    require XML::Toolkit::Generator::Default;
    XML::Toolkit::Generator::Default->new(
        Handler       => $_[0]->handler,
        namespace_map => $_[0]->namespace_map
    );
}

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

XML::Toolkit::Generator - A set of tools for converting Moose Objects into XML

=head1 SYNOPSIS

    use XML::Toolkit::Generator;
    my $generator =     XML::Toolkit::Generator->new();
    $generator->render_object( $object );
    say for $generator->output;

=head1 ATTRIBUTES

=over

=item output - Output Buffer

An ArrayRef that contains all of the output.

=item handler - An XML::SAX Filter

This is the class that renders the parsed events into XML. XML::SAX::Writer is
the default implementation.

=item quote_charecter - String for XML::SAX::Writer

String to pass to XML::SAX::Writer to define the attribute quoting mechanisim.
This will default to single quotes (q[']).

=item generator - An XML::Toolkit::Generator

This must do the XML::Toolkit::Generator::Interface. This is the class that
introspects Moose Objects and converts them into a SAX Stream. It defaults to
XML::Toolkit::Generator::Default.

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
