# Xorg specific options
# Technically you could use this as xprofile

# Local Variables:
# mode: sh
# sh-shell: sh
# sh-basic-offset: 2
# sh-indentation: 2
# indent-tab-mode: nil
# End:

# fixing java font rendering problems
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd"

# force gtkrc path
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# why is this even here
export SDL_AUDIODRIVER=alsa
