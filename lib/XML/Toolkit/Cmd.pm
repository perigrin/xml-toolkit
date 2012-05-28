package XML::Toolkit::Cmd;
use Moose;
use namespace::autoclean;
extends qw(MooseX::App::Cmd);

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

xmltk - A Perl utility for generating XML::Toolkit compatabile classes from an XML Schema Document 

=head1 SYNOPSIS


    xmltk generate --input mydocument.xml --xmlns ''=MyApp

or

    xmltk validate --input mydocument.xml --package MyApp

=head1 DESCRIPTION

xmlns is a commandline utility for generating XML::Toolkit compatible classes from an XML Schema Document.
It can also be used to validate generated XML.

=head2 Commands

=over 4

=item generate

C<generate> is used to generate classes, requires the C<--input> parameter.
C<generate> will default to the MyApp name space unless the C<--xmlns> parameter is specified.
C<generate> will optionally take a template parameter.

    usage:  xmltk generate [long options...]
    --input (required)  specify the input XSD

    --xmlns                 specify the XML name space
    --template              specify the TT template
    --help                  display this message

=item validate

C<validate> is used to validate round tripping, it requires both the C<--input> and the C<--package> parameters

    usage:  xmltk validate [long options...]
    --input (required)      specify the input XSD
    --package (required)    specify the XML::Toolkit compatable package name

=back

=cut

=head1 SEE ALSO

L<XML::Toolkit> - Parent project

L<PRANG|PRANG>, L<XML::Compile|XML::Compile> and L<XML::Pastor|XML::Pastor>
have similarities to C<XML::Toolkit> in scope if not design.

=head1 DEPENDENCIES

L<Devel::PackagePath|Devel::PackagePath>, L< Moose | Moose >,
L<MooseX::MetaDescription|MooseX::MetaDescription>,
L<MooseX::Types::Path::Class|MooseX::Types::Path::Class>,
L<MooseX::App::Cmd|MooseX::App::Cmd>, L<Template::Toolkit|Template::Toolkit>,
L<XML::SAX|XML::SAX>, L<XML::SAX::Writer|XML::SAX::Writer>,
L<Bread::Board|Bread::Board> and L<namespace::autoclean|namespace::autoclean>

=head1 INCOMPATIBILITIES

None reported.

=head1 BUGS AND LIMITATIONS

Currently XML::Toolkit only supports Auto-Discovery of class hierarchy from
XML instances, and does not know anything about DTDs, RelaxNG, XML-Schema or
anything else. Future work is being considered in this, and patches may be
accepted if they come with documentation and tests.

Please report any bugs or feature requests to C<bug-xml-toolkit@rt.cpan.org>,
or through the web interface at L<http://rt.cpan.org>. Additional support may
be available via C<#xml-toolkit> on C<irc.perl.org>.

=head1 AUTHORS

Chris Prather  C<< <chris@prather.org> >>
Robin Smidsrød C<< <robin@smidsrod.no> >>
Jesse Luehrs C<< <doy@cpan.org> >>

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2008-2010, Chris Prather C<< <chris@prather.org> >>. Some
rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.


