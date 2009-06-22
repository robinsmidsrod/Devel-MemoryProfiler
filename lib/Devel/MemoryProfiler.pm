package Devel::MemoryProfiler;

use strict;
use warnings;
our $VERSION = '0.01';

package DB;

use GTop ();

my $gtop = GTop->new();
my $prev_vsize = get_vsize();

open(my $fh, ">", "memprof.dmp") or die("Cannot write to memprof.dmp: $!");

sub DESTROY {
    close($fh);
}

# statement debugger
sub DB {
  my $new_vsize = get_vsize();
  my $delta_vsize = $new_vsize - $prev_vsize;
  my ($package, $filename, $line) = caller;
  if ( $delta_vsize != 0 ) {
    print $fh join("|", $package, $filename, $line, $new_vsize, $delta_vsize);
    if ( defined($main::{"_<$filename"}[$line]) ) {
      print $fh "|" . $main::{"_<$filename"}[$line];
    }
    else {
      print $fh "\n";
    }
  }
  $prev_vsize = $new_vsize;
  return;
}

# Fetch current virtual size of process
sub get_vsize {
    return 0 unless $gtop;
    return $gtop->proc_mem($$)->vsize();
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
