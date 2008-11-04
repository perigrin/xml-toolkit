#!/usr/bin/env perl
use Test::More no_plan => undef;

BEGIN {
    use_ok('XML::Toolkit::Builder');
    use_ok('XML::Toolkit::Loader');
}

package XML::Toolkit::Tests::Base;
use Moose;
use MooseX::Types::Path::Class qw(Dir);
use XML::Toolkit::Builder;
use XML::Toolkit::Loader;

has test_dir => (
    isa     => Dir,
    is      => 'ro',
    coerce  => 1,
    default => sub { 't/data' },
    handles => [qw(file)],
);

has builder => (
    isa        => 'XML::Toolkit::Builder',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_builder { XML::Toolkit::Builder->new( namespace => __PACKAGE__ ) }

has loader => (
    isa        => 'XML::Toolkit::Loader',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_loader { XML::Toolkit::Loader->new( namespace => __PACKAGE__ ) }

sub run {
    my ( $self, $filename ) = @_;
    $self->builder->parse_string('<foo><bar /></foo>');
    my $class = $self->builder->render;
    ::ok( defined $class, 'build a class' );
    eval "$class";
    $self->loader->parse_string('<foo><bar /></foo>');
    my $tree = $self->loader->render;
    ::ok( $tree, 'parse_string' );
    my $tree2 = XML::Toolkit::Tests::Base::Foo->new(
        bar => [
            XML::Toolkit::Tests::Base::Foo::Bar->new(),
            XML::Toolkit::Tests::Base::Foo::Bar->new()
        ]
    );


}

__PACKAGE__->new->run
