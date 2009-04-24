package Acme::Perl_mongers::Group::Mailing_list;
use Moose;
use MooseX::AttributeHelpers;

has 'email_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Mailing_list::Email]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'email' },
     description => {
         sort_order => 0,
     },
);
has 'name_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Mailing_list::Name]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'name' },
     description => {
         sort_order => 1,
     },
);
has 'subscribe_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Mailing_list::Subscribe]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'subscribe' },
     description => {
         sort_order => 2,
     },
);
has 'unsubscribe_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Mailing_list::Unsubscribe]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'unsubscribe' },
     description => {
         sort_order => 3,
     },
);

no Moose;
1;
__END__
