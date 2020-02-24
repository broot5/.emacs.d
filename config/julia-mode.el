;;; julia-mode.el --- julia mode config
;;; Commentary:
;; 
;;; Code:
(leaf julia-mode
  :ensure t)

(leaf eglot-jl
  :ensure t
  :config
  (eglot-jl-init))

(provide 'julia-mode)
;;; julia-mode.el ends here
