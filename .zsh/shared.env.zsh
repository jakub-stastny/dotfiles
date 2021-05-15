flist=${(ok)functions}
alist=${(ok)aliases}
save-function-list() {
  flist=${(ok)functions}
  alist=${(ok)aliases}
}

# TODO: Cache this, remove cache on new commit.
get-new-functions() {
  SCRIPT='nfs = ARGV[1].split(" ") - ARGV[0].split(" "); puts nfs.grep_v(/^_/).join(" ")'
  fs=$(/opt/rubies/ruby-3.0.1/bin/ruby -e "$SCRIPT" "$flist" "${(ok)functions}")
  as=$(/opt/rubies/ruby-3.0.1/bin/ruby -e "$SCRIPT" "$alist" "${(ok)aliases}")
  echo $fs $as
}

report-custom-functions() {
  [[ -o interactive  ]] && echo "  $(tput setaf 2)$(test "$#" -gt 0 && echo $@ || echo Functions): $(tput setaf 7)$(get-new-functions)$(tput sgr0)."
}

function display-loaded-file() {
  [[ -o interactive  ]] && echo "$(tput setaf 2)~$(tput sgr0) Loading $(tput setaf 7)$(echo $1 | sed -E "s|$HOME|~|")$(tput sgr0)"
}

display-loaded-file $0 && echo && report-custom-functions "Function reporting" && save-function-list

alias dotfiles="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"

report-custom-functions "Aliases" && save-function-list

# PATH
# TODO: make uniq always.
path-add()        { path+=("$@") } # TODO: Change to append.
path-prepend()    { path=("$@" $path) }
path-del()        { for i ("$@") { path[(r)$i]=() } }
path-clear()      { path=() }

path-prepend ~/.scripts

report-custom-functions "Paths" && save-function-list

error() {
  echo "$(tput setaf 1)Error:$(tput sgr0) $*" && return 1
}

warn() {
  echo "$(tput setaf 5)Warning:$(tput sgr0) $*"
}

report-custom-functions "Formatting" && echo
