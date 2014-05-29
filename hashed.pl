#!/usr/bin/perl
use strict;
use warnings;

use Complain::Schema;
my $schema = Complain::Schema->connect('dbi:SQLite:complain.db');

my @users = $schema->resultset('User')->all;
foreach my $user (@users) {
	$user->password('ninja');
    $user->update;
}
