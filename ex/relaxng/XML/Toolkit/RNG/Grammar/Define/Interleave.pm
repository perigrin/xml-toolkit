package XML::Toolkit::RNG::Grammar::Define::Interleave;
use Moose;
use MooseX::AttributeHelpers;

has 'oneOrMore_collection' => (
    isa =>
      'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Interleave::OneOrMore]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'oneOrMore' },
    description => { sort_order => 0, },
);
has 'optional_collection' => (
    isa => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Interleave::Optional]',
    is  => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'optional' },
    description => { sort_order => 1, },
);
has 'ref_collection' => (
    isa    => 'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Interleave::Ref]',
    is     => 'ro',
    traits => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'ref' },
    description => { sort_order => 2, },
);
has 'zeroOrMore_collection' => (
    isa =>
      'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Interleave::ZeroOrMore]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'zeroOrMore' },
    description => { sort_order => 3, },
);

no Moose;
1;
__END__

=head1 NAME

XML::Toolkit::RNG::Grammar::Define::Interleave - A class to ...

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

use XML::Toolkit::RNG::Grammar::Define::Interleave;

=head1 DESCRIPTION

The XML::Toolkit::RNG::Grammar::Define::Interleave class implements ...

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
