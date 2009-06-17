package XML::Toolkit::RNG::OneOrMore;
use Moose;
use MooseX::AttributeHelpers;
use XML::Toolkit;

has 'ref_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Ref]',
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
