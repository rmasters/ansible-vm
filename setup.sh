sudo apt-get update
sudo apt-get -y install python-software-properties

sudo add-apt-repository -y ppa:rquillo/ansible
sudo apt-get -y install ansible

sudo apt-get dist-upgrade -yq

echo localhost > /etc/ansible/hosts
sudo ansible-playbook /ansible/main.yml --connection=local
