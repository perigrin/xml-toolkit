package XML::Aiml::Category::Template::Condition::B;
use Moose;
use MooseX::AttributeHelpers;

has 'em_collection' => (
    isa         => 'ArrayRef[XML::Aiml::Category::Template::Condition::B::Em]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'em' },
    description => { sort_order => 0, },
);
has 'star_collection' => (
    isa        => 'ArrayRef[XML::Aiml::Category::Template::Condition::B::Star]',
    is         => 'ro',
    traits     => ['XML'],
    metaclass  => 'Collection::Array',
    lazy       => 1,
    auto_deref => 1,
    default    => sub { [] },
    provides   => { push => 'star' },
    description => { sort_order => 1, },
);

no Moose;
1;
__END__
