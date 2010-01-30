package XML::Toolkit::Cmd::Command::generate;
use Moose;
use namespace::autoclean;

extends qw(MooseX::App::Cmd::Command);

use XML::Toolkit::Builder;
use MooseX::Types::Path::Class qw(File);
use Moose::Util::TypeConstraints;

with qw(MooseX::Getopt::Dashes);
with qw(XML::Toolkit::Cmd::ClassTemplate);

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

sub _build_namespace { 'MyApp' }

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

sub _build_filter_class { 'XML::Toolkit::Builder::FilterNS' }

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

around _build_template => sub {
    my ( $next, $self ) = ( shift, shift );
    my $template = <<'END_TEMPLATE';
    
[% PERL %]        
 use Devel::PackagePath;
 my $p = Devel::PackagePath->new( package => "[% meta.name %]");
 my $file  = (split '::', "[% meta.name %]")[-1];
 $p->create;
 $stash->set(filename => "${\$p->path}/$file.pm");
[% END %]
[%- FILTER redirect("${filename}") -%]
END_TEMPLATE

    $template .= $self->$next(@_) . "__END__\n[% END %]";
    return $template;
};

__PACKAGE__->meta->make_immutable;
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
