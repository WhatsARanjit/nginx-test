class nginx::service (
  $ensure         = 'present',
  $running        = 'running',
  $nginx_user     = 'nginx',
  $listening_port = 80,
) {
  service { 'nginx':
    ensure => $running,
  }
  File {
    owner   => '0',
    group   => '0',
    mode    => '0644',
    notify  => Service['nginx'],
  }
  file { '/etc/nginx/nginx.conf':
    ensure  => $ensure,
    content => template("${module_name}/nginx.conf.erb"),
  }
  file { '/etc/nginx/conf.d/default.conf':
    ensure  => $ensure,
    content => template("${module_name}/conf.d/default.conf.erb"),
  }
}
