use utf8;
package Delicios::Schema::Result::Retete;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Delicios::Schema::Result::Retete

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 TABLE: C<retete>

=cut

__PACKAGE__->table("retete");

=head1 ACCESSORS

=head2 id_ret

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'retete_id_ret_seq'

=head2 titlu

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 descr

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 ingred

  data_type: 'text'
  is_nullable: 1

=head2 prepar

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id_ret",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "retete_id_ret_seq",
  },
  "titlu",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "descr",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "ingred",
  { data_type => "text", is_nullable => 1 },
  "prepar",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_ret>

=back

=cut

__PACKAGE__->set_primary_key("id_ret");


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-28 18:50:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kw+EGaiPF8GRn1EOHspMjQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
