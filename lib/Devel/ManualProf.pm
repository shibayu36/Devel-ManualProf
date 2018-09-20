package Devel::ManualProf;
use strict;
use warnings;
use utf8;

our $VERSION = "0.01";

use feature qw(say);

use Time::Moment;

sub new {
    my ($class, $log_filename) = @_;
    open(my $log_fh, ">>", $log_filename) or die "Can't open > $log_filename: $!";
    bless {
        log_fh => $log_fh,
        timers => {},
    }, $class;
}

sub begin {
    my ($self, $profile_name) = @_;
    $self->{timers}->{$profile_name} = Time::Moment->now;
}

sub end {
    my ($self, $profile_name) = @_;
    my $before = $self->{timers}->{$profile_name} or die "profile $profile_name is not begun";
    my $now = Time::Moment->now;
    my $duration = $before->delta_milliseconds($now);
    say { $self->{log_fh} } "name:$profile_name\ttime:$duration";
    $self->{timers}->{$profile_name} = undef;
}

sub DESTROY {
    my ($self) = @_;
    close $self->{log_fh};
}

1;
__END__

=encoding utf-8

=head1 NAME

Devel::ManualProf - It's new $module

=head1 SYNOPSIS

    use Devel::ManualProf;

=head1 DESCRIPTION

Devel::ManualProf is ...

=head1 LICENSE

Copyright (C) shibayu36.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

shibayu36 E<lt>shibayu36@gmail.comE<gt>

=cut

