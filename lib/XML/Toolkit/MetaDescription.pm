package XML::ToolKit::MetaDescription;
use Moose;
use Moose::Util::TypeConstraints;

extends 'MooseX::MetaDescription::Description';

has 'sort_order' => ( is => 'ro', isa => 'Int', default => sub { 0 } );

no Moose;
1;
__END__
