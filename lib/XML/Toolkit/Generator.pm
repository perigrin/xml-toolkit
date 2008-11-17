package XML::Toolkit::Generator;
use Moose;

has output => (
    isa        => 'ArrayRef',
    is         => 'ro',
    default    => sub { [] },
    lazy       => 1,
    auto_deref => 1,
);

has handler => (
    isa        => 'Object',
    is         => 'ro',
    lazy_build => 1,
);

has quote_charecter => (
    isa     => 'Str',
    is      => 'ro',
    default => q['],
);

sub _build_handler {
    XML::SAX::Writer->new(
        Output         => scalar $_[0]->output,
        QuoteCharecter => $_[0]->quote_charecter,
    );
}

has generator => (
    does       => 'XML::Toolkit::Generator::Interface',
    is         => 'ro',
    lazy_build => 1,
    handles    => { render_object => 'parse' },
);

sub _build_generator {
    require XML::Toolkit::Generator::Default;
    XML::Toolkit::Generator::Default->new( Handler => $_[0]->handler );
}

no Moose;
1;
