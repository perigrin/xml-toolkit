package XML::Toolkit::Generator::Default;
use Moose;
use Encode;
extends qw(XML::Generator::Moose);
with qw(XML::Toolkit::Generator::Interface);

after 'xml_decl' => sub { shift->newline };

sub get_element_name {
    my ( $self, $meta ) = @_;
    if ( $meta->can('description') ) {
        return $meta->description->{Name};
    }
    else {
        my $name = $meta->name;
        $name =~ /::(\w+)$/oi;
        return lcfirst $1;
    }
}

sub is_node {
    my ( $self, $attr ) = @_;
    return 0 unless $attr->can('description');
    return 0 unless $attr->description->{node_type};
    return 1;
}

sub is_child_node {
    my ( $self, $attr ) = @_;
    return 0 unless $self->is_node($attr);
    return 1 if $attr->description->{node_type} eq 'child';
    return 0;
}

sub is_text_node {
    my ( $self, $attr ) = @_;
    return 0 unless $self->is_node($attr);
    return 1 if $attr->description->{node_type} eq 'characters';
    return 0;
}

sub is_attribute_node {
    my ( $self, $attr ) = @_;
    return 0 unless $self->is_node($attr);
    return 1 if $attr->description->{node_type} eq 'attribute';
    return 0;
}

sub get_attrs {
    my ( $self, $meta, $obj ) = @_;
    my @attrs = grep { $self->is_attribute_node($_) }
      grep { defined $_->get_value($obj) }
      map  { $meta->get_attribute($_) } $meta->get_attribute_list;
    return map {
            '{'
          . $_->description->{Prefix} . '}'
          . $_->description->{LocalName} =>
          { %{ $_->description }, Value => $_->get_value($obj) }
    } @attrs;
}

sub parse_object {
    my ( $self, $meta, $obj, $parent ) = @_;
    my %attrs = $self->get_attrs( $meta, $obj );
    my $name = $self->get_element_name($meta);
    $self->start_element( $name => \%attrs );
    for my $attr ( $self->_get_sorted_filtered_attributes($meta) ) {
        next unless $attr->get_value($obj);

        #        next unless $self->is_node($attr);
        next if $self->is_attribute_node($attr);
        my $el = $self->get_element_name($attr);

        $self->start_element($el)
          if $el && !blessed $attr->get_value($obj);
        for my $child ( $attr->get_value($obj) ) {
            next unless $child;
            if ( blessed $child) {
                $self->parse_object( $child->meta, $child, $attr->name );
            }
            else {
                unless ( ref $child ) {
                    $self->characters($child);
                }
            }
        }
        $self->end_element($el)
          if $el && !blessed $attr->get_value($obj);
    }
    $self->end_element($name);
}

augment 'parse' => sub {
    my ( $self, $obj ) = @_;
    $self->parse_object( $obj->meta, $obj );

};

sub _get_sorted_filtered_attributes {
    my ( $self, $meta ) = @_;
    sort {
        return -1 unless exists $a->description->{sort_order};
        return 1  unless exists $b->description->{sort_order};
        return $a->description->{sort_order} <=> $b->description->{sort_order}
      }
      grep { !$_->does('XML::Toolkit::Trait::NoXML') }
      $meta->get_all_attributes;
}

no Moose;
1;
__END__

=head1 NAME

XML::Toolkit::Generator::Default - A Default Moose Object to XML Generator

=head1 SYNOPSIS

    use XML::Toolkit::Generator::Default;
    XML::Toolkit::Generator::Default->new( Handler => XML::SAX::Writer->new );

=head1 DESCRIPTION

A subclass of XML::Generator::Moose, this class generates SAX events from
Moose objects.
    
=head1 ATTRIBUTES

See XML::Generator::Moose.

=head1 METHODS

=over

=item get_element_name

=item is_node

=item is_child_node

=item is_text_node

=item is_attribute_node

=item get_attrs

=item parse_object

=back

See Also XML::Generator::Moose

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
