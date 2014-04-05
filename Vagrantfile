# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos6-vagrant"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v0.1.0/centos64-x86_64-20131030.box"
  config.vm.provider 'virtualbox' do |v|
    v.memory = 1024
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :machine
  end

  config.vm.network :forwarded_port, guest: 8153, host: 8153

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.aliases = %w(vagrant-centos64.vagrantup.com)

  config.vm.provision 'shell', inline: 'sudo yum install puppet -y'

  config.vm.provision :hostmanager
  config.vm.provision :puppet
end
