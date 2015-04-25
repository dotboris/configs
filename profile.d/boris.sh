# Basic shell environement. This is meant to be sourced by your shell at start.
# You should probably put this file in /etc/profile.d/boris.sh

# Local Variables:
# mode: sh
# sh-shell: sh
# sh-basic-offset: 2
# sh-indentation: 2
# indent-tab-mode: nil
# End:

# paths
path_prepend "$HOME/bin"

# less bullshit (is this actually needed)
export LESS_TERMCAP_mb=$(printf "\e[1;37m")
export LESS_TERMCAP_md=$(printf "\e[1;37m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[1;47;30m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[0;36m")

# I don't actually remember why I have this, but if it aint broke don't fix it
export LC_NUMERIC=POSIX

# vim as a command line editor
export EDITOR=vim

