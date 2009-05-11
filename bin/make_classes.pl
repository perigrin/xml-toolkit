#!/usr/bin/env perl 
use FindBin qw($Bin);
use lib qw($Bin..lib);
package App::XML::Toolkit::Script::MakeClasses;
use Moose;
use XML::Toolkit::Builder;
use MooseX::Types::Path::Class qw(File);
use Moose::Util::TypeConstraints;

with qw(MooseX::Getopt);

has input => (
    isa      => File,
    is       => 'ro',
    coerce   => 1,
    required => 1,
);

has namespace => (
    isa        => 'Str',
    is         => 'ro',
    lazy_build => 1,
);

sub _build_namespace { 'MyApp' }

has template => (
    isa        => 'Str',
    is         => 'ro',
    lazy_build => 1,
);

has _builder => (
    reader     => 'builder',
    isa        => 'XML::Toolkit::Builder',
    is         => 'ro',
    lazy_build => 1,
    handles    => [qw(build_class)],
);

sub _build__builder {
    my %params = ( namespace => $_[0]->namespace );
    $params{template} = $_[0]->template;
    XML::Toolkit::Builder->new(%params);
}

sub run {
    my ($self) = @_;
    $self->builder->parse_file( $self->input->stringify );
    print $self->builder->render;
}

$XML::SAX::ParserPackage = "XML::LibXML::SAX";
__PACKAGE__->new_with_options->run unless caller;

sub _build_template {
    return <<'END_TEMPLATE'

[% PERL %]        
 use Devel::PackagePath;
 my $p = Devel::PackagePath->new( package => "[% meta.name %]");
 my $file  = (split '::', $p->package)[-1];
 $p->create;
 $stash->set(filename => "${\$p->path}/$file.pm");
[% END %]
[%- FILTER redirect("${filename}") -%]
package [% meta.name %];
use Moose;
use MooseX::AttributeHelpers;

[% FOREACH attr_name IN meta.get_attribute_list.sort -%]
[% attr = meta.get_attribute(attr_name) -%]
has '[% attr_name %]' => (
     isa         => '[% attr.type_constraint.name %]',
     is          => '[% IF attr.has_accessor %]rw[% ELSE %]ro[%END%]',
     traits      => [ 'XML' ],
 [% IF attr.type_constraint.is_subtype_of("ArrayRef") -%]
     metaclass   => 'Collection::Array',
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     provides    => { push => '[% attr_name.remove("_collection") %]' },
     description => {
         sort_order => [% loop.index() %],
     },
[% ELSE -%]
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
1;
__END__
[% END %]
    
END_TEMPLATE

}

no Moose;
1;
__END__
