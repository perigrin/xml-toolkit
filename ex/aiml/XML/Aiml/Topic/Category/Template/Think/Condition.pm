package XML::Aiml::Topic::Category::Template::Think::Condition;
use Moose;
use MooseX::AttributeHelpers;

has 'li_collection' => (
    isa =>
      'ArrayRef[XML::Aiml::Topic::Category::Template::Think::Condition::Li]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'li' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
