package XML::Filter::Moose::Class;
use Moose;
use MooseX::AttributeHelpers;
use Moose::Util::TypeConstraints;
use Template;

extends qw(XML::Filter::Moose);
with qw(XML::Filter::Moose::ClassRegistry);
with qw(XML::Filter::Moose::ClassTemplate);

sub get_class_name {
    my ( $self, $el ) = @_;
    my $name = $el->{LocalName};
    my $namespace
        = $self->parent_element
        ? $self->parent_element->{classname}
        : $self->namespace;
    return $namespace . '::' . ucfirst $name;
}

sub create_class {
    my ( $self, $name, $params ) = @_;
    return Moose::Meta::Class->create( $name => %$params );
}

sub add_attribute {
    my ( $self, $class, $type, $attr ) = @_;
    my $name = $attr->{LocalName};
    $name = $name . '_collection' if $type eq 'child';
    $attr->{isa} ||= 'Str';
    $attr->{traits} = ['XML::Toolkit::MetaDescription::Trait'];
    unless ( $type eq 'child' ) {
        $attr->{description} = {
            node_type    => $type,
            NamespaceURI => $attr->{NamespaceURI},
            LocalName    => $attr->{LocalName},
            Prefix       => $attr->{Prefix},
            Name         => $attr->{Name},
        };
    }
    $class->add_attribute( $name => $attr )
        unless $class->has_attribute($name);
}

sub add_text_attribute {
    my ( $self, $class ) = @_;
    $class->add_attribute(
        'text' => {
            isa         => 'Str',
            is          => 'rw',
            description => { node_type => 'character' },
        }
    );
}

augment 'start_element' => sub {
    my ( $self, $el ) = @_;
    my $classname = $self->get_class_name($el);
    class_type $classname;
    $el->{classname} = $classname;
    if ( $self->is_root ) {
        my $class = $self->create_class( $classname => $el );
        $self->add_class( $classname => $class );
        $self->add_attribute( $class, 'attribute' => $_ )
            for values %{ $el->{Attributes} };
        return;
    }
    my $class = $self->create_class( $classname => $el );
    $self->add_class( $classname => $class );
    $self->add_attribute( $class, 'attribute' => $_ )
        for values %{ $el->{Attributes} };

    my $parent_class = $self->get_class( $self->parent_element->{classname} );
    $self->add_attribute(
        $parent_class,
        'child',
        {
            %$el,
            isa               => "ArrayRef[$classname]",
            should_auto_deref => 1,
            is_lazy           => 1,
            default           => sub { [] },
        }
    );
};

augment 'end_element' => sub {
    my ( $self, $el ) = @_;
    my $top = $self->current_element;
    $self->add_text_attribute( $self->get_class( $top->{classname} ) )
        if $self->has_text;
    confess "INVALID PARSE: $el->{Name} ne $top->{Name}"
        unless $el->{Name} eq $top->{Name};

};
no Moose
    ;    # unimport Moose's keywords so they won't accidentally become methods
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
