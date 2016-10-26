define maxscale::setup::yum (
    $package_name = $name
) {

    require ::maxscale::params

    yumrepo { 'mariadb-maxscale':
      baseurl        => 'http://yum.mariadb.org/10.1/centos7-amd64',
      gpgkey         => 'https://yum.mariadb.org/RPM-GPG-KEY-MariaDB',
      enabled  => '1',
      gpgcheck => '1',
      priority => '1',
      descr          => "MariaDB repo",
}
    package { $package_name :
        ensure  => installed,
        #require => ::yumrepo['mariadb-maxscale']
    }

}
