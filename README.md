# Futura Vagrant Settup
## COPD_Backend and COPD_Auth_server

### Prerequisites

- [Vagrant](http://downloads.vagrantup.com/tags/v1.2.3)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

### Initial Steps

First, git-clone this repository somewhere on your machine.

Next, cd into `futura-vagrant` and git-clone (or copy) the project's COPD_Backend and COPD_Auth_server repositories.

Make sure the `COPD_Backend` and `COPD_Auth_server` projects are in the same directory as:
- *Vagrantfile* (vagrant configuration file)
- *provision.sh* (provision shell script)
- *futura_dev.sql* (database dump)
- *README.md* (this readme)

### Vagrant Up

`cd` into `futura-vagrant` and run:
```sh
vagrant up
```

This will copy the VM image (or download it), set up Vagrant, and run the provision script. 
After Vagrant has set up the VM, it's status can be checked with `vagrant status`. 

On the guest machine, the contents of the `futura-vagrant` directory are in `/vagrant`.

Now you have to `ssh` into Vagrant, run `bundle` inside each project, and your environment is all set up.

```sh
vagrant ssh
cd /vagrant/COPD_Backend
bundle
cd /vagrant/COPD_Auth_server
bundle
cd /vagrant/
```

### Stoping the VM

There are 3 options to stop the VM:

1. `vagrant suspend` will preserve the current state of the machine, so that when you run `vagrant up` again, you can continue where you left; this will use more HDD space.
2. `vagrant halt` will properly shutdown the guest machine; you can force the shutdown by appending the `--force` flag.
3. `vagrant destroy` will entirely remove all files of the guest machine, except the files from shared folders.


