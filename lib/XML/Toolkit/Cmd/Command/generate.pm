package XML::Toolkit::Cmd::Command::generate;
use Moose;
use namespace::autoclean;

extends qw(MooseX::App::Cmd::Command);

use XML::Toolkit::Builder;
use MooseX::Types::Path::Class qw(File);
use Moose::Util::TypeConstraints;

with qw(MooseX::Getopt::Dashes);

has input => (
    isa      => File,
    is       => 'ro',
    coerce   => 1,
    required => 1,
);

has namespace => (
    isa        => 'Str',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_namespace {'MyApp'}

has xmlns => (
    isa     => 'HashRef',
    is      => 'ro',
    lazy    => 1,
    default => sub { {} },
);

has filter_class => (
    isa        => 'Str',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_filter_class {'XML::Toolkit::Builder::FilterNS'}

has template => (
    isa        => 'Str',
    is         => 'ro',
    lazy_build => 1,
);

has _builder => (
    reader     => 'builder',
    isa        => 'XML::Toolkit::Builder',
    is         => 'ro',
    lazy_build => 1,
    handles    => [qw(build_class)],
);

sub _build__builder {
    my ($self) = @_;
    return XML::Toolkit::Builder->new(
        namespace     => $self->namespace,
        template      => $self->template,
        filter_class  => $self->filter_class,
        namespace_map => $self->xmlns,
    );
}

sub run {
    my ($self) = @_;
    $self->builder->parse_file( $self->input->stringify );
    print $self->builder->render;
}

sub _build_template {
    return <<'END_TEMPLATE'

[% PERL %]        
 use Devel::PackagePath;
 my $p = Devel::PackagePath->new( package => "[% meta.name %]");
 my $file  = (split '::', $p->package)[-1];
 $p->create;
 $stash->set(filename => "${\$p->path}/$file.pm");
[% END %]
[%- FILTER redirect("${filename}") -%]
package [% meta.name %];
use Moose;
use XML::Toolkit;

[% FOREACH attr_name IN meta.get_attribute_list.sort -%]
[% attr = meta.get_attribute(attr_name) -%]
has '[% attr_name %]' => (
     isa         => '[% attr.type_constraint.name %]',
     is          => '[% IF attr.has_accessor %]rw[% ELSE %]ro[%END%]',
 [% IF attr.type_constraint.is_subtype_of("ArrayRef") -%]

     traits      => [ 'XML', 'Array' ],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handels    => { 'add_[% attr_name.remove("_collection") %]' => ['push'] },
     description => {
         sort_order => [% loop.index() %],
     },
[% ELSE -%]
 traits      => [ 'XML' ],
 description => {
[% FOREACH name IN attr.description.keys -%]
     [% name %] => "[% attr.description.$name %]",
[% END -%]
     sort_order => [% loop.index() %],
 },
[% END -%]
);
[% END -%]

no Moose;
1;
__END__
[% END %]
    
END_TEMPLATE

}

no Moose;
1;

__END__

=head1 NAME

XML::Toolkit::Cmd::Command::generate - generate clases from XML

=head1 SYNOPSIS

     xmltk generate 

=head1 DESCRIPTION

The XML::Toolkit::Cmd::Command::generate class implements ...

=head1 METHODS

Insert description of method here...

=head2 run()

Insert description of method here...

=head1 DEPENDENCIES

Moose

namespace::autoclean

XML::Toolkit::Builder

Moose::Util::TypeConstraints

Devel::PackagePath

Moose

MooseX::AttributeHelpers

XML::Toolkit

=head1 BUGS AND LIMITATIONS

None known currently, please email the author if you find any.

=head1 AUTHOR

Chris Prather (chris@prather.org)

=head1 LICENCE

Copyright 2009 by Chris Prather.

This software is free.  It is licensed under the same terms as Perl itself.

=cut
