package XML::Toolkit::Loader::FilterNS;
use Moose;
use namespace::autoclean;

extends qw(XML::Toolkit::Loader::Filter);
with qw(XML::Toolkit::Builder::NamespaceRegistry); # provides get_class_name

sub create_and_add_object {
    my ( $self, $class, $el ) = @_;

    my %params = map { $_->{LocalName} => $_->{Value} }
        values %{ $el->{Attributes} };

    my $obj = $class->new(%params);
    $self->add_object($obj);

}

sub append_to_parent {
    my ( $self, $parent, $el ) = @_;
    if ( my $method = $parent->can("add_$el->{LocalName}") ) {
        $parent->$method( $self->current_object );
    }
}

__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
__END__

=head1 NAME

XML::Toolkit::Loader::Filter - A class to ...

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

use XML::Toolkit::Loader::Filter;

=head1 DESCRIPTION

The XML::Toolkit::Loader::Filter class implements ...

=head1 SUBROUTINES / METHODS

=head2 parent_object (method)

Parameters:
    none

Insert description of method here...

=head2 current_object (method)

Parameters:
    none

Insert description of method here...

=head2 root_object (method)

Parameters:
    none

Insert description of method here...

=head2 load_class (method)

Parameters:
    name

Insert description of method here...

=head2 get_class_name (method)

Parameters:
    name
    self
    el
    self
    el

Insert description of method here...

=head2 render

Parameters:
    none

Insert description of subroutine here...

=head1 DEPENDENCIES

Modules used, version dependencies, core yes/no

Moose

MooseX::AttributeHelpers

Moose::Autobox

=head1 NOTES

...

=head1 BUGS AND LIMITATIONS

None known currently, please email the author if you find any.

=head1 AUTHOR

Chris Prather (perigrin@domain.tld)

=head1 LICENCE

Copyright 2009 by Chris Prather.

This software is free.  It is licensed under the same terms as Perl itself.

=cut
