package XML::Filter::Moose::ClassNS;
use Moose;

extends qw(XML::Filter::Moose::Class);

has namespace_map => (
    isa     => 'HashRef',
    is      => 'ro',
    lazy    => 1,
    default => sub { {} },
);

has class_names => (
    isa     => 'HashRef',
    is      => 'ro',
    lazy    => 1,
    default => sub { {} },
);

sub get_class_name {
    my ( $self, $el ) = @_;
    
    return $self->namespace_map->{ $el->{'NamespaceURI'} } . '::' . $el->{'LocalName'};
    
#    if (my $classname = $self->class_names->{ $el->{Name} }) {
#        return $classname;
#    }
#
#    warn "Namespace mapping: " . $el->{'NamespaceURI'} . '=' . $self->namespace_map->{ $el->{'NamespaceURI'} } . "\n";
#    
#    my $name = $el->{LocalName};
#    my $namespace
#        = $self->parent_element#
#        ? $self->parent_element->{classname}
#        : ( $self->namespace_map->{ $el->{'NamespaceURI'} } || $self->namespace );
#
#    my $classname = $namespace . '::' . ucfirst $name;
#    $self->class_names->{ $el->{Name} } = $classname;
#    return $classname;
}

no Moose;# unimport Moose's keywords so they won't accidentally become methods
1;       # Magic true value required at end of module
__END__

=head1 NAME

XML::Filter::Moose::Class - An XML::SAX Filter that generates Moose Classes
from SAX events.

=head1 SYNOPSIS

    use XML::Filter::Moose::Class;

    my $filter = XML::Filter::Moose::Class->new( 
        template => $template, 
        namespace => $namespace 
    );

    my $parser = XML::SAX::ParserFactory->parser( Handler => $filter );

    $parser->parse_file($file);
    print $filter->render;

=head1 DESCRIPTION

The XML::Filter::Moose::Class class implements an XML::SAX Filter that
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

L<MooseX::AttributeHelpers|MooseX::AttributeHelpers>

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
