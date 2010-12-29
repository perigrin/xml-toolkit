package XML::Toolkit::Cmd::Command::validate;
use Moose;
use namespace::autoclean;

use aliased 'XML::Toolkit::Config::Container' => 'XMLTK::App';
use MooseX::Types::Path::Class qw(File);
use Moose::Util::TypeConstraints;

extends qw(MooseX::App::Cmd::Command XML::Toolkit::App);

with qw(
  MooseX::Getopt::Dashes
);

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

sub run {
    my ($self) = @_;
    my $loader = $self->loader;
    $loader->parse_file( $self->input->stringify );
    my $generator = $self->generator;
    $generator->render_object($loader->root_object);
    print $generator->output;
}

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

XML::Toolkit::Cmd::Command::validate - validate XML round tripping

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

     xmltk generate 

=head1 DESCRIPTION

The XML::Toolkit::Cmd::Command::validate class implements ...

=head1 SUBROUTINES / METHODS

=head2 _build_namespace()

[Description of subroutine]

=head2 _build__loader()

Arguments:
    $_[0]

[Description of method]

=head2 run(self)

[Description of method]

=head1 DEPENDENCIES

Modules used, version dependencies, core yes/no

Moose

namespace::autoclean

XML::Toolkit::Loader

Moose::Util::TypeConstraints

=head1 NOTES

...

=head1 BUGS AND LIMITATIONS

None known currently, please email the author if you find any.

=head1 AUTHOR

Chris Prather (dcp@domain.tld)

=head1 LICENCE

Copyright 2009 by Chris Prather.

This software is free.  It is licensed under the same terms as Perl itself.

=cut
