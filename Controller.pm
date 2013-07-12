package Controller;

use Modern::Perl;
use Moose;

use Block;

sub block {
    my ($self, $args, $block) = @_;
    $block = $args and $args = undef if !$block;
    Block->new(block => $block, args => $args // {});
}

__PACKAGE__->meta->make_immutable;
