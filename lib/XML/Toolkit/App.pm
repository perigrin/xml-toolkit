package XML::Toolkit::App;
use Moose;
our $VERSION = '0.02';

use XML::Toolkit::Config::Container;

has xmlns => (
    isa     => 'HashRef',
    is      => 'ro',
    lazy    => 1,
    builder => 'default_xmlns',
);

sub default_xmlns { { 'MyApp' => '', } }

has config_container => (
    does    => 'XML::Toolkit::Config',
    handles => 'XML::Toolkit::Config',
    lazy    => 1,
    builder => '_build_config_container',
);

sub _build_config_container {
    my ($self) = @_;
    XML::Toolkit::Config::Container->new( xmlns => $self->xmlns ),;
}

1;
__END__

=head1 NAME

XML::Toolkit::App - An XML::Toolkit Application

=head1 VERSION

This documentation refers to version 0.02.

=head1 SYNOPSIS

    use XML::Toolkit::App;
    
    my $loader = XML::Toolkit::App->new( xmlns => { '' => 'MyApp' } )->loader;
    $loader->parse_file( $$file );
    print join '', @{ $loader->render };

or

    use XML::Toolkit::App;
    my $builder = my $builder = XML::Toolkit::App->new( xmlns => { '' => 'MyApp' } )->builder
    $builder->parse_string($xml)
    say $builder->render()
    
=head1 DESCRIPTION

=head1 SUBROUTINES / METHODS

=head1 DEPENDENCIES

Moose

=head1 AUTHOR

Chris Prather (chris@prather.org)

=head1 LICENCE

Copyright 2009 by Chris Prather.

This software is free.  It is licensed under the same terms as Perl itself.

=cut
