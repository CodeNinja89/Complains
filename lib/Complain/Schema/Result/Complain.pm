use utf8;
package Complain::Schema::Result::Complain;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Complain::Schema::Result::Complain

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::EncodedColumn>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn");

=head1 TABLE: C<complain>

=cut

__PACKAGE__->table("complain");

=head1 ACCESSORS

=head2 complainid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'text'
  is_nullable: 1

=head2 useraddress

  data_type: 'text'
  is_nullable: 1

=head2 usercontact

  data_type: 'text'
  is_nullable: 1

=head2 productserial

  data_type: 'integer'
  is_nullable: 1

=head2 producttype

  data_type: 'integer'
  is_nullable: 1

=head2 productmake

  data_type: 'text'
  is_nullable: 1

=head2 complain

  data_type: 'text'
  is_nullable: 1

=head2 status

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "complainid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "username",
  { data_type => "text", is_nullable => 1 },
  "useraddress",
  { data_type => "text", is_nullable => 1 },
  "usercontact",
  { data_type => "text", is_nullable => 1 },
  "productserial",
  { data_type => "integer", is_nullable => 1 },
  "producttype",
  { data_type => "integer", is_nullable => 1 },
  "productmake",
  { data_type => "text", is_nullable => 1 },
  "complain",
  { data_type => "text", is_nullable => 1 },
  "status",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</complainid>

=back

=cut

__PACKAGE__->set_primary_key("complainid");


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2014-05-29 10:44:03
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Z8JFJNjXjyUHLtxKmgY0dg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
 #__PACKAGE__->add_columns(
  #      "created", { data_type => 'datetime', set_on_create => 1 },
#);
__PACKAGE__->meta->make_immutable;
1;
