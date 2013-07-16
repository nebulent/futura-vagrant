if [ -f "/var/vagrant_provision" ]; then
  # This script will run only if it is the first `vagrant up`
  # Or if there was a `vagrant destroy` and the VM was destroyed
  exit 0
fi

# Installing RVM
curl -L https://get.rvm.io | bash

# Reload
source ~/.profile
source ~/.bash_profile
source ~/.rvm/scripts/rvm

# Installing Ruby-1.9.3
rvm install 1.9.3
rvm alias create default 1.9.3
