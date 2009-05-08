package XML::Filter::Moose::ClassRegistry;
use Moose::Role;

has namespace => (
    isa        => 'Str',
    is         => 'ro',
    builder    => 'default_namespace',
    lazy_build => 1,
);

sub default_namespace { 'MyApp::' }

has registry => (
    isa        => 'HashRef',
    is         => 'ro',
    lazy       => 1,
    default    => sub { {} },
    auto_deref => 1,
    metaclass  => 'Collection::Hash',
    provides   => {
        set    => 'add_class',
        values => 'classes',
        keys   => 'class_names',
        get    => 'get_class',
    }
);


no Moose::Role; 
1;

__END__

=head1 NAME

XML::Filter::Moose::ClassRegistry - A class to ...

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

use XML::Filter::Moose::ClassRegistry;

=head1 DESCRIPTION

The XML::Filter::Moose::ClassRegistry class implements ...

=head1 SUBROUTINES / METHODS

=head2 default_namespace

Parameters:
    none

Insert description of subroutine here...

=head1 DEPENDENCIES

Modules used, version dependencies, core yes/no

Moose::Role

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
