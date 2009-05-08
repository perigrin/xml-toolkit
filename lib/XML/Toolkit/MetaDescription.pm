package XML::ToolKit::MetaDescription;
use Moose;
use Moose::Util::TypeConstraints;

extends 'MooseX::MetaDescription::Description';

has 'sort_order' => ( is => 'ro', isa => 'Int', default => sub { 0 } );

no Moose;
1;

__END__

=head1 NAME

XML::ToolKit::MetaDescription - A class to ...

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

use XML::ToolKit::MetaDescription;

=head1 DESCRIPTION

The XML::ToolKit::MetaDescription class implements ...

=head1 SUBROUTINES / METHODS

=head1 DEPENDENCIES

Modules used, version dependencies, core yes/no

Moose

Moose::Util::TypeConstraints

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
