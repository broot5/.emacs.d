;;; rust-mode.el --- rust mode config
;;; Commentary:
;; rustic, lsp setting contained
;;; Code:
(leaf rustic
  :ensure t
  :config
  (setq rustic-lsp-server 'rust-analyzer)
  (setq rustic-lsp-client 'eglot))

(provide 'rust-mode)
;;; rust-mode ends here
