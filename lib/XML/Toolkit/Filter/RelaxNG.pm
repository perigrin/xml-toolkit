package XML::Toolkit::Filter::RelaxNG;
use Moose;
use namespace::autoclean;

extends qw(XML::Filter::Moose);
with qw(XML::Filter::Moose::ClassRegistry);
with qw(XML::Filter::Moose::ClassTemplate);

augment 'start_element' => sub { 
     my ( $self, $el ) = @_;
     use Data::Dump::Streamer;
     confess Dump $el;
};


1;
__END__