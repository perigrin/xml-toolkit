package XML::Filter::Moose::Class;
use Moose;
use MooseX::AttributeHelpers;
use Template;
extends qw(XML::Filter::Moose);
with qw(XML::Filter::Moose::ClassRegistry);
with qw(XML::Filter::Moose::ClassTemplate);

no Moose;  # unimport Moose's keywords so they won't accidentally become methods
1;         # Magic true value required at end of module
__END__
