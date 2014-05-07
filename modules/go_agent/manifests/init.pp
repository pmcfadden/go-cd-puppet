class go_agent {

  #  yumrepo { 'ThoughtWorksGo':
  #    baseurl  => 'http://download01.thoughtworks.com/go/yum/no-arch',
  #    descr    => 'ThoughtWorks Go Repo',
  #    enabled  => 1,
  #    gpgcheck => 0
  #  }

  package { 'go-agent':
    ensure  => present,
  }

  service { 'go-agent':
    ensure => running,
    enable => true
  }

  Package['openjdk7'] -> Package['go-agent'] -> Service['go-agent']
}
