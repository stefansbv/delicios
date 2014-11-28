use utf8;
package Delicios::Schema::Result::Direction;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Delicios::Schema::Result::Direction

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

=head1 TABLE: C<directions>

=cut

__PACKAGE__->table("directions");

=head1 ACCESSORS

=head2 id_recipe

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 id_step

  data_type: 'integer'
  is_nullable: 0

=head2 grup

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 step

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id_recipe",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "id_step",
  { data_type => "integer", is_nullable => 0 },
  "grup",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "step",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_recipe>

=item * L</id_step>

=back

=cut

__PACKAGE__->set_primary_key("id_recipe", "id_step");

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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DV3XGO9+ESbF12C+1zR+YA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
