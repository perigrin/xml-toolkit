package Acme::Perl_mongers;
use Moose;
use MooseX::AttributeHelpers;

has 'group_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'group' },
     description => {
         sort_order => 0,
     },
);

no Moose;
1;
__END__
