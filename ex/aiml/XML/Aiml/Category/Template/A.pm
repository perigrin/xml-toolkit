package XML::Aiml::Category::Template::A;
use Moose;
use MooseX::AttributeHelpers;

has 'href' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "href",
        node_type    => "attribute",
        Name         => "href",
        NamespaceURI => "",
        sort_order   => 0,
    },
);
has 'target' => (
    isa         => 'Str',
    is          => 'ro',
    traits      => ['XML'],
    description => {
        Prefix       => "",
        LocalName    => "target",
        node_type    => "attribute",
        Name         => "target",
        NamespaceURI => "",
        sort_order   => 1,
    },
);
has 'text' => (
    isa         => 'Str',
    is          => 'rw',
    traits      => ['XML'],
    description => { sort_order => 2, },
);

no Moose;
1;
__END__

=head1 NAME

XML::Aiml::Category::Template::A - A class to ...

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

use XML::Aiml::Category::Template::A;

=head1 DESCRIPTION

The XML::Aiml::Category::Template::A class implements ...

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
