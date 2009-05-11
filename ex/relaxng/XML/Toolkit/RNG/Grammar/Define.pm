package XML::Toolkit::RNG::Grammar::Define;
use Moose;
use MooseX::AttributeHelpers;

has 'choice_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Choice]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'choice' },
    description => { sort_order => 0, },
);

has 'element_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Element]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'element' },
    description => { sort_order => 1, },
);

has 'interleave_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Interleave]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'interleave' },
    description => { sort_order => 2, },
);

has 'name' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "name",
        node_type    => "attribute",
        Name         => "name",
        NamespaceURI => "",
        sort_order   => 3,
    },
);

has 'optional_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Optional]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'optional' },
    description => { sort_order => 4, },
);

has 'zeroOrMore_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::ZeroOrMore]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'zeroOrMore' },
    description => { sort_order => 5, },
);

no Moose;
1;
__END__

=head1 NAME

XML::Toolkit::RNG::Grammar::Define - A class to ...

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

use XML::Toolkit::RNG::Grammar::Define;

=head1 DESCRIPTION

The XML::Toolkit::RNG::Grammar::Define class implements ...

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
