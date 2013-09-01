package Test::More::Unlike;
use strict;
use warnings;

our $VERSION = '0.01';

package # hide from PAUSE
    Test::More;
use strict;
use Text::MatchedPosition;
no warnings 'redefine';

sub unlike ($$;$) { ## no critic (Subroutines::ProhibitSubroutinePrototypes)
    my $tb = Test::More->builder;
    my $ret = $tb->unlike(@_);
    return $ret if $ret eq '1';

    my $pos = Text::MatchedPosition->new(@_);
    return diag( sprintf <<'DIAGNOSTIC', $pos->line, $pos->offset );
          matched at line: %d, offset: %d
DIAGNOSTIC
}

1;

__END__

=head1 NAME

Test::More::Unlike - show the matched position


=head1 SYNOPSIS

    use Test::More tests => 1;
    use Test::More::Unlike;
    
    unlike 'abcdef', qr/cd/;
    
    #    not ok 1
    #    #   Failed test at t/01_basic.t line 6.
    #    #                   'abcdef'
    #    #           matches '(?-xism:cd)'
    #    #           matched at line: 1, offset: 3
    #    # Looks like you failed 1 test of 1.


=head1 DESCRIPTION

When C<unlike> test fails, if you have used Test::More::Unlike, then the error diag shows additionally the matched position like below.

    #           matched at line: 1, offset: 3

NOTE that it is only first matched position. And offset count is calculated as octet.


=head1 REPOSITORY

Test::More::Unlike is hosted on github
<http://github.com/bayashi/Test-More-Unlike>

Welcome your patches and issues :D


=head1 AUTHOR

Dai Okabayashi E<lt>bayashi@cpan.orgE<gt>


=head1 SEE ALSO

L<Test::More>


=head1 LICENSE

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=cut
