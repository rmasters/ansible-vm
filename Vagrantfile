VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # Networking: adjust as necessary (host-only configured below)
  config.vm.network :private_network, ip: "192.168.33.10"

  # If true, then any SSH connections made will enable agent forwarding.
  # config.ssh.forward_agent = true
  # config.ssh.private_key_path = "~/.ssh/id_rsa"
  
  # Mount for configuring this VM (i.e. if you're using this as boilerplate)
  config.vm.synced_folder "ansible/", "/ansible"

  # Add mounts to playbooks that use other hosts here
  # config.vm.synced_folder "../some-project/playbooks", "/project", mount_options: ["fmode=660"]
  
  config.vm.provision :shell, path: "setup.sh"

  config.vm.provider "virtualbox" do |v|
    v.name = "ansible_vm"
  end
end
