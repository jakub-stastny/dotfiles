; Stolen from https://gist.github.com/martinklepsch/4e5f2c52a5d9797278d1
;
; Reload by M-x eval-buffer or M-x load-file.
;
; You can also just move the point to the end of any sexp and press C-x C-e
; to execute just that sexp. Usually it's not necessary to reload the whole file
; if you're just changing a line or two.

; List the packages you want.
(setq package-list '(evil
                     ;evil-escape ; Currently there's a version mismatch.
                     evil-leader))

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

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "b" 'switch-to-buffer
  "w" 'save-buffer)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil-leader evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Ctrl-[ works as Esc on iOS keyboard.
;(setq-default evil-escape-key-sequence "jj")
(setq-default evil-escape-key-sequence "§")

; Show line numbers. This replaces linum in Emacs 26.
(global-display-line-numbers-mode)

; Disable the menu bar (top line).
(menu-bar-mode -1)
;(setq x-super-keysym 'meta)
(setq mac-command-key-is-meta t)
