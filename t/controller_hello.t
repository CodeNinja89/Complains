use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Complain';
use Complain::Controller::hello;

ok( request('/hello')->is_success, 'Request should succeed' );
done_testing();
