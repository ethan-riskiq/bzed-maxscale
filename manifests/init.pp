# == Class: maxscale
#
# Install MariaDB MaxScale.
# TODO: configure it!
#
# === Parameters
#
# [*maxscale_package_name*]
# Override the name of the maxscale package your system's package manager
# will install.
#
# [*setup_mariadb_repository*]
# Setup the apt/yum repositories from MariaDB for MaxScale.
#
# === Variables
#
# === Examples
#
#  class { 'maxscale':
#    maxscale_package_name => 'maxscale-mycompany-foo',
#    setup_mariadb_repository => false
#  }
#
# === Authors
#
# Bernd Zeimetz <bernd@bzed.de>
#
# === Copyright
#
# Copyright 2015 Bernd Zeimetz
#
class maxscale (
    $maxscale_package_name = undef,
    $setup_mariadb_repository = true,
) {

    define setup_maxscale (
        $package_name = $name,
        $setup_mariadb_repository
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
            package { $maxscale_package :
                ensure => installed,
            }
        }
    }

    require ::maxscale::params

    $maxscale_package = pick_default($maxscale_package_name, $::maxscale::params::package_name)
    
    setup_maxscale { $maxscale_package :
        setup_mariadb_repository => $setup_mariadb_repository
    }
}
