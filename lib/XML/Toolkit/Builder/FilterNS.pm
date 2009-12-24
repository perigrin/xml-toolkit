package XML::Toolkit::Builder::FilterNS;
use Moose;
use Carp qw(croak);

extends qw(XML::Toolkit::Builder::Filter);
with qw(XML::Toolkit::Builder::NamespaceRegistry);

override add_attribute => sub {
    my ( $next, $self, $class, $type, $attr ) = @_;
    return super() if $type eq 'child';
    return super() unless my $xmlns = $attr->{Prefix};
    return super() unless $xmlns eq 'xmlns';
    my $name = $attr->{LocalName};
    warn $name;
    $attr->{isa}         = 'Str';
    $attr->{traits}      = ['XML::Toolkit::MetaDescription::Trait'];
    $attr->{default}     = $attr->{Value};
    $attr->{description} = {
        node_type    => $type,
        Prefix       => $xmlns,
        NamespaceURI => $attr->{NamespaceURI},
        LocalName    => $attr->{LocalName},
        Name         => $attr->{Name},
    };
    $class->add_attribute( $name => $attr )
        unless $class->has_attribute($name);
};

no Moose
    ;    # unimport Moose's keywords so they won't accidentally become methods
1;       # Magic true value required at end of module
__END__

=head1 NAME

XML::Toolkit::Builder::Filter - An Namespace Aware XML::SAX Filter that
generates Moose Classes from SAX events.

=head1 SYNOPSIS

    use XML::Toolkit::Builder::Filter;

    my $filter = XML::Toolkit::Builder::Filter->new( 
        template => $template, 
        namespace => $namespace 
    );

    my $parser = XML::SAX::ParserFactory->parser( Handler => $filter );

    $parser->parse_file($file);
    print $filter->render;

=head1 DESCRIPTION

The XML::Toolkit::Builder::Filter class implements an XML::SAX Filter that
generates Moose Classes from SAX events.

=head1 METHODS

=head2 get_class_name()

Insert description of method here...

=head2 create_class($name, %params)

Insert description of method here...

=head2 add_attribute($class, $type, $attribute)

Insert description of method here...

=head2 add_text_attribute($class, $element)

Insert description of method here...

=head1 DEPENDENCIES

Modules used, version dependencies, core yes/no

L<Moose|Moose>

L<Moose::Util::TypeConstraints|Moose::Util::TypeConstraints>

L<Template::Toolkit|Template::Toolkit>

L<XML::Filter::Moose|XML::Filter::Moose>

=head1 BUGS AND LIMITATIONS

Please report any bugs or feature requests to
C<bug-xml-toolkit@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.

=head1 AUTHOR

Chris Prather (chris@prather.org)

=head1 LICENCE

Copyright 2009 by Chris Prather.

This software is free.  It is licensed under the same terms as Perl itself.

=cut
