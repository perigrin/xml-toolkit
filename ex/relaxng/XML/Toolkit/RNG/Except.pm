package XML::Toolkit::RNG::Except;
use Moose;
use MooseX::AttributeHelpers;
use XML::Toolkit;

has 'nsName_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::NsName]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'nsName' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
