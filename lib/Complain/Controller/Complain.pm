package Complain::Controller::Complain;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Complain::Controller::Complain - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
	$c->stash(template => 'index.tt2');
}

sub lodge :Chained('/') :PathPart('complain/lodge') :Args(0) {
	my ($self, $c) = @_;
	$c->stash(template => 'lodge.tt2');
}

sub lodgeComplain :Chained('/') :PathPart('complain/lodgeComplain') :Args(0) {
	my ($self, $c) = @_;
	my $name = $c->request->params->{name};
	my $address = $c->request->params->{address};
	my $contact = $c->request->params->{contact};
	my $serial = $c->request->params->{serial};
	my $productType = $c->request->params->{productType};
	my $productMake = $c->request->params->{productMake};
	my $problem = $c->request->params->{problem};
	my $complain = $c->request->params->{complain};
	$complain = $problem." - ".$complain;
	my $entry = $c->model('DB::Complain')->create({
		complainid => srand() % 1123581321,
		username => $name,
		useraddress => $address,
		usercontact => $contact,
		productserial => $serial,
		producttype => $productType,
		productmake => $productMake,
		complain => $complain,
		status => 0 # new complain... status == open
	});
	$c->stash(complain => $entry,
		template => 'done.tt2'
	);
}

sub track :Chained('/') :PathPart('complain/track') :Args(0) {
	my ($self, $c) = @_;
	$c->stash(template=> 'track.tt2');
}

sub search :Chained('/') :PathPart('complain/search') :Args(0) {
	my ($self, $c) = @_;
	my $id = $c->request->params->{trackID};
	$c->stash(complain => $c->model('DB::Complain')->find($id));
	$c->stash(template => 'search.tt2');
}


sub done :Chained('/') :PathPart('complain/done') :Args(0) {
	my ($self, $c) = @_;
	$c->response->redirect($c->uri_for($self->action_for('index')));
}

=head1 AUTHOR

Code Ninja,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
