yumrepo { 'ThoughtWorksGo':
  baseurl  => 'http://download01.thoughtworks.com/go/yum/no-arch',
  descr    => 'ThoughtWorks Go Repo',
  enabled  => 1,
  gpgcheck => 0
}

package { 'go-agent':
  ensure  => present,
}

package { 'go-server':
  ensure  => present,
  before  => Package['go-agent']
}

package { 'openjdk7':
  ensure => present,
  name   => 'java-1.7.0-openjdk-devel'
}

service { 'go-server':
  ensure => running,
  enable => true
}

service { 'go-agent':
  ensure => running,
  enable => true
}

Package['openjdk7'] -> Package['go-server'] -> Service['go-server']
Package['go-agent'] -> Service['go-agent']
