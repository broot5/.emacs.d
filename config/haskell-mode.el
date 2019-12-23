(leaf haskell-mode
  :ensure t
  :mode(("\\.hs\\'" . haskell-mode)))

(leaf lsp-haskell
  :ensure t
  :config
  (setq lsp-haskell-process-path-hie "hie-wrapper"))
