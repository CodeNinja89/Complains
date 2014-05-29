use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Complain';
use Complain::Controller::login;

ok( request('/login')->is_success, 'Request should succeed' );
done_testing();
