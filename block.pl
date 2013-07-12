#!/usr/bin/env perl

use Data::Dumper;
use Modern::Perl;
use Text::Xslate;
use Controller;

my $count = 0;

my $xslate = Text::Xslate->new(
    function => {
        count => sub {
            ++$count;
        }
    }
);

print $xslate->render('test.tx', {
    c => Controller->new
});
