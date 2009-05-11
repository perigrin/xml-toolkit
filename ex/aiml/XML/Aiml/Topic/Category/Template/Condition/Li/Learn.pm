package XML::Aiml::Topic::Category::Template::Condition::Li::Learn;
use Moose;
use MooseX::AttributeHelpers;

has 'category_collection' => (
    isa =>
'ArrayRef[XML::Aiml::Topic::Category::Template::Condition::Li::Learn::Category]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'category' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
