;;; c-mode-common.el --- common c mode config
;;; Commentary:
;; cmake-mode, cmake-ide, lsp setting contained
;;; Code:
(leaf cmake-mode
  :ensure t
  :mode("CMakeLists.txt'" . cmake-mode))

(leaf cmake-ide
  :ensure t
  :config
  (cmake-ide-setup))

(leaf company
  :ensure t
  :after company
  :config
  (setq company-backends (delete 'company-clang company-backends)))

(leaf eglot
  :ensure t
  :after eglot
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) . ("clangd" "--clang-tidy")))
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure))

(provide 'c-mode-common)
;;; c-mode-common.el ends here
