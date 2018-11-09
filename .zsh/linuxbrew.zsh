if test -f /home/linuxbrew/.linuxbrew/opt/chruby/share/chruby/chruby.sh; then
  source /home/linuxbrew/.linuxbrew/opt/chruby/share/chruby/chruby.sh
  source /home/linuxbrew/.linuxbrew/opt/chruby/share/chruby/auto.sh
  export RUBIES=(/home/linuxbrew/.linuxbrew/opt/ruby@2.?)
  chruby ruby@2.5
  echo "~ Using Chruby with $(which ruby) $(ruby -v)"
fi

path-prepend /home/linuxbrew/.linuxbrew/bin
for gem_root_dir in /home/linuxbrew/.linuxbrew/lib/ruby/gems; do
  test -d "$gem_root_dir/bin" && path-prepend "$gem_root_dir/bin"
done
