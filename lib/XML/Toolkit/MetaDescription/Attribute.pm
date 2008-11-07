package XML::Toolkit::MetaDescription::Attribute;
use Moose;

use XML::Toolkit::MetaDescription;

extends 'MooseX::MetaDescription::Meta::Attribute';
with 'XML::Toolkit::MetaDescription::Trait';

has '+metadescription_classname' =>
  ( default => 'XML::Toolkit::MetaDescription' );

no Moose;
1;
__END__
