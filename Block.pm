package Block;

use Moose;

has 'args'  => ( is => 'rw', isa => 'HashRef', required => 1 );
has 'block' => ( is => 'rw', required => 1 );

sub render {
    my ($self) = @_;
    "**" . $self->block->() . ( $self->args->{foo} ? '[' . $self->args->{foo} . ']' : '') . "**";
}

__PACKAGE__->meta->make_immutable;
