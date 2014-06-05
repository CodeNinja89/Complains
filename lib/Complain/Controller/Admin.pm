package Complain::Controller::Admin;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Complain::Controller::Admin - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash(template => 'adminIndex.tt2');
    $c->stash(resultset => $c->model('DB::Complain'));
}

sub base :Chained('/') :PathPart('admin') :CaptureArgs(0){
	my ($self, $c) = @_;
	$c->stash(resultset => $c->model('DB::Complain'));
	$c->log->debug("INSIDE ADMIN BASE");
}

sub list :Chained('base') :PathPart('list') {
	my ($self, $c) = @_; # see all calls (regardless open or closed)
	$c->stash(complains => [$c->stash->{resultset}->all]);
	$c->stash(template => 'list.tt2');
}

sub resolve :Chained('base') :PathPart('resolve') :Args(1) {
	my ($self, $c, $id) = @_;
	# my $id = $c->request->params->{trackID};
	$c->log->debug("admin/resolve: $id");
	$c->stash(complain => $c->stash->{resultset}->find($id),
		resolve => $c->model('DB::Resolve')->find($id), id => $id, 
		template => 'resolve.tt2');
}

sub assign :Chained('base') :PathPart('assign') :Args(1){
	my ($self, $c, $id) = @_;
	my $engineer = $c->request->params->{engineerAssigned};
	my $problem = $c->request->params->{problem};
	my $description = $c->request->params->{description};
	my $status = $c->request->params->{status};
	my $detail = $problem.": ".$description;
	$c->stash(resolve => $c->model('DB::Resolve'));
	if(!$c->stash->{resolve}->find($id)) {
		my $complain = $c->model('DB::Resolve')->create({
			id => $id,
			status => $status,
			assigned => $engineer,
			detail => $detail
		});
	} else {
		$c->stash->{resolve}->update({
			status => $status,
			detail => $detail,
			assigned => $engineer
		});
	}
	my $rs = $c->stash->{resultset}->find($id); # chained set :)
	if($rs) {
		$rs->update({status => $status});
	}
	$c->response->redirect($c->uri_for($self->action_for('index'),
		{status_msg => 'Record updated'}));
}

=head1 AUTHOR

Code Ninja,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
