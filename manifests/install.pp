class nginx::install (
  $ensure       = 'present',
  $nginx_user   = 'nginx',
  $nginx_group  = 'nginx',
) {
  package { 'nginx':
    ensure => $ensure,
  }
  user { "$nginx_user":
    ensure           => present,
    comment          => 'Nginx web server',
    gid              => '490',
    home             => '/var/lib/nginx',
    shell            => '/sbin/nologin',
  }
  group { "$nginx_group":
    ensure => present,
  }
  file { '/usr/share/nginx/html/':
    ensure => present,
    owner  => '0',
    group  => '0',
    mode   => '0755',
  }
}
