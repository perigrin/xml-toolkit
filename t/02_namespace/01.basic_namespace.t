#!/usr/bin/env perl
use Test::More no_plan => undef;

BEGIN {
    use_ok('XML::Toolkit::Builder');
    use_ok('XML::Toolkit::Loader');
    use_ok('XML::Toolkit::Generator');
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
    default => sub {'t/data'},
    handles => [qw(file)],
);

has builder => (
    isa        => 'XML::Toolkit::Builder',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_builder {
    ::ok(
        my $b = XML::Toolkit::Builder->new(
            namespace     => __PACKAGE__,
            namespace_map => {
                'http://example.org/my/' => 'My',
            }
        ),
        'Build XML::Toolkit::Builder'
    );
    return $b;
}

has loader => (
    isa        => 'XML::Toolkit::Loader',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_loader {
    ::ok(
        my $l = XML::Toolkit::Loader->new(
            namespace     => __PACKAGE__,
            namespace_map => {
                'http://example.org/my/' => 'My',
            }
        ),
        'Build XML::Toolkit::Loader'
    );
    return $l;
}

has generator => (
    isa        => 'XML::Toolkit::Generator',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_generator {
    ::ok(
        my $g = XML::Toolkit::Generator->new,
        'Build XML::Toolkit::Loader'
    );
    return $g;
}
use Data::Dumper;

sub run {
    my ( $self, $filename ) = @_;
    my $xml = '<foo xmlns:my="http://example.org/my/"><my:bar /></foo>';
    $self->builder->parse_string($xml);
    my $class = $self->builder->render;
    ::ok( defined $class, 'build a class' );
    eval "$class";
    ::can_ok( 'XML::Toolkit::Tests::Base::Foo', 'new' );
    ::can_ok( 'My::Bar',                        'new' );
    $self->loader->parse_string($xml);
    my $tree = $self->loader->root_object;
    ::ok( $tree, 'parse_string' );
    my $tree2 = XML::Toolkit::Tests::Base::Foo->new(
        bar_collection => [ My::Bar->new() ] );
    $self->generator->render_object($tree2);
    ::ok( my @output = $self->generator->output, 'got output' );
}

__PACKAGE__->new->run
