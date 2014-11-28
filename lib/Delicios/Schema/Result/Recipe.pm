use utf8;
package Delicios::Schema::Result::Recipe;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Delicios::Schema::Result::Recipe

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

=head1 TABLE: C<recipes>

=cut

__PACKAGE__->table("recipes");

=head1 ACCESSORS

=head2 id_recipe

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'recipes_id_recipe_seq'

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 descr

  data_type: 'varchar'
  is_nullable: 1
  size: 150

=head2 id_categ

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 notes

  data_type: 'text'
  is_nullable: 1

=head2 ingred

  data_type: 'text'
  is_nullable: 1

=head2 prepar

  data_type: 'text'
  is_nullable: 1

=head2 noedit

  data_type: 'boolean'
  is_nullable: 1

=head2 tried

  data_type: 'boolean'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id_recipe",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "recipes_id_recipe_seq",
  },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "descr",
  { data_type => "varchar", is_nullable => 1, size => 150 },
  "id_categ",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "notes",
  { data_type => "text", is_nullable => 1 },
  "ingred",
  { data_type => "text", is_nullable => 1 },
  "prepar",
  { data_type => "text", is_nullable => 1 },
  "noedit",
  { data_type => "boolean", is_nullable => 1 },
  "tried",
  { data_type => "boolean", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_recipe>

=back

=cut

__PACKAGE__->set_primary_key("id_recipe");

=head1 RELATIONS

=head2 directions

Type: has_many

Related object: L<Delicios::Schema::Result::Direction>

=cut

__PACKAGE__->has_many(
  "directions",
  "Delicios::Schema::Result::Direction",
  { "foreign.id_recipe" => "self.id_recipe" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 id_categ

Type: belongs_to

Related object: L<Delicios::Schema::Result::Category>

=cut

__PACKAGE__->belongs_to(
  "id_categ",
  "Delicios::Schema::Result::Category",
  { id_categ => "id_categ" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 ingredients

Type: has_many

Related object: L<Delicios::Schema::Result::Ingredient>

=cut

__PACKAGE__->has_many(
  "ingredients",
  "Delicios::Schema::Result::Ingredient",
  { "foreign.id_recipe" => "self.id_recipe" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-28 18:50:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AYqZUpSUjZ7GOotJ4XafOg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
