# Environement configs for ruby

# Local Variables:
# mode: sh
# sh-shell: sh
# sh-basic-offset: 2
# sh-indentation: 2
# indent-tab-mode: nil
# End:

if has_ruby; then
  # ruby gems bin dir
  path_prepend "`ruby -e 'print Gem.user_dir'`/bin"
  
  # force gem to use the local gem home
  export GEM_HOME=$(ruby -e 'print Gem.user_dir')
fi

