; List the packages you want.
(setq package-list '(evil))

; List the repositories containing them.
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; Activate all the packages (in particular autoloads).
(package-initialize)

; Fetch the list of packages available.
(unless package-archive-contents
  (package-refresh-contents))

; Install the missing packages.
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

; Vim please.
(require 'evil)
  (evil-mode 1)

; Show line numbers. This replaces linum in Emacs 26.
(global-display-line-numbers-mode)

; Disable the menu bar (top line).
(menu-bar-mode -1)
;(setq x-super-keysym 'meta)
(setq mac-command-key-is-meta t)
