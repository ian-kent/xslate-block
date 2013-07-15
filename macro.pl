package test;

sub new {
    my ($package, %args) = @_;
    return bless {
        %args
    }, 'test';
}

sub render {
    return shift->{block}->();
}

package main;

#!/usr/bin/env perl

use Data::Dumper;
use Text::Xslate;

my $count = 0;
my $xslate = Text::Xslate->new(
    function => {
        foo => sub {
            my $block = pop;
            return test->new(block => $block);
        },
        count => sub {
            ++$count;
        }
    }
);

my $content = <<EOF
: foo(-> {
Rendering <: count() :>
: }).render
EOF
;

print $xslate->render_string($content);
print $xslate->render_string($content);

print $xslate->render('test2.tx');
print $xslate->render('test2.tx');
