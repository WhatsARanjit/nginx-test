define nginx::virtual (
  $index_file,
  $doc_root = "/usr/share/nginx/html/$title",
  $virtual = '*',
  $servername = $title,
  $listening_port = 80,
) {
  include nginx
  File {
    ensure  => present,
    owner   => '0',
    group   => '0',
    mode    => '0644',
  }
  file { "/etc/nginx/conf.d/${servername}.conf":
    content => template("${module_name}/conf.d/virtual.conf"),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
  file { "$doc_root":
    ensure => directory,
  }
  file { "$doc_root/index.html":
    source => "puppet:///modules/${module_name}/${index_file}",
  }
}
File["$doc_root"] -> File["/etc/nginx/conf.d/${servername}.conf"] -> File["$doc_root/$index_file"]
