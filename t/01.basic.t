#!/usr/bin/env perl

package XML::Toolkit::Tests::Base;
use Moose;
use MooseX::Types::Path::Class qw(Dir);

has test_dir => (
    isa => Dir,
    is  => 'ro',    
    default =>  sub { value }, 
);

has loader => (
    isa     => 'XML::Toolkit::Loader',
    is      => 'ro',
    handles => [qw(parse_uri root_object render output)],
);

sub _build_loader { XML::Toolkit::Loader->new() }

sub load {
    my ( $self, $filename ) = @_;
    $self->parse_uri( $self->file($filename)->stringify );
    $self->render;
}

my $xt = new __PACKAGE__;

$xt->load()
