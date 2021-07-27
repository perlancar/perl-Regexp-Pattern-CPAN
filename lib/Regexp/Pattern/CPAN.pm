package Regexp::Pattern::CPAN;

# AUTHORITY
# DATE
# DIST
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

    release_tarball_filename => {
        summary => 'Proper filename of a typical distribution release tarball',
        pat => qr/([A-Za-z_][A-Za-z0-9_]*(?:-[A-Za-z0-9_][A-Za-z0-9_]*)*)-
                  v?([0-9]+(?:\.[0-9]+){0,4}(?:_[0-9]+|-TRIAL)?)
                  \.(tar|tar\.(?:Z|gz|bz2|xz)|zip|rar)/x,
        tags => ['capturing'],
        examples => [
            {str=>'Acme-CPANModulesBundle-Import-PerlAdvent-2000-0.001.tar.gz', gen_args=>{-anchor=>1}, matches=>1},
            {str=>'Acme-CPANModulesBundle-Import-PerlAdvent-2000-v0.001.tar.gz', gen_args=>{-anchor=>1}, matches=>1, summary=>'v prefix before version number allowed'},
            {str=>'0.001.tar.gz', gen_args=>{-anchor=>1}, matches=>0, summary=>'No distribution name'},
            {str=>'Acme-CPANModulesBundle-Import-PerlAdvent-2000.tar.gz', gen_args=>{-anchor=>1}, matches=>1, summary=>'Unfortunately, numeric namespace name gets mistaken as version number'},
            {str=>'Acme-CPANModulesBundle-Import-PerlAdvent.tar.gz', gen_args=>{-anchor=>1}, matches=>0, summary=>'No version number'},
        ],
    },
);

1;
# ABSTRACT: Regexp patterns related to CPAN

=head1 prepend:SEE ALSO

L<Regexp::Pattern::Perl>
