class nginx::params {
  $ensure       = 'present'
  $running      = 'running'
  $nginx_user   = 'nginx'
  $nginx_group  = 'nginx'
  $listen_port  = 80
  case $::operatingsystem {
    centos  : { $repo_url = 'http://nginx.org/packages/centos/$releasever/$basearch/' }
    default : { $repo_url = 'http://nginx.org/packages/rhel/$releasever/$basearch/' }
  }
}
