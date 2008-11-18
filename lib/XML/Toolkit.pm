package XML::Toolkit;
use strict;
our $VERSION = '0.03';

1;    # Magic true value required at end of module
__END__

=head1 NAME

XML::Toolkit - A set of tools for dealing with XML with the Way of the Moose.


=head1 VERSION

This document describes XML::Toolkit version 0.0.1


=head1 SYNOPSIS

  use XML::Toolkit::Loader;
  my $loader = XML::Toolkit::Loader->new( namespace => $namespace );
  $loader->parse_file( $$file );
  print join '', @{ $loader->render };
  
  
=head1 DESCRIPTION

XML::Toolkit is less a specific module as it is a suite of related modules 
that provide a way to interact with XML more like an ORM. 

THIS RELEASE IS CONSIDERED ALPHA QUALITY. USE IT AT YOUR OWN RISK. 

There are no significant tests (beyond bare bones functional ones), and no
significant documentation (beyond what you're reading now). 

=head1 CONFIGURATION AND ENVIRONMENT

XML::Toolkit requires no configuration files or environment variables.


=head1 DEPENDENCIES

'Moose', 'Moose::Autobox','MooseX::AttributeHelpers', 'XML::SAX',
'MooseX::Types::Path::Class', 'XML::SAX::Writer', 'Encode', 'Template'

=head1 INCOMPATIBILITIES

None reported.


=head1 BUGS AND LIMITATIONS

THIS IS ALPHA QUALITY. USE AT YOUR OWN RISK. 

While XML::Toolkit has been used in two projects in production, it is still
considered alpha and may cause monkeys to fly out of delicate places. 

Currently it only supports Auto-Discovery of class hierarchy from XML
instances, and does not know anything about DTDs, RelaxNG, XML-Schema or
anything else. Future work is being considered in this, and patches may be
accepted if they come with documentation and tests.

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-xml-toolkit@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.


=head1 AUTHOR

Chris Prather  C<< <perigrin@cpan.org> >>


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2008, Chris Prather C<< <perigrin@cpan.org> >>. Some rights reserved.

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
