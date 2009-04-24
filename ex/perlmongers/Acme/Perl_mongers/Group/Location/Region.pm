package Acme::Perl_mongers::Group::Location::Region;
use Moose;
use MooseX::AttributeHelpers;

has 'text' => (
     isa         => 'Str',
     is          => 'rw',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ], description => {
     sort_order => 0,
 },
);

no Moose;
1;
__END__
