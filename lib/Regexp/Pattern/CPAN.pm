package Regexp::Pattern::CPAN;

# DATE
# VERSION

our %RE = (
    pause_id => {
        summary => 'PAUSE author ID, or PAUSE ID for short',
        pat => qr/[a-z][a-z0-9]{1,8}/,
        description => <<'_',

I'm not sure whether PAUSE allows digit for the first letter. For safety I'm
assuming no.

_
    },
);

1;
# ABSTRACT: Regexp patterns related to CPAN

=head1 SEE ALSO

L<Regexp::Pattern::Perl>
