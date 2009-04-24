package Acme::Perl_mongers::Group::Tsar;
use Moose;
use MooseX::AttributeHelpers;

has 'email_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Tsar::Email]',
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
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Tsar::Name]',
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
has 'pause_id_collection' => (
     isa         => 'ArrayRef[Acme::Perl_mongers::Group::Tsar::Pause_id]',
     is          => 'ro',
     traits      => [ 'MooseX::MetaDescription::Meta::Trait' ],     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => 'pause_id' },
     description => {
         sort_order => 2,
     },
);

no Moose;
1;
__END__
