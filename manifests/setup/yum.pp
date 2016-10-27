define maxscale::setup::yum (
    $package_name = $name
) {

    require ::maxscale::params

    yumrepo { 'mariadb-maxscale':
      baseurl        => 'http://yum.mariadb.org/10.1/centos7-amd64',
      enabled  => '1',
      gpgcheck => '0',
      priority => '1',
      descr          => "MariaDB repo",
}
    package { $package_name :
        ensure  => installed,
        #require => ::yumrepo['mariadb-maxscale']
    }

}
