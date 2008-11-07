#!/usr/bin/env perl 
package App::XML::Toolkit::Script::MakeClasses;
use Moose;
use XML::Toolkit::Builder;
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

has template => (
    isa    => File,
    is     => 'ro',
    coerce => 1,
);

has _builder => (
    reader     => 'builder',
    isa        => 'XML::Toolkit::Builder',
    is         => 'ro',
    lazy_build => 1,
    handles    => [qw(build_class)],
);

sub _build__builder {
    my %params = ( namespace => $_[0]->namespace );
    $params{template} = $_[0]->template->slurp if $_[0]->template;
    XML::Toolkit::Builder->new(%params);
}

sub run {
    my ($self) = @_;
    $self->builder->parse_file( $self->input->stringify );
    print $self->builder->render;
}

$XML::SAX::ParserPackage = "XML::LibXML::SAX";
__PACKAGE__->new_with_options->run unless caller;

no Moose;
1;
__END__
