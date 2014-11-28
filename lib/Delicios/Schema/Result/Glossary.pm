use utf8;
package Delicios::Schema::Result::Glossary;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Delicios::Schema::Result::Glossary

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

=head1 TABLE: C<glossary>

=cut

__PACKAGE__->table("glossary");

=head1 ACCESSORS

=head2 id_def

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'glossary_id_def_seq'

=head2 term

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 definition

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id_def",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "glossary_id_def_seq",
  },
  "term",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "definition",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_def>

=back

=cut

__PACKAGE__->set_primary_key("id_def");


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-28 18:50:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8TNEYodUa1LNT2AVJP/otA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
