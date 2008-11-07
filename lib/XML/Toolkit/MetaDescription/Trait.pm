package XML::Toolkit::MetaDescription::Trait;
use Moose::Role;

use XML::Toolkit::MetaDescription;

with 'MooseX::MetaDescription::Meta::Trait';

has '+metadescription_classname' =>
  ( default => 'XML::Toolkit::MetaDescription' );

no Moose;
1;
__END__
