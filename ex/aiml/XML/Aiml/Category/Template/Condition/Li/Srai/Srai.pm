package XML::Aiml::Category::Template::Condition::Li::Srai::Srai;
use Moose;
use MooseX::AttributeHelpers;

has 'get_collection' => (
    isa =>
      'ArrayRef[XML::Aiml::Category::Template::Condition::Li::Srai::Srai::Get]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'get' },
    description => { sort_order => 0, },
);
has 'star_collection' => (
    isa =>
'ArrayRef[XML::Aiml::Category::Template::Condition::Li::Srai::Srai::Star]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'star' },
    description => { sort_order => 1, },
);
has 'text' => (
    isa         => 'Str',
    is          => 'rw',
    traits      => ['XML'],
    description => { sort_order => 2, },
);

no Moose;
1;
__END__
