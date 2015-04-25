# Functions and utilities to manage the environment

# Local Variables:
# mode: sh
# sh-shell: sh
# sh-basic-offset: 2
# sh-indentation: 2
# indent-tab-mode: nil
# End:

# pretend all the arguments to the path
path_prepend() {
  for p in $@; do
    PATH="$p:$PATH"
  done
}

# returns 0 if a command exists
command_exists() {
  command -v "$1" > /dev/null
}

# returns 0 if ruby is present on
has_ruby() {
  command_exists ruby
}
