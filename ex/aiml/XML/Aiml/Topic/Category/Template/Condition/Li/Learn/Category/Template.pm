package XML::Aiml::Topic::Category::Template::Condition::Li::Learn::Category::Template;
use Moose;
use MooseX::AttributeHelpers;

has 'eval_collection' => (
    isa =>
'ArrayRef[XML::Aiml::Topic::Category::Template::Condition::Li::Learn::Category::Template::Eval]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'eval' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
