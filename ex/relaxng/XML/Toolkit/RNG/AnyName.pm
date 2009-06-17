package XML::Toolkit::RNG::AnyName;
use Moose;
use MooseX::AttributeHelpers;
use XML::Toolkit;

has 'except_collection' => (
    isa         => 'ArrayRef[XML::Toolkit::RNG::Except]',
    is          => 'ro',
    traits      => ['XML'],
    metaclass   => 'Collection::Array',
    lazy        => 1,
    auto_deref  => 1,
    default     => sub { [] },
    provides    => { push => 'except' },
    description => { sort_order => 0, },
);

no Moose;
1;
__END__
