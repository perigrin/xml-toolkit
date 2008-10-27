#!/usr/bin/env perl
use Test::More no_plan => undef;

BEGIN { use_ok('XML::Toolkit::Loader') }

package XML::Toolkit::Tests::Base;
use Moose;
use MooseX::Types::Path::Class qw(Dir);
use XML::Toolkit::Loader;

has test_dir => (
    isa     => Dir,
    is      => 'ro',
    coerce  => 1,
    default => sub { 't/data' },
    handles => [qw(file)],
);

has loader => (
    isa        => 'XML::Toolkit::Loader',
    is         => 'ro',
    lazy_build => 1,
    handles    => [qw(parse_string root_object render output)],
);

sub _build_loader { XML::Toolkit::Loader->new( namespace => __PACKAGE__ ) }

sub run {
    my ( $self, $filename ) = @_;
    ::ok( $self->loader->parser,          'we can haz parser' );
    ::ok( $self->parse_string('<foo />'), 'parse_string' );
    ::ok( $self->render,                  'we can render' );
}

__PACKAGE__->new->run
