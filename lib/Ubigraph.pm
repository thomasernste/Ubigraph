package Ubigraph;

use 5.008008;
use strict;
use warnings;
use Frontier::Client;

my $url = 'http://127.0.0.1:20738/RPC2';
my $client = Frontier::Client->new(url=>$url);
$client->call('ubigraph.clear',0);

sub clear {
    $client->call('ubigraph.clear');
}

### {{{ 'Ubigraph::Vertex' Class

package Ubigraph::Vertex;

sub new {
    my $class = shift;
    my $self = {vertex => $client->call('ubigraph.new_vertex')};
    my @param = @_;
    if ($#param > 0) {
	for (0..($#param / 2)) {
	    my $name = $param[2*$_];
	    my $value = $param[2*$_+1];
	    if ($name eq 'shapedetail' || $name eq 'label' || $name eq 'size' || $name eq 'fontsize') {
		$client->call('ubigraph.set_vertex_attribute',$self->{vertex},$name,$value." ");
	    } else {
		$client->call('ubigraph.set_vertex_attribute',$self->{vertex},$name,$value);
	    }
	}
    }
    return bless $self,$class;
}

sub remove {
    my $self = shift;
    $client->call('ubigraph.remove_vertex',$self->{vertex});
}

sub color {
    ## [default] "#0000ff"
    my $self = shift;
    my $color = shift;
    $client->call('ubigraph.set_vertex_attribute',$self->{vertex},'color',$color);
}

sub shape {
    ## [default] "cube" ("cone","cube","dodecahedron","icosahedron","octahedron","sphere","octahedron","torus")
    my $self = shift;
    my $shape = shift;
    $client->call('ubigraph.set_vertex_attribute',$self->{vertex},'shape',$shape);
}

sub shapedetail {
    ## [default] "10"
    my $self = shift;
    my $detail = shift;
    $client->call('ubigraph.set_vertex_attribute',$self->{vertex},'shapedetail',$detail." ");
}

sub label {
    ## [default] ""
    my $self = shift;
    my $label = shift;
    $client->call('ubigraph.set_vertex_attribute',$self->{vertex},'label',$label." ");
}

sub size {
    ## [defaulr] "1.0"
    my $self = shift;
    my $size = shift;
    $client->call('ubigraph.set_vertex_attribute',$self->{vertex},'size',$size." ");
}

sub fontcolor {
    ## [default] "#ffffff"
    my $self = shift;
    my $font_color = shift;
    $client->call('ubigraph.set_vertex_attribute',$self->{vertex},'fontcolor',$font_color);
}

sub fontfamily {
    ## [default] "Helvetica" ("Helvetica","Times Roman")
    my $self = shift;
    my $font_family = shift;
    $client->call('ubigraph.set_vertex_attribute',$self->{vertex},'fontfamily',$font_family);
}

sub fontsize {
    ## [default] "12"
    my $self = shift;
    my $font_size = shift;
    $client->call('ubigraph.set_vertex_attribute',$self->{vertex},'fontsize',$font_size." ");
}

sub callback_left_doubleclick {
    ## [default] "" (http://yourhostname.net/mothod_name)
    my $self = shift;
    my $double_click = shift;
    $client->call('ubigraph.set_vertex_attribute',$self->{vertex},'callback_left_doubleclick',$double_click);
}



package Ubigraph::Edge;

sub new {
    my $class = shift;
    my $vertex_a = shift;
    my $vertex_b = shift;
    my $self = {edge => $client->call('ubigraph.new_edge',$vertex_a->{vertex},$vertex_b->{vertex})};
    my @param = @_;

    if ($#param > 0) {
	for (0..($#param / 2)) {
	    my $name = $param[2*$_];
	    my $value = $param[2*$_+1];
	    if ($name eq 'arrow_position' || $name eq 'arrow_radius' || $name eq 'arrow_length' || $name eq 'label' || $name eq 'fontsize' || $name eq 'strength' || $name eq 'width') {
		$client->call('ubigraph.set_edge_attribute',$self->{edge},$name,$value." ");
	    } else {
		$client->call('ubigraph.set_edge_attribute',$self->{edge},$name,$value);
	    }
	}
    }
    return bless $self,$class;
}

sub remove {
    my $self = shift;
    $client->call('ubigraph.remove_edge',$self->{edge});
}

sub arrow {
    ## [default] "false" ("true"/"false")
    my $self = shift;
    my $arrow = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'arrow',$arrow);
}

sub arrow_position {
    ## [default] 0.5 (0.0 ~ 1.0)
    my $self = shift;
    my $arrow_position = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'arrow_position',$arrow_position." ");
}

sub arrow_radius {
    ## [default] 1.0
    my $self = shift;
    my $arrow_radius = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'arrow_radius',$arrow_radius." ");
}
sub arrow_length {
    ## [default] 1.0
    my $self = shift;
    my $arrow_length = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'arrow_length',$arrow_length." ");
}
sub arrow_reverse {
    ## [default] "false" ("true"/"false")
    my $self = shift;
    my $arrow_reverse = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'arrow_reverse',$arrow_reverse);
}

sub color {
    ## [default] "#0000ff"
    my $self = shift;
    my $color = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'color',$color);
}

sub label {
    ## [default] ""
    my $self = shift;
    my $label = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'label',$label." ");
}

sub fontcolor {
    ## [default] "#ffffff"
    my $self = shift;
    my $font_color = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'fontcolor',$font_color);
}

sub fontfamily {
    ## [default] "Helvetica" ("Helvetica","Times Roman")
    my $self = shift;
    my $font_family = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'fontfamily',$font_family);
}

sub fontsize {
    ## [default] "12"
    my $self = shift;
    my $font_size = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'fontsize',$font_size." ");
}

sub oriented {
    ## [default] "false" ("true"/"false")
    my $self = shift;
    my $oriented = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'oriented',$oriented);
}
sub spline {
    ## [default] "false" ("true"/"false")
    my $self = shift;
    my $spline = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'spline',$spline);
}

sub showstrain {
    ## [default] "false" ("true"/"false")
    my $self = shift;
    my $showstrain = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'showstrain',$showstrain);
}

sub stroke {
    ## [default] "solid" ("solid","dashed","dotted","none")
    my $self = shift;
    my $stroke = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'stroke',$stroke);
}

sub strength {
    ## [default] 1.0
    my $self = shift;
    my $strength = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'strength',$strength." ");
}

sub visible {
    ## [default] "true" ("true"/"false")
    my $self = shift;
    my $visible = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'visble',$visible);
}

sub width {
    ## [default] "1.0"
    my $self = shift;
    my $width = shift;
    $client->call('ubigraph.set_edge_attribute',$self->{edge},'width',$width." ");
}

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Ubigraph ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.01';


# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Ubigraph - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Ubigraph;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Ubigraph, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Tizona, E<lt>cory@bioinfo.sfc.keio.ac.jpE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Tizona

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
