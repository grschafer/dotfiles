## dotfiles

Originally forked from [holman's dotfiles](https://github.com/holman/dotfiles),
I expanded the scope while learning [Ansible]. It's now meant to take a
brand-new server (or VM), update it, and personalize it for me.

Some of the things it does:

  - update system packages

  - install new packages (git, vim, zsh, tmux, and more)

  - turn on passwordless sudo for the admin group

  - add local ssh key to authorized\_keys, if it's a remote server/VM

  - create the user specified in ansible/group\_vars/all.yml as an admin

  - download and install [fasd](https://github.com/clvv/fasd)

  - install solarized color theme for shell

  - symlink all dotfiles in this repo (e.g. zshrc, zprofile, gitconfig, etc.)

  - install vim bundles with [vundle] (see vim/vimrc.symlink)


## prereqs: ansible and vagrant

If you want to do all of the above on a VM managed by vagrant, then first
install [vagrant](http://www.vagrantup.com/). Then install [Ansible] and
follow the instructions under "install".

If you want to do all of the above with your local machine or with remote
servers, install [Ansible]. I've had luck installing it with `sudo pip
install ansible`.


## install

### in a new VM

1. Enable ssh agent forwarding (so relevant git repos can be downloaded via ssh,
assuming you currently have a key pair in `~/.ssh/id_rsa` which is registered
with GitHub) by running `ssh-add`.

2. Then just run `vagrant up` and enter "vagrant" as the password.

You can run the ansible provisioning on its own with `vagrant provision`.

### to a remote server

1. Enable ssh agent forwarding (so relevant git repos can be downloaded via ssh,
assuming you currently have a key pair in `~/.ssh/id_rsa` which is registered
with GitHub) by running `ssh-add`.

1. Add the remote server's address and port to ansible/inventory on the "personal"
and "privileged" lines.

2. Edit the fields in ansible/group\_vars/all.yml as you like.

3. Then run the following:

    ```sh
    ansible-playbook ansible/playbook.yml -i ansible/inventory -K
    ```

    The `-K` flag prompts you for the password for the sudo_user in
    ansible/group\_vars/all.yml

### to your local machine

1. Edit the fields in ansible/group\_vars/all.yml as you like.

2. Then run the following:

    ```sh
    ansible-playbook ansible/local_playbook.yml -i ansible/inventory -K
    ```

    The `-K` flag prompts you for your password (for running sudo commands).


## notes

* You can add `-vvvv` to the ansible and ansible-playbook commands to get lots
of output (including ssh) for debugging.

* Ruby and rbenv aren't included in this repo or the ansible playbook, so
there's still an error when you enter zsh and .zprofile tries to `eval rbenv
init`.

[Ansible]: http://www.ansibleworks.com/
[vundle]: https://github.com/gmarik/vundle
