package XML::Toolkit::RNG::Grammar;
use Moose;
use MooseX::AttributeHelpers;

has 'datatypeLibrary' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "datatypeLibrary",
        node_type    => "attribute",
        Name         => "datatypeLibrary",
        NamespaceURI => "",
        sort_order   => 0,
    },
);

has 'define_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'define' },
    description => { sort_order => 1, },
);

has 'ns' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "ns",
        node_type    => "attribute",
        Name         => "ns",
        NamespaceURI => "",
        sort_order   => 2,
    },
);

has 'start_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Start]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'start' },
    description => { sort_order => 3, },
);

has 'xmlns' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "xmlns",
        node_type    => "attribute",
        Name         => "xmlns",
        NamespaceURI => "",
        sort_order   => 4,
    },
);

no Moose;
1;
__END__

=head1 NAME

XML::Toolkit::RNG::Grammar - A class to ...

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

use XML::Toolkit::RNG::Grammar;

=head1 DESCRIPTION

The XML::Toolkit::RNG::Grammar class implements ...

=head1 SUBROUTINES / METHODS

=head1 DEPENDENCIES

Modules used, version dependencies, core yes/no

Moose

MooseX::AttributeHelpers

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
