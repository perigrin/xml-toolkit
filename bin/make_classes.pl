#!/usr/bin/env perl 
package XML::Toolkit::Script::MakeClasses;
use Moose;
use XML::Toolkit::Builder;
use MooseX::Types::Path::Class qw(File);
with qw(MooseX::Getopt);

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

has _builder => (
    reader     => 'builder',
    isa        => 'XML::Toolkit::Builder',
    is         => 'ro',
    lazy_build => 1,
    handles    => [qw(build_class)],
);

sub _build__builder { XML::Toolkit::Builder->new( namespace => $_[0]->namespace ) }

sub run {
    my ($self) = @_;
    $self->builder->parse_file( $self->input->stringify );
    print $self->builder->render;
}

$XML::SAX::ParserPackage = "XML::SAX::ExpatXS";
__PACKAGE__->new_with_options->run unless caller;

no Moose;
1;
__END__
