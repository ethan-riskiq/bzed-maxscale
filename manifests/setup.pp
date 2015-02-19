define maxscale::setup (
    $setup_mariadb_repository,
    $package_name = $name
) {
    if $setup_mariadb_repository {
        case $::osfamily {
            'Debian' : {
                ::maxscale::apt { $package_name : }
            }
            'Redhat' : {
                fail('sorry, not implemented yet')
            }
            'Suse' : {
                fail('sorry, not implemented yet')
            }
            default : {
                fail('sorry, no packages for your linux distribution available.')
            }
        }
    } else {
        package { $package_name :
            ensure => installed,
        }
    }
}


