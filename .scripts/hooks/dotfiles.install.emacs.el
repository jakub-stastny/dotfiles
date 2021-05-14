#!/usr/bin/emacs --script

(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-refresh-contents)

(dolist (package '(org evil))
  (unless (package-installed-p package)
    (message "~ Installing %s." package)
    (package-install package)))
