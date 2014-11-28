use strict;
use warnings;

use Delicios;
use Test::More tests => 5;
use Plack::Test;
use HTTP::Request::Common;

my $app = Dancer2->psgi_app;
is( ref $app, 'CODE', 'Got app' );

test_psgi $app, sub {
    my $cb  = shift;

    my $res = $cb->( GET '/' );

    ok $res->is_success;

    is $res->code => 200, 'response status is 200 for /';

    like $res->content => qr#<title>Delicios</title>#, 'title is okay';

    my $res2 = $cb->( GET '/glossary/1' );

    ok $res2->is_success;

    diag $res2->content;
};
