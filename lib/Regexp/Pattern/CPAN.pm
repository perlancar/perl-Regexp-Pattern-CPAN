package Regexp::Pattern::CPAN;

# DATE
# VERSION

our %RE = (
    pause_id => {
        summary => 'PAUSE author ID, or PAUSE ID for short',
        pat => qr/[A-Z][A-Z0-9]{1,8}/,
        description => <<'_',

I'm not sure whether PAUSE allows digit for the first letter. For safety I'm
assuming no.

_
        examples => [
            {str=>'PERLANCAR', matches=>1},
            {str=>'perlancar', summary=>'Only allows uppercase', matches=>0},
            {str=>'A', summary=>'too short', matches=>0},
            {str=>'PERL ANCAR', gen_args=>{-anchor=>1}, summary=>'contains whitespace', matches=>0},
            {str=>'RANDALSCHWARTZ', gen_args=>{-anchor=>1}, summary=>'too long', matches=>0},
        ],
    },
);

1;
# ABSTRACT: Regexp patterns related to CPAN

=head1 SEE ALSO

L<Regexp::Pattern::Perl>
