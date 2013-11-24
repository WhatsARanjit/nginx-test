class { 'nginx::yum':
  repo_url => 'http://nginx.org/packages/centos/$releasever/$basearch/',
}
class { 'nginx::install': }
class { 'nginx::service':
  listening_port => 80,
}
Class['nginx::yum'] -> Class['nginx::install'] -> Class['nginx::service']
