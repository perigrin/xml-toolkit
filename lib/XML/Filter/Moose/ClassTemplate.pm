package XML::Filter::Moose::ClassTemplate;
use Moose::Role;

has template => (
    isa        => 'Str',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_template {
    local $/;
    <DATA>;
}

has tt_config => (
    isa     => 'HashRef',
    is      => 'ro',
    lazy    => 1,
    default => sub { { EVAL_PERL => 1, POST_CHOMP => 1 } },
);

has tt => (
    isa     => 'Template',
    is      => 'ro',
    lazy    => 1,
    default => sub { Template->new( $_[0]->tt_config ) },
    handles => [qw(process error)],
);

sub render {
    my ($self) = @_;
    $self->render_class($_)
      for ( sort { $a->name cmp $b->name } $self->classes );
}

sub render_class {
    my ( $self, $class ) = @_;
    my $template = $self->template;
    $self->process( \$template, { meta => $class } )
      || die $self->error;
}

no Moose::Role;
1;
__DATA__
package [% meta.name %];
use Moose;
[% FOR name IN meta.get_attribute_list -%]

    [% attr = meta.get_attribute(name) -%]
has '[% name %]' => (
        isa => '[% attr.type_constraint.name %]',
        is => '[% IF attr.has_accessor %]rw[% ELSE %]ro[%END%]', 
    );
[% END -%]

no Moose;
1;
__END__
