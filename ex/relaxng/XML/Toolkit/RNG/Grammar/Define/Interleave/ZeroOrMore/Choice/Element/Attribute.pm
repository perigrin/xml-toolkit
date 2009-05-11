package XML::Toolkit::RNG::Grammar::Define::Interleave::ZeroOrMore::Choice::Element::Attribute;
use Moose;
use MooseX::AttributeHelpers;

has 'data_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Interleave::ZeroOrMore::Choice::Element::Attribute::Data]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'data' },
    description => { sort_order => 0, },
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
        sort_order   => 1,
    },
);

no Moose;
1;
__END__

=head1 NAME

XML::Toolkit::RNG::Grammar::Define::Interleave::ZeroOrMore::Choice::Element::Attribute - A class to ...

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

use XML::Toolkit::RNG::Grammar::Define::Interleave::ZeroOrMore::Choice::Element::Attribute;

=head1 DESCRIPTION

The XML::Toolkit::RNG::Grammar::Define::Interleave::ZeroOrMore::Choice::Element::Attribute class implements ...

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
