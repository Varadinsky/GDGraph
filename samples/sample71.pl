use GD::Graph::mixed;
use constant PI => 4 * atan2(1,1);
require 'save.pl';

print STDERR "Processing sample 7-1\n";

@data = ( 
    ["1st","2nd","3rd","4th","5th","6th","7th", "8th", "9th"],
    [    1,    2,    5,    6,    3,  1.5,   -1,    -3,    -4],
    [   -4,   -3,    1,    1,   -3, -1.5,   -2,    -1,     0],
    [    9,    8,    9,  8.4,  7.1,  7.5,    8,     3,    -3],
	[  0.1,  0.2,  0.5,  0.4,  0.3,  0.5,  0.1,     0,   0.4],
	[ -0.1,    2,    5,    4,   -3,  2.5,  3.2,     4,    -4],
);

$my_graph = new GD::Graph::mixed();

$my_graph->set( 
	types => [ qw( lines bars points area linespoints ) ],
	default_type => 'points',
);

$my_graph->set( 

	x_label => 'X Label',
	y_label => 'Y label',
	title => 'Mixed Type and TTF',

	y_max_value => 10,
	y_min_value => -5,
	y_tick_number => 3,
	y_label_skip => 1,
	x_plot_values => 1,
	y_plot_values => 1,

	long_ticks => 1,
	x_ticks => 0,
	x_labels_vertical => 1,

	legend_marker_width => 24,
	line_width => 3,
	marker_size => 5,

	bar_spacing => 6,

	legend_placement => 'RC',
);

$my_graph->set_title_font('../20thcent.ttf', 18);
$my_graph->set_x_label_font('../cetus.ttf', 10);
$my_graph->set_y_label_font('../cetus.ttf', 10);
$my_graph->set_x_axis_font('../cetus.ttf', 8);
$my_graph->set_y_axis_font('../cetus.ttf', 8);
$my_graph->set_legend_font('../cetus.ttf', 9);

$my_graph->set_legend( qw( one two three four five six ) );

if ($my_graph->can_do_ttf)
{
	my $gd = $my_graph->gd;
	my $white = $gd->colorAllocate(255,255,255);
	my $pink = $gd->colorAllocate(255,240,240);
	$gd->stringTTF($pink, '../20thcent.ttf', 72, PI/6, 20, 280, 'GD::Graph');
}

$my_graph->plot(\@data);
save_chart($my_graph, 'sample71');

