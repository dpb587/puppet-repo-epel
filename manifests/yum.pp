class repo-epel::yum {
    file {
        '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6' :
            content => '-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.5 (GNU/Linux)

mQINBEvSKUIBEADLGnUj24ZVKW7liFN/JA5CgtzlNnKs7sBg7fVbNWryiE3URbn1
JXvrdwHtkKyY96/ifZ1Ld3lE2gOF61bGZ2CWwJNee76Sp9Z+isP8RQXbG5jwj/4B
M9HK7phktqFVJ8VbY2jfTjcfxRvGM8YBwXF8hx0CDZURAjvf1xRSQJ7iAo58qcHn
XtxOAvQmAbR9z6Q/h/D+Y/PhoIJp1OV4VNHCbCs9M7HUVBpgC53PDcTUQuwcgeY6
pQgo9eT1eLNSZVrJ5Bctivl1UcD6P6CIGkkeT2gNhqindRPngUXGXW7Qzoefe+fV
QqJSm7Tq2q9oqVZ46J964waCRItRySpuW5dxZO34WM6wsw2BP2MlACbH4l3luqtp
Xo3Bvfnk+HAFH3HcMuwdaulxv7zYKXCfNoSfgrpEfo2Ex4Im/I3WdtwME/Gbnwdq
3VJzgAxLVFhczDHwNkjmIdPAlNJ9/ixRjip4dgZtW8VcBCrNoL+LhDrIfjvnLdRu
vBHy9P3sCF7FZycaHlMWP6RiLtHnEMGcbZ8QpQHi2dReU1wyr9QgguGU+jqSXYar
1yEcsdRGasppNIZ8+Qawbm/a4doT10TEtPArhSoHlwbvqTDYjtfV92lC/2iwgO6g
YgG9XrO4V8dV39Ffm7oLFfvTbg5mv4Q/E6AWo/gkjmtxkculbyAvjFtYAQARAQAB
tCFFUEVMICg2KSA8ZXBlbEBmZWRvcmFwcm9qZWN0Lm9yZz6JAjYEEwECACAFAkvS
KUICGw8GCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRA7Sd8qBgi4lR/GD/wLGPv9
qO39eyb9NlrwfKdUEo1tHxKdrhNz+XYrO4yVDTBZRPSuvL2yaoeSIhQOKhNPfEgT
9mdsbsgcfmoHxmGVcn+lbheWsSvcgrXuz0gLt8TGGKGGROAoLXpuUsb1HNtKEOwP
Q4z1uQ2nOz5hLRyDOV0I2LwYV8BjGIjBKUMFEUxFTsL7XOZkrAg/WbTH2PW3hrfS
WtcRA7EYonI3B80d39ffws7SmyKbS5PmZjqOPuTvV2F0tMhKIhncBwoojWZPExft
HpKhzKVh8fdDO/3P1y1Fk3Cin8UbCO9MWMFNR27fVzCANlEPljsHA+3Ez4F7uboF
p0OOEov4Yyi4BEbgqZnthTG4ub9nyiupIZ3ckPHr3nVcDUGcL6lQD/nkmNVIeLYP
x1uHPOSlWfuojAYgzRH6LL7Idg4FHHBA0to7FW8dQXFIOyNiJFAOT2j8P5+tVdq8
wB0PDSH8yRpn4HdJ9RYquau4OkjluxOWf0uRaS//SUcCZh+1/KBEOmcvBHYRZA5J
l/nakCgxGb2paQOzqqpOcHKvlyLuzO5uybMXaipLExTGJXBlXrbbASfXa/yGYSAG
iVrGz9CE6676dMlm8F+s3XXE13QZrXmjloc6jwOljnfAkjTGXjiB7OULESed96MR
XtfLk0W5Ab9pd7tKDR6QHI7rgHXfCopRnZ2VVQ==
=V/6I
-----END PGP PUBLIC KEY BLOCK-----',
            group => 'root',
            mode => 0644,
            owner => 'root',
            ;
    }

    yumrepo {
        'epel' :
            descr => 'Extra Packages for Enterprise Linux 6 - $basearch',
            baseurl => 'http://download.fedoraproject.org/pub/epel/6/$basearch',
            mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
            failovermethod => 'priority',
            enabled => '1',
            gpgcheck => '1',
            gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
            ;
        'epel-debuginfo' :
            descr => 'Extra Packages for Enterprise Linux 6 - $basearch - Debug',
            #baseurl => 'http://download.fedoraproject.org/pub/epel/6/$basearch/debug',
            mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=epel-debug-6&arch=$basearch',
            failovermethod => 'priority',
            enabled => '0',
            gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
            gpgcheck => '1',
            ;
        'epel-source' :
            descr => 'Extra Packages for Enterprise Linux 6 - $basearch - Source',
            #baseurl => 'http://download.fedoraproject.org/pub/epel/6/SRPMS',
            mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=epel-source-6&arch=$basearch',
            failovermethod => 'priority',
            enabled => '0',
            gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
            gpgcheck => '1',
            ;
    }
}

class {
    'repo-epel::yum':
        stage => 'pre-main',
        ;
}
