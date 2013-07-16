# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 9292, host: 9292
  config.vm.provision "shell", path: "provision.sh"
  
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "1024"]
  end
end
