; Stolen from https://gist.github.com/martinklepsch/4e5f2c52a5d9797278d1
					; Reload by M-x eval-buffer or M-x load-file.
; You can also just move the point to the end of any sexp and press C-xC-e to execute just that sexp. Usually it's not necessary to reload the whole file if you're just changing a line or two.

(require 'package)

; List the packages you want
(setq package-list '(evil
                     evil-leader
		     evil-escape))

; Add Melpa as the default Emacs Package repository
; only contains a very limited number of packages
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

; emacs-snapshot-nox says this is unnecessary.
; Activate all the packages (in particular autoloads)
;(package-initialize)

; Update your local package index
(unless package-archive-contents
  (package-refresh-contents))

; Install all missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'evil)
(evil-mode t)

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
