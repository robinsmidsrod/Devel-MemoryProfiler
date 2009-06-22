package Devel::MemoryProfiler;

use strict;
use warnings;
our $VERSION = '0.01';

package DB;

sub DB {
  my ($package, $filename, $line) = caller;
  print $main::{"_<$filename"}[$line];
}


1;
__END__

=head1 NAME

Devel::MemoryProfiler -

=head1 SYNOPSIS

  use Devel::MemoryProfiler;

=head1 DESCRIPTION

Devel::MemoryProfiler is

=head1 AUTHOR

Robin Smidsrød E<lt>robin@smidsrod.noE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
