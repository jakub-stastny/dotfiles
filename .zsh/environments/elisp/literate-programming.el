(load "basic")

(defun my/local/tangle-org-mode-files ()
  (my/info "Running my/local/tangle-org-mode-files.")
  (org-babel-tangle))

(add-hook 'org-mode-hook
  (lambda ()
    (add-hook 'after-save-hook 'my/local/tangle-org-mode-files nil nil)))

(defun my/literate/mkprologue (base buffer-name)
  (str "# Generated from " base buffer-name))

(org-babel-do-load-languages
  'org-babel-load-languages
  '(
     (shell . t)
     (ditaa . t)))
