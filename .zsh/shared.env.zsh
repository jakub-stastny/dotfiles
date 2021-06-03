flist=$(print -l ${(ok)functions} | egrep -v ^_)
alist=${(ok)aliases}
save-function-list() {
  flist=$(print -l ${(ok)functions} | egrep -v ^_)
  alist=${(ok)aliases}
}

compare-array() {
  local another=${(s. .)1}

  for item in ${(s. .)2}; do
    (( ${another[(I)$item]} )) || echo -n " $item"
  done
}

get-new-functions() {
  fns=$(echo $(print -l ${(ok)functions} | egrep -v ^_))
  compare-array "$flist" "$fns"
  compare-array "$alist" "${(ok)aliases}"
}

report-custom-functions() {
  [[ -o interactive  ]] && echo "  $(tput setaf 2)$(test "$#" -gt 0 && echo $@ || echo Functions):$(tput setaf 7)$(get-new-functions)$(tput sgr0)."
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
