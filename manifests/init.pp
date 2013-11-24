class nginx (
  $repo_url       = $nginx::params::repo_url,
  $ensure         = $nginx::params::ensure,
  $running        = $nginx::params::running,
  $nginx_user     = $nginx::params::nginx_user,
  $nginx_group    = $nginx::params::nginx_group,
  $listening_port = $nginx::params::listening_port,
) inherits nginx::params {

  class { 'nginx::yum':
    repo_url => $repo_url,
  }
  
  class { 'nginx::install':
    ensure      => $ensure,
    nginx_user  => $nginx_user,
    nginx_group => $nginx_group,
  }
  
  class { 'nginx::service':
    ensure         => $ensure,
    running        => $running,
    nginx_user     => $nginx_user,
    listening_port => $listening_port,
  }
  Class['nginx::yum'] -> Class['nginx::install'] -> Class['nginx::service']
}
