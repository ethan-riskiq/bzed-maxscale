define maxscale::setup::yum (
    $package_name = $name
) {

    require ::maxscale::params

    if ($::architecture != 'amd64') {
        fail('Architectures != amd64 are not supported by the maxscale package repository!')
    }

    case $::lsbdistid {
        'Debian' : {
            if ($::lsbmajdistrelease !~ /^(6|7)$/) {
                fail ('This Debian release is not supported by the MariaDB MaxScale repository!')
            }
        }
        'Ubuntu' : {
            if ($::lsbdistrelease !~ /^(12\.04|14\.04|13\.10)$/) {
                fail ('This Ubuntu release is not supported by the MariaDB MaxScale repository!')
            }
        }
        default : {
            fail ('This Debian based distribution is not supported by the MariaDB MaxScale repository!')
        }
    }

    ::yum::key { 'mariadb-maxscale' :
        key         => $::maxscale::params::gpg_key_id,
        key_server  => 'keys.gnupg.net'
    }

    ::yum::source { 'mariadb-maxscale' :
        architecture    => 'x86_64',
        location        => "${::maxscale::params::repository_base_url}",
        include_src     => false,
        include_deb     => true,
        repos           => 'main',
        release         => $::lsbdistcodename,
        require         => ::yum::Key['mariadb-maxscale']
    }

    package { $package_name :
        ensure  => installed,
        require => ::yum::Source['mariadb-maxscale']
    }
    
}
