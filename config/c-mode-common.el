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

;; (leaf irony
;;   :ensure t
;;   :hook
;;   (c-mode-common-hook . irony-mode))

;; (defun irony-company-backend()
;;   (add-to-list 'company-backends 'company-irony))

;; (defun irony-flycheck-backend()
;;   (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; (defun irony-headers-company-backend()
;;   (add-to-list 'company-backends 'company-irony-c-headers))

;; (leaf company-irony
;;   :ensure t
;;   :hook
;;   (c-mode-common-hook . irony-company-backend))

;; (leaf flycheck-irony
;;   :ensure t
;;   :hook
;;   (c-mode-common-hook . irony-flycheck-backend))

;; (leaf company-irony-c-headers
;;   :ensure t
;;   :hook
;;   (c-mode-common-hook . irony-headers-company-backend))

(with-eval-after-load 'company
  (setq company-backends (delete 'company-clang company-backends)))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure))

(provide 'c-mode-common)
;;; c-mode-common.el ends here
