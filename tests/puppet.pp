nginx::virtual { 'puppetexercise.local':
  index_file     => 'puppet.html',
  listening_port => 8080,
}
