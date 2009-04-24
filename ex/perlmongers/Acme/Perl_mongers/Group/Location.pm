package Acme::Perl_mongers::Group::Location;
use Moose;
use MooseX::AttributeHelpers;

has 'city_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Location::City]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'city' },
     description => {
         sort_order => 0,
     },
);
has 'continent_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Location::Continent]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'continent' },
     description => {
         sort_order => 1,
     },
);
has 'country_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Location::Country]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'country' },
     description => {
         sort_order => 2,
     },
);
has 'latitude_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Location::Latitude]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'latitude' },
     description => {
         sort_order => 3,
     },
);
has 'longitude_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Location::Longitude]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'longitude' },
     description => {
         sort_order => 4,
     },
);
has 'region_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Location::Region]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'region' },
     description => {
         sort_order => 5,
     },
);
has 'state_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Location::State]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'state' },
     description => {
         sort_order => 6,
     },
);

no Moose;
1;
__END__
