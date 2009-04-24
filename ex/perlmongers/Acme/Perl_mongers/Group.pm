package Acme::Perl_mongers::Group;
use Moose;
use MooseX::AttributeHelpers;

has 'date_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Date]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'date' },
     description => {
         sort_order => 0,
     },
);
has 'email_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Email]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'email' },
     description => {
         sort_order => 1,
     },
);
has 'id' => (
     isa         => 'Str',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ], description => {
     Prefix => "",
     LocalName => "id",
     node_type => "attribute",
     Name => "id",
     NamespaceURI => "",
     sort_order => 2,
 },
);
has 'location_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Location]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'location' },
     description => {
         sort_order => 3,
     },
);
has 'mailing_list_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Mailing_list]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'mailing_list' },
     description => {
         sort_order => 4,
     },
);
has 'name_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Name]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'name' },
     description => {
         sort_order => 5,
     },
);
has 'status' => (
     isa         => 'Str',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ], description => {
     Prefix => "",
     LocalName => "status",
     node_type => "attribute",
     Name => "status",
     NamespaceURI => "",
     sort_order => 6,
 },
);
has 'tsar_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Tsar]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'tsar' },
     description => {
         sort_order => 7,
     },
);
has 'web_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Web]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'web' },
     description => {
         sort_order => 8,
     },
);

no Moose;
1;
__END__
