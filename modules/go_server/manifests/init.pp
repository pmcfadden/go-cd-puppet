class go_server {
  yumrepo { 'ThoughtWorksGo':
    baseurl  => 'http://download01.thoughtworks.com/go/yum/no-arch',
    descr    => 'ThoughtWorks Go Repo',
    enabled  => 1,
    gpgcheck => 0
  }

  package { 'openjdk7':
    ensure => present,
    name   => 'java-1.7.0-openjdk-devel'
  }

  service { 'go-server':
    ensure => running,
    enable => true
  }

  package { 'go-server':
    ensure  => present
  }

  Package['openjdk7'] -> Package['go-server'] -> Service['go-server']
}
