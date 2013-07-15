#!/usr/bin/env perl

use Data::Dumper;
use Text::Xslate;
use Controller;

my $count = 0;

# Instantiate xslate with a function
my $xslate = Text::Xslate->new(
    function => {
        count => sub {
            ++$count;
        }
    }
);

# Render a template - this one always works
print $xslate->render('test.tx', {
    c => Controller->new
});

# Uncomment this bit and the render call below works again
#my $xslate = Text::Xslate->new(
#    function => {
#        count => sub {
#            ++$count;
#        }
#    }
#);

# Uncomment this bit to get even more weirdness
# Causes error: Text::Xslate: Functions must be a CODE reference, not '****'
#$xslate->{function}->{count} = sub { ++$count; };

# Render the template again - it always fails if we reuse the original xslate object
print $xslate->render('test.tx', {
    c => Controller->new
});
