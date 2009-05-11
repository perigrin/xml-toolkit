package XML::Generator::Moose;
use Moose;

extends qw(XML::Filter::Moose);

has Handler => (
    isa      => 'Object',
    is       => 'ro',
    required => 1,
    handles  => [qw(start_document end_document)]
);

after 'start_document' => sub {
    my ($self) = @_;
    $self->xml_decl( { Version => '1.0', Encoding => 'UTF-8' } );
    $self->newline;
};

sub start_element {
    my ( $self, $name, $attr ) = @_;
    $self->SUPER::start_element( { Name => $name, Attributes => $attr } );
}

sub end_element {
    my ( $self, $name ) = @_;
    $self->SUPER::end_element( { Name => $name } );
    $self->newline;
}

sub characters {
    my ( $self, $data ) = @_;
    $self->SUPER::characters( { Data => $data } );
}

sub newline {
    my $self = shift;
    $self->SUPER::characters( { Data => "\n" } );
}

sub cdata {
    my ( $self, $data ) = @_;
    $self->start_cdata();
    $self->characters($data);
    $self->end_cdata();
}

sub parse {
    my ($self) = @_;
    $self->start_document();
    inner();
    $self->end_document();
}

no Moose;
1;
__END__

=head1 NAME

XML::Generator::Moose - A Moose based subclass of XML::SAX::Base

=head1 SYNOPSIS
    
    package MySAX::Generator;
    use Moose;
    extends qw(XML::Generator::Moose);    


=head1 DESCRIPTION

XML::Generator::Moose is a subclass of XML::SAX::Base that provides a standard
framework and default implementation of methods for generating SAX events.
    
=head1 ATTRIBUTES

=over

=item Handler

=back

See Also XML::SAX::Base

=head1 METHODS

=over

=item start_element

=item end_element

=item characters

=item newline

=item cdata

=item parse

=back

See Also XML::SAX::Base

=head1 INCOMPATIBILITIES

None reported.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-xml-toolkit@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.

=head1 AUTHOR

Chris Prather  C<< <chris@prather.org> >>

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2008, Chris Prather C<< <chris@prather.org> >>. Some rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.
