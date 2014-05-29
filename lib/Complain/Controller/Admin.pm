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

sub resolve :Chained('base') :PathPart('resolve') {
	my ($self, $c) = @_;
	my $id = $c->request->params->{trackID};
	if($id) {
		$c->log->debug("admin/resolve: $id");
		$c->stash(complain => $c->stash->{resultset}->find($id),
			id => $id, template => 'resolve.tt2');
	} else {
		$c->log->debug("admin/resolve: no track id");
		$c->stash(template => 'find.tt2');
	}
}

sub assign :Chained('base') :PathPart('assign') {
	my ($self, $c) = @_;
	my $engineer = $c->request->params->{engineerAssigned};
	my $problem = $c->request->params->{problem};
	my $description = $c->request->params->{description};
	my $status = $c->request->params->{status};
	my $detail = $problem.": ".$description;
	my $complain = $c->model('DB::Resolve')->create({
		id => $c->stash->{id},
		status => $status,
		assigned => $engineer,
		detail => $detail
	});
	my $user = $c->stash->{resultset}->find($c->stash->{id});
	$user->status($status);
	$user->update();
	$c->log->debug("admin/assign: Updated record!");
	$c->stash(template => 'adminIndex.tt2');
}

=head1 AUTHOR

Code Ninja,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
