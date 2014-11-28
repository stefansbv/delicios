use utf8;
package Delicios::Schema::Result::VIngredient;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Delicios::Schema::Result::VIngredient

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
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<v_ingredients>

=cut

__PACKAGE__->table("v_ingredients");

=head1 ACCESSORS

=head2 id_recipe

  data_type: 'integer'
  is_nullable: 1

=head2 id_ing

  data_type: 'integer'
  is_nullable: 1

=head2 qty

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 unit

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 item

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=cut

__PACKAGE__->add_columns(
  "id_recipe",
  { data_type => "integer", is_nullable => 1 },
  "id_ing",
  { data_type => "integer", is_nullable => 1 },
  "qty",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "unit",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "item",
  { data_type => "varchar", is_nullable => 1, size => 100 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-28 18:50:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ug2xqTvvYP/0aWoOZdroLw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
