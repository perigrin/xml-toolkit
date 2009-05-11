package XML::Toolkit::RNG::Grammar::Define::Optional::Attribute::Choice;
use Moose;
use MooseX::AttributeHelpers;

has 'value_collection' => (
    isa =>
'ArrayRef[XML::Toolkit::RNG::Grammar::Define::Optional::Attribute::Choice::Value]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'value' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__

=head1 NAME

XML::Toolkit::RNG::Grammar::Define::Optional::Attribute::Choice - A class to ...

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

use XML::Toolkit::RNG::Grammar::Define::Optional::Attribute::Choice;

=head1 DESCRIPTION

The XML::Toolkit::RNG::Grammar::Define::Optional::Attribute::Choice class implements ...

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
