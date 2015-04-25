What is this?
=============

This repo contains config files that I use across diffrent systems.

profile.d
---------

All the files under `profile.d/` are meant to be loaded by your shell at login.
These should work with most shells compatible with `sh`.

To install these scripts, copy/symlink them in `/etc/profile.d/`. This can be
done in one fell swoop with:

    # cd /etc/profile.d/
    # find /path/to/profile.d/ -name '*.sh' -exec ln -s {} \;

You don't need to install all the scripts. If you're only installing parts of
the scripts, make sure to install `profile.d/00-utils.sh`. The other scripts
depend on it.

### Dependencies

- a `sh` compatible shell
- ruby (`profile.d/ruby.sh`)
- vim (default editor)

zsh & oh-my-zsh
---------------

Everything in the `zsh/` directory is used to configure zsh directly. It mostly
configures and loads _oh-my-zsh_. `zsh/zshrc` expects you to have zsh installed
in `/usr/share/oh-my-zsh`. This is the default for the oh-my-zsh AUR package on
Arch Linux. Feel free to change the `ZSH` variable at the begining of the file.
You are also expected to have the _boris_ theme installed in oh-my-zsh. It's
located under the `oh-my-zsh/` directory.

The `oh-my-zsh/` directory contains _boris_ theme. You can copy the contents of
this directory into your oh-my-zsh directory. Newer versions of oh-my-zsh allow
for a custom directory. This doesn't make use of it.

### Dependencies

- zsh 5.x
- oh-my-zsh

awesome
-------

This is my configuration for Awesome WM. It's pretty messy and is based on the
default config.

### Dependencies

- awesome wm 3.5.x (they broke the config when moving from 3.4.x)
- thunar (file browser)
- dmenu_run (improved run dialog)
- scrot (screenshots)
- wicd-client (autorun)
- numlockx (autorun)

