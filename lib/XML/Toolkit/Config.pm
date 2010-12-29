package XML::Toolkit::Config;
use Moose::Role;
use namespace::autoclean;

requires qw(
  builder
  loader
  generator
);

1
__END__

