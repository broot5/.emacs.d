;;; rust-mode.el --- rust mode config
;;; Commentary:
;; rustic, LSP contained
;;; Code:
(leaf rustic)

(leaf lsp-mode
  :hook (rust-mode . lsp))

(provide 'rust-mode)
;;; rust-mode.el ends here
