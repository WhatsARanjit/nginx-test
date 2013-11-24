class nginx::yum (
  $repo_url,
) {
  yumrepo { 'nginx':
    name     => 'nginx repo',
    baseurl  => $repo_url,
    gpgcheck => 0,
    enabled  => 1,
  }
}
