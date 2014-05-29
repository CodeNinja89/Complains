use strict;
use warnings;

use Complain;

my $app = Complain->apply_default_middlewares(Complain->psgi_app);
$app;

