class { 'nginx::yum':
  repo_url => 'http://nginx.org/packages/centos/$releasever/$basearch/',
}
class { 'nginx::install': }
Class['nginx::yum'] -> Class['nginx::install']
