class { 'nginx::yum':
  repo_url => 'http://nginx.org/packages/centos/$releasever/$basearch/',
}
