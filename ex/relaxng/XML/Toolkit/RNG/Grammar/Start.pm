package XML::Toolkit::RNG::Grammar::Start;
use Moose;
use MooseX::AttributeHelpers;

has 'ref_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Grammar::Start::Ref]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'ref' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
