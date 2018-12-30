package Delicios;

use Dancer2;
use Dancer2::Plugin::DBIC; # qw(schema resultset rset);
use Dancer2::Plugin::Ajax;

our $VERSION = '0.001';

get '/' => sub {
    template 'index';
};

get '/about' => sub {
    template 'about' => {
        active_nav => 'about',
    };
};

#-- Recipe

get '/query' => sub {
    my $titles = _get_recipe_titles();
    template 'query' => {
        active_nav => 'query',
        titles     => $titles,
    };
};

#-- Glossary

get '/glossary' => sub {
    my $terms = _get_glossary_terms();
    template 'glossary' => {
        active_nav => 'glossary',
        terms      => $terms,
    };
};

ajax '/glossary/:id' => sub {
    my $id_def = param 'id';
    my $record = schema->resultset('Glossary')->find( { id_def => $id_def } );
    to_json({
        id   => $record->id_def,
        term => $record->term,
        def  => $record->definition,
    }, { utf8 => 1 });
};

#-- Helper methods

sub _get_glossary_terms {
    my @terms = schema->resultset('Glossary')->search(
        undef,
        {   order_by => 'term',
            columns  => [qw/id_def term/],
        },
    );
    return \@terms;
}

sub _get_recipe_titles {
    my $title  = param 'title';
    my @titles = schema->resultset('Recipe')->search(
        { noedit => 'f', title    => { ilike => "%$title%" }, },
        { rows     => 20, order_by => 'title' }
    );
    return \@titles;
}

true;
