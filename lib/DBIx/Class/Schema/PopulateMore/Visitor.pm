package DBIx::Class::Schema::PopulateMore::Visitor;

use Moo;
extends 'Data::Visitor';
use Type::Library -base;
use Types::Standard -types;
use namespace::clean;

=head1 NAME

DBIx::Class::Schema::PopulateMore::Visitor  - Visitor for the Populate Data

=head1 SYNOPSIS

    ##Example Usage

See Tests for more example usage.

=head1 DESCRIPTION

When populating a table, sometimes we need to inflate values that we won't 
know of in advance.  For example we might have a column that is FK to another
column in another table.  We want to make it easy to 'tag' a value as something
other than a real value to be inserted into the table.

Right now we only have one substitution to do, which is the FK one mentioned 
above, but we might eventually create other substitution types so we've broken
this out to make it neat and easy to do so.

=head1 ATTRIBUTES

This class defines the following attributes.

=head2 update_callback

The coderef to be execute should the match condition succeed

=cut

has 'update_callback' => (
    is=>'rw',
    required=>1,
    lazy=>1,
    isa=>CodeRef,
    default=> sub {
        return sub {
            return shift;
        };
    },
);

=head2 match_condition

How we know the value is really something to inflate or perform a substitution
on.  This get's the namespace of the substitution plugin and it's other data.

The default behavior (where there is no substitution namespace, is to do the
inflate to resultset.  This is the most common usecase.

=cut

has 'match_condition' => (
    is=>'ro',
    required=>1,
    isa=>RegexpRef,
);


=head1 METHODS

This module defines the following methods.

=head2 callback

Given a coderef, sets the current callback and returns self so that we can chain

=cut

sub callback
{
    my $self = shift @_;
    $self->update_callback(shift @_);
    return $self;
}


=head2 visit_value

Overload from the base case L<Data::Visitor>  Here is where we make the choice
as to if this value needs to be inflated via a plugin

=cut

sub visit_value
{
    my ($self, $data) = @_;
    
    if(my $item = $self->match_or_not($data))
    {    
        return $self->update_callback->($item);
    }

    return $data;
}


=head2 match_or_not

We break this out to handle the ugliness surrounding dealing with undef values
and also to make it easier on subclassers.

=cut
    
sub match_or_not
{
    my ($self, $data) = @_;
    my $match_condition = $self->match_condition;
    
    if( !defined $data )
    {
        return;
    }
    elsif(my ($item) = ($data=~m/$match_condition/))
    {    
        return $item;
    }
    
    return;        
}


=head1 AUTHOR

Please see L<DBIx::Class::Schema::PopulateMore> For authorship information

=head1 LICENSE

Please see L<DBIx::Class::Schema::PopulateMore> For licensing terms.

=cut


1;
