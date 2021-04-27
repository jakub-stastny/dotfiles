;; My own idea, but turns out it already existed:
;; https://github.com/larstvei/dot-emacs
;;
;; NOTE: Maybe a lot of this file can simply be replaced by:
;; (org-babel-load-file "~/.emacs.d/init.org")
;;
;; This file replaces itself with the actual configuration at first run.

;; Problem: it doesn't work if the org mode is not installed.
;; https://emacs.stackexchange.com/questions/28932/how-to-automate-installation-of-packages-with-emacs-file
(package-initialize)
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;(package-refresh-contents) ; FIXME: Run only on the first launch.
(dolist (package '(use-package))
   (unless (package-installed-p package)
       (package-install package)))


; Now the org mode.
(use-package org
						 :ensure t)
(require 'org)

;; Open the configuration
(find-file (concat user-emacs-directory "init.org"))

;; Tangle it.
(org-babel-tangle)

;; Load it.
(message "Loading ~/.emacs.d/init.el")
(load-file (concat user-emacs-directory "init.el"))

;; Finally byte-compile it.
(message "Byte compiling ~/.emacs.d/init.el")
(byte-compile-file (concat user-emacs-directory "init.el"))

(message "Emacs configuration successfully compiled from init.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-Iosvkem))
 '(custom-safe-themes
   '("990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" default))
 '(package-selected-packages
   '(evil z3-mode which-key vterm use-package try smex slime racket-mode proof-general pdf-tools org-roam-server org-bullets olivetti minizinc-mode maude-mode magit lsp-java js2-mode jedi haskell-mode golden-ratio focus expand-region erlang doom-themes diff-hl define-word counsel-projectile company-coq clj-refactor auto-compile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
