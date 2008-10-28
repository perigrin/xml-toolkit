package XML::Filter::Moose::ClassTemplate;
use Moose::Role;

has template => (
    isa        => 'Str',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_template {
    return <<'END_TEMPLATE'
    # [% meta.name.replace('::', '/') %].pm
    package [% meta.name %];
    use Moose;
    use MooseX::AttributeHelpers;

    [% FOREACH attr_name IN meta.get_attribute_list.sort -%]
    [%- attr = meta.get_attribute(attr_name) -%]
    has '[% attr_name %]' => (
            isa         => '[% attr.type_constraint.name %]',
            is          => '[% IF attr.has_accessor %]rw[% ELSE %]rw[%END%]',

        [%- IF attr.type_constraint.is_subtype_of("ArrayRef") -%]
            metaclass   => 'Collection::Array',
            lazy        => 1,
            auto_deref  => 1,
            default     => sub { [] },
            provides    => { push => '[% attr_name.remove("_collection") %]' },
            description => {
                sort_order => [% loop.index() %],
            },
    [% ELSE -%]
        metaclass   => 'MooseX::MetaDescription',
        description => {
    [% FOREACH name IN attr.description.keys -%]
            [% name %] => "[% attr.description.$name %]",
    [% END -%]
            sort_order => [% loop.index() %],
        },
    [% END -%]
    );
    [% END -%]

    no Moose;

END_TEMPLATE

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
    my $output;
    $output .= $self->render_class($_)
      for ( sort { $a->name cmp $b->name } $self->classes );
    return $output;
}

sub render_class {
    my ( $self, $class ) = @_;
    my $template = $self->template;
    my $output;
    $self->process( \$template, { meta => $class }, \$output )
      || die $self->error;
    return $output;
}

no Moose::Role;
1;
__END__
