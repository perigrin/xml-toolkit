package XML::Aiml::Topic::Category::Template::Condition::Li::Learn::Category::Pattern::Eval;
use Moose;
use MooseX::AttributeHelpers;

has 'uppercase_collection' => (
    isa =>
'ArrayRef[XML::Aiml::Topic::Category::Template::Condition::Li::Learn::Category::Pattern::Eval::Uppercase]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'uppercase' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
