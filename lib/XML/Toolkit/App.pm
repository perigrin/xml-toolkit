package XML::Toolkit::App;
use Moose;

use XML::Toolkit::Config::Container;

with qw( XML::Toolkit::Builder::NamespaceRegistry );

has _config => (
    does     => 'XML::Toolkit::Config',
    handles  => 'XML::Toolkit::Config',
    lazy     => 1,
    init_arg => 'config',
    builder  => '_build_config_container',
);

sub _build_config_container {
    my ($self) = @_;
    XML::Toolkit::Config::Container->new( xmlns => $self->xmlns ),;
}

1;
__END__

=head1 NAME

XML::Toolkit::App - An XML::Toolkit Application

=head1 SYNOPSIS

    use XML::Toolkit::App;
    
    my $loader = XML::Toolkit::App->new( xmlns => { '' => 'MyApp' } )->loader;
    $loader->parse_file( $file );
    print join '', @{ $loader->render };

or

    use XML::Toolkit::App;
    my $builder = XML::Toolkit::App->new( xmlns => { '' => 'MyApp' } )->builder
    $builder->parse_string($xml)
    say $builder->render()
    
=head1 DESCRIPTION

C<XML::Toolkit::App> is the primary point of entry for applications
based on XML::Toolkit.

Once one has a class hierarchy (see XML::Toolkit for instructions on
how to do this), loading XML into this hierarchy is done by using
either C<loader> or C<builder> instance, which accept a filename and
an XML string, respectively. 

=head1 SUBROUTINES / METHODS

=over 4

=item C<new>

Creates a new instance of XML::Toolkit::App.  Should be passed the
xmlns mapping specified in the call to C<xmltk generate>.

=item C<loader>

C<loader> creates a new instance of XML::Toolkit::Loader and returns
it; this is used to parse XML files given a filename.  See
XML::Toolkit::Loader. 

=item C<builder>

C<builder> creates a new instance of XML::Toolkit::Builder and returns
it; this is used to parse XML passed as a string.  See
XML::Toolkit::Builder. 

=back

=head1 DEPENDENCIES

Moose

=head1 AUTHOR

Chris Prather (chris@prather.org)

Documentation nurtured from random bit mutations by Jashank Jeremy
(jashank@rulingia.com).

=head1 LICENCE

Copyright 2009 by Chris Prather.

This software is free.  It is licensed under the same terms as Perl itself.

=cut
