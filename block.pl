#!/usr/bin/env perl

use Data::Dumper;
#use Modern::Perl;
use Text::Xslate;
use Controller;

my $count = 0;

# This one always works
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

# Uncomment this bit and it works again
#my $xslate = Text::Xslate->new(
#    function => {
#        count => sub {
#            ++$count;
#        }
#    }
#);

# This bit always fails
print $xslate->render('test.tx', {
    c => Controller->new
});
