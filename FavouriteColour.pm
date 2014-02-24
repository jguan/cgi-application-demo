package FavouriteColour;

use strict;
use warnings;

use base 'CGI::Application';
use CGI::Application::Plugin::FillInForm qw/fill_form/;
use CGI::Application::Plugin::ConfigAuto qw/cfg/;
use CGI::Application::Plugin::Redirect;
use HTML::Template;
use Data::Dumper;

sub setup {
	my $self = shift;
	$self->tmpl_path('/path/to/my/templates/');
	$self->start_mode('mode1');
	$self->mode_param('rm');
	$self->run_modes(
		'mode1' => 'choose_colour',
		'mode2' => 'show_result'
	);
	$self->param($self->cfg);
}

sub choose_colour {
	my $self = shift;
	my $template = $self->load_tmpl('form.html');	
	my $q = $self->query();
	my $colour = $q->param('colour');
	my $colours = $self->param('COLOURS');
	if (defined $colour and !(grep(/^$colour$/, map($_->{'COLOUR'}, @$colours)))) {
		return $self->redirect('http://www.google.com/');
	} else {
		$template->param(COLOURS => $colours);
		return $self->fill_form(\$template->output);
	}
}

sub show_result {
	my $self = shift;
	my $template = $self->load_tmpl('result.html');
	my $q = $self->query();
	my $colour = $q->param('colour');
	my $colours = $self->param('COLOURS');
	if (!(defined $colour) or defined $colour and !(grep(/^$colour$/, map($_->{'COLOUR'}, @$colours)))) {
		return $self->redirect('http://www.google.com/');
	} else {
		$template->param(COLOUR => $colour);
		return $self->fill_form(\$template->output);
	}
}

1;
