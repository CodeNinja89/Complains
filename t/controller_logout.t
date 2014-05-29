use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Complain';
use Complain::Controller::logout;

ok( request('/logout')->is_success, 'Request should succeed' );
done_testing();
