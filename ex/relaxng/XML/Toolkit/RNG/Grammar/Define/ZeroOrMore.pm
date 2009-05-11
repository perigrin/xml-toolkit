package XML::Toolkit::RNG::Grammar::Define::ZeroOrMore;
use Moose;
use MooseX::AttributeHelpers;

has 'attribute_collection' => (
    isa =>
      'ArrayRef[XML::Toolkit::RNG::Grammar::Define::ZeroOrMore::Attribute]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'attribute' },
    description => { sort_order => 0, },
);

has 'element_collection' => (
    isa => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::ZeroOrMore::Element]',
    is  => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'element' },
    description => { sort_order => 1, },
);

no Moose;
1;
__END__

=head1 NAME

XML::Toolkit::RNG::Grammar::Define::ZeroOrMore - A class to ...

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

use XML::Toolkit::RNG::Grammar::Define::ZeroOrMore;

=head1 DESCRIPTION

The XML::Toolkit::RNG::Grammar::Define::ZeroOrMore class implements ...

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
