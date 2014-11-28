use utf8;
package Delicios::Schema::Result::Ingredient;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Delicios::Schema::Result::Ingredient

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

=head1 TABLE: C<ingredients>

=cut

__PACKAGE__->table("ingredients");

=head1 ACCESSORS

=head2 id_recipe

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 id_ing

  data_type: 'integer'
  is_nullable: 0

=head2 qty

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 unit

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 grup

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 item

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=cut

__PACKAGE__->add_columns(
  "id_recipe",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "id_ing",
  { data_type => "integer", is_nullable => 0 },
  "qty",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "unit",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "grup",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "item",
  { data_type => "varchar", is_nullable => 1, size => 100 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_recipe>

=item * L</id_ing>

=back

=cut

__PACKAGE__->set_primary_key("id_recipe", "id_ing");

=head1 RELATIONS

=head2 id_recipe

Type: belongs_to

Related object: L<Delicios::Schema::Result::Recipe>

=cut

__PACKAGE__->belongs_to(
  "id_recipe",
  "Delicios::Schema::Result::Recipe",
  { id_recipe => "id_recipe" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-28 18:50:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zYkHglzlCtfNfsTZVDW+pg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
