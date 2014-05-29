use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Complain';
use Complain::Controller::Complain;

ok( request('/complain')->is_success, 'Request should succeed' );
done_testing();
