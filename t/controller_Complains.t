use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Complain';
use Complain::Controller::Complains;

ok( request('/complains')->is_success, 'Request should succeed' );
done_testing();
