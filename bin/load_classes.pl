#!/usr/bin/env perl 
package App::XML::Toolkit::Script::MakeClasses;
use Moose;
use XML::Toolkit::Loader;
use MooseX::Types::Path::Class qw(File);
use Moose::Util::TypeConstraints;

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

has _loader => (
    isa        => 'XML::Toolkit::Loader',
    reader     => 'loader',
    lazy_build => 1,
);

sub _build__loader {
    XML::Toolkit::Loader->new( namespace => $_[0]->namespace );
}

sub run {
    my ($self) = @_;
    $self->loader->parse_file( $self->input->stringify );
    print join '', @{ $self->loader->render };
}

$XML::SAX::ParserPackage = "XML::SAX::ExpatXS";
__PACKAGE__->new_with_options->run unless caller;

no Moose;
1;
__END__
