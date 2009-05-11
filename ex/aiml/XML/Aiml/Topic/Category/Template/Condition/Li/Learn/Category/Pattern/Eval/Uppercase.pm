package XML::Aiml::Topic::Category::Template::Condition::Li::Learn::Category::Pattern::Eval::Uppercase;
use Moose;
use MooseX::AttributeHelpers;

has 'get_collection' => (
    isa =>
'ArrayRef[XML::Aiml::Topic::Category::Template::Condition::Li::Learn::Category::Pattern::Eval::Uppercase::Get]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'get' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
