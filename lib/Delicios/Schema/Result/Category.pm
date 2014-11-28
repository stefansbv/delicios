use utf8;
package Delicios::Schema::Result::Category;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Delicios::Schema::Result::Category

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

=head1 TABLE: C<categories>

=cut

__PACKAGE__->table("categories");

=head1 ACCESSORS

=head2 id_categ

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'categories_id_categ_seq'

=head2 categ

  data_type: 'varchar'
  is_nullable: 0
  size: 150

=cut

__PACKAGE__->add_columns(
  "id_categ",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "categories_id_categ_seq",
  },
  "categ",
  { data_type => "varchar", is_nullable => 0, size => 150 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_categ>

=back

=cut

__PACKAGE__->set_primary_key("id_categ");

=head1 RELATIONS

=head2 recipes

Type: has_many

Related object: L<Delicios::Schema::Result::Recipe>

=cut

__PACKAGE__->has_many(
  "recipes",
  "Delicios::Schema::Result::Recipe",
  { "foreign.id_categ" => "self.id_categ" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-28 18:50:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CTLnqoIi+DjXl0QcktrHkA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
