use utf8;
package Delicios::Schema::Result::VRecipe;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Delicios::Schema::Result::VRecipe

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

=head1 TABLE: C<v_recipes>

=cut

__PACKAGE__->table("v_recipes");

=head1 ACCESSORS

=head2 id_recipe

  data_type: 'integer'
  is_nullable: 1

=head2 title

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 descr

  data_type: 'varchar'
  is_nullable: 1
  size: 150

=head2 id_categ

  data_type: 'integer'
  is_nullable: 1

=head2 categ

  data_type: 'varchar'
  is_nullable: 1
  size: 150

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

  data_type: 'integer'
  is_nullable: 1

=head2 tried

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id_recipe",
  { data_type => "integer", is_nullable => 1 },
  "title",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "descr",
  { data_type => "varchar", is_nullable => 1, size => 150 },
  "id_categ",
  { data_type => "integer", is_nullable => 1 },
  "categ",
  { data_type => "varchar", is_nullable => 1, size => 150 },
  "notes",
  { data_type => "text", is_nullable => 1 },
  "ingred",
  { data_type => "text", is_nullable => 1 },
  "prepar",
  { data_type => "text", is_nullable => 1 },
  "noedit",
  { data_type => "integer", is_nullable => 1 },
  "tried",
  { data_type => "integer", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-28 18:50:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tG5JDs1ERA9FRJeG09mfjQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
