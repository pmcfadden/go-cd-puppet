class go_agent(
  $server_ip = "127.0.0.1",
  $server_port = "8153"
) {

  #  yumrepo { 'ThoughtWorksGo':
  #    baseurl  => 'http://download01.thoughtworks.com/go/yum/no-arch',
  #    descr    => 'ThoughtWorks Go Repo',
  #    enabled  => 1,
  #    gpgcheck => 0
  #  }

  package { 'go-agent':
    ensure  => present,
  }

  file { '/etc/default/go-agent':
    content => template('go_agent/go-agent.erb')
  }

  service { 'go-agent':
    ensure => running,
    enable => true
  }

  Package['openjdk7'] -> Package['go-agent'] -> File['/etc/default/go-agent'] -> Service['go-agent']
}
