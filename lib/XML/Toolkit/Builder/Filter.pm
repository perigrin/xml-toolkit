package XML::Toolkit::Builder::Filter;
use Moose;
use Moose::Util::TypeConstraints;
use Template;

extends qw(XML::Filter::Moose);
with qw(XML::Toolkit::Builder::ClassRegistry);
with qw(XML::Toolkit::Builder::ClassTemplate);

use aliased 'XML::Toolkit::MetaDescription::Trait' => 'XMLTrait';

sub get_class_name {
    my ( $self, $el ) = @_;
    return $self->namespace . '::' . ucfirst $el->{LocalName};
}

sub create_class {
    my ( $self, $name, $params ) = @_;
    return $self->get_class($name) if $self->has_class($name);
    class_type $name; # we only need to generate the class type when we build a new
    return Moose::Meta::Class->create( $name => %$params );
}

sub add_attribute {
    my ( $self, $class, $type, $attr ) = @_;
    my $name = $attr->{LocalName} . ( $type eq 'child' ? '_collection' : '' );
    return if $class->has_attribute($name);

    my $param = { map { $_ => $attr->{$_} } qw(isa is auto_deref) };
    $param->{isa} ||= 'Str';
    $param->{is}     = 'bare';
    $param->{traits} = [XMLTrait];

    $param->{description} = {
        node_type    => $type,
        NamespaceURI => $attr->{NamespaceURI},
        LocalName    => $attr->{LocalName},
        Prefix       => $attr->{Prefix},
        Name         => $attr->{Name},
    };
    $class->add_attribute( $name => $param );
}

sub add_text_attribute {
    my ( $self, $class ) = @_;
    $class->add_attribute(
        'text' => (
            isa         => 'Str',
            is          => 'rw',
            traits      => [XMLTrait],
            description => { node_type => 'character' },
        )
    );
}

sub start_element {
    my ( $self, $el ) = @_;
    my $classname = $self->get_class_name($el);
    $el->{classname} = $classname;

    my $class = $self->create_class( $classname => $el );
    $self->add_class( $classname => $class );
    $self->add_attribute( $class, 'attribute' => $_ )
      for values %{ $el->{Attributes} };

    unless ( $self->is_root ) {
        my $parent_class =
          $self->get_class( $self->parent_element->{classname} );
        $self->add_attribute(
            $parent_class,
            'child',
            {
                %$el,
                isa        => "ArrayRef[$classname]",
                auto_deref => 1,
                lazy       => 1,
                default    => sub { [] },
            }
        );
    }

    # cribbed from XML::Filter::Moose
    $self->add_element($el);
}

sub end_element {
    my ( $self, $el ) = @_;
    my $top = $self->current_element;
    $self->add_text_attribute( $self->get_class( $top->{classname} ) )
      if $self->has_text;
    confess "INVALID PARSE: $el->{Name} ne $top->{Name}"
      unless $el->{Name} eq $top->{Name};

    # cribbed from XML::Filter::Moose
    $self->pop_element;
    $self->reset_text;

}
no Moose;  # unimport Moose's keywords so they won't accidentally become methods
1;         # Magic true value required at end of module
__END__

=head1 NAME

XML::Toolkit::Builder::Filter - An XML::SAX Filter that generates Moose Classes
from SAX events.

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
