if [ -f "/var/vagrant_provision" ]; then
  # This script will run only if it is the first `vagrant up`
  # Or if there was a `vagrant destroy` and the VM was destroyed
  exit 0
fi

echo "Updating apt-get..."
apt-get update

export DEBIAN_FRONTEND=noninteractive

echo "Installing the software..."
apt-get install -y build-essential git curl libxslt-dev libxml2-dev libcurl3-dev mysql-client libmysqlclient-dev nodejs mysql-server xvfb firefox

echo "Setting up the backend database from futura_dev.sql seed..."
echo "create database futura_dev; create database futura_test;" | mysql -uroot
mysql -uroot futura_dev < /vagrant/futura_dev.sql
mysql -uroot futura_test < /vagrant/futura_dev.sql

echo "Setting up the auth server database from futura_auth_dev.sql seed..."
echo "create database futura_auth_dev; create database futura_auth_test;" | mysql -uroot
mysql -uroot futura_auth_dev < /vagrant/futura_auth_dev.sql
mysql -uroot futura_auth_test < /vagrant/futura_auth_dev.sql

echo "Running init.sh script..."
su vagrant -c "/bin/bash /vagrant/init.sh"

touch /var/vagrant_provision
