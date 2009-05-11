package XML::Aiml::Category::Template::Think::Think;
use Moose;
use MooseX::AttributeHelpers;

has 'srai_collection' => (
    isa        => 'ArrayRef[XML::Aiml::Category::Template::Think::Think::Srai]',
    is         => 'ro',
    traits     => ['XML'],
    metaclass  => 'Collection::Array',
    lazy       => 1,
    auto_deref => 1,
    default    => sub { [] },
    provides   => { push => 'srai' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
