# Ansible VM

Quickly sets up a Virtual Machine with Ansible installed for use on platforms
where Ansible isn't available (like Windows [for the moment][ansible-win]).

The VM configures itself using Ansible as [inspired by Christian's Quora
post][inspiration].

## Usage

Generally, I add the path to the Ansible playbooks as a synced folder in
Vagrantfile, ssh into the VM and run `ansible-playbooks` from that session.

There is a trick to be aware of with the synced folders however. Ansible allows
inventories (host listings) to be executable files (if you want to use some
sort of host inventory system or API response). If the inventory file given is
executable Ansible will try and run it - which doesn't work if you are using
static host files. By default, VirtualBox mounts shares with all files as
executable so we need to disable this with a mount flag:

    config.vm.synced_folder "../other-project/playbooks", "/project", mount_options: ["fmode=660"]

Use `fmode=666` if you're logging in as a user that is not in the `vboxsf` group
for some reason (`vagrant` is in the group in most boxes).

[ansible-win]: https://groups.google.com/d/msg/ansible-project/17YZIgArn2g/vY-QDVVUKusJ
[inspiration]: http://www.quora.com/Christian-Nygaard/Posts/Using-Vagrant-and-Ansible-on-Windows
