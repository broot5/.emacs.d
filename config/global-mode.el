(setq tramp-default-method "ssh")

(global-display-line-numbers-mode)
(global-hl-line-mode t)

(setq inhibit-startup-screen t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq auto-save-default nil)
(setq make-backup-files nil)

(add-to-list 'default-frame-alist '(font . "IBMPlexMono-11"))
(set-face-attribute 'default t :font "IBMPlexMono-11")

(leaf electric-pair-mod
  :config
  (electric-pair-mode t))

(leaf evil
  :ensure t
  :config
  (evil-mode 1))

(leaf ivy
  :ensure t
  :config
  (ivy-mode 1))

(leaf counsel
  :ensure t
  :bind
  ("M-x" . counsel-M-x))

(leaf company
  :ensure t
  :config
  (global-company-mode)
  (company-tng-configure-default))

(leaf flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(leaf doom-themes
  :ensure t
  :config
  (load-theme 'doom-gruvbox t)
  (doom-themes-visual-bell-config))

(leaf mood-line
  :ensure t
  :config
  (mood-line-mode))

(leaf minions
  :ensure t
  :config
  (minions-mode 1))

(leaf solaire-mode
  :ensure t
  :config
  (solaire-global-mode +1)
  (solaire-mode-swap-bg))

(leaf golden-ratio
  :ensure t
  :config
  (golden-ratio-mode 1))

(leaf lsp-mode
  :ensure t
  :config
  (setq lsp-prefer-flymake nil)
  (setq lsp-enable-snippet nil))

(leaf lsp-ui
  :ensure t)

(defun lsp-company-backend()
  (add-to-list 'company-backends 'company-lsp))

(leaf company-lsp
  :ensure t
  :config
  (setq lsp-auto-configure t))

