(load "basic")

(defun my/local/tangle-org-mode-files ()
  (my/info "Running my/local/tangle-org-mode-files.")
  (org-babel-tangle))

(add-hook 'org-mode-hook
  (lambda ()
    (add-hook 'after-save-hook 'my/local/tangle-org-mode-files nil nil)))
