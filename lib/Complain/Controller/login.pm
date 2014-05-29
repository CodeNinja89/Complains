package Complain::Controller::login;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Complain::Controller::login - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    
    my $username = $c->request->params->{username};
    my $password = $c->request->params->{password};
    
    if($username && $password) {
		#authenticate the user and login
		if($c->authenticate({username => $username, 
								password => $password })) {
			$c->response->redirect($c->uri_for($c->controller('Admin')->action_for('index')));
			return;
		} else {
			$c->log->debug("incorrect username or password!");
			$c->stash(err_mesg => "Username or password incorrect");
		}
	}
	
	$c->stash(template => 'login.tt2');
}


=head1 AUTHOR

Code Ninja,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
