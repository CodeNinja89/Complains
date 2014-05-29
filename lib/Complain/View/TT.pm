package Complain::View::TT;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt2',
    render_die => 1,
    INCLUDE_PATH => [
		Complain->path_to( 'root', 'src' ),
    ],
);

=head1 NAME

Complain::View::TT - TT View for Complain

=head1 DESCRIPTION

TT View for Complain.

=head1 SEE ALSO

L<Complain>

=head1 AUTHOR

Code Ninja,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
