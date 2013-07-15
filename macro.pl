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

package helper;

sub new {
    my ($package, %args) = @_;
    return bless {
        %args
    }, 'helper';
}

sub test {
    my ($self) = @_;
    my $block = pop @_;
    return test->new(block => $block);
}

package main;

#!/usr/bin/env perl

use Data::Dumper;
use Text::Xslate;

my $count = 0;
my $xslate = Text::Xslate->new(
    function => {
        count => sub {
            ++$count;
        }
    }
);

my $content = <<EOF
: \$c.test(-> {
Rendering <: count() :>
: }).render
EOF
;

my $params = {
    c => helper->new
};

print $xslate->render_string($content, $params);
print $xslate->render_string($content, $params);

print $xslate->render('test2.tx', $params);
print $xslate->render('test2.tx', $params);
