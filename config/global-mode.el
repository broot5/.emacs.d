(setq tramp-default-method "ssh")

(global-display-line-numbers-mode)
(global-hl-line-mode t)

(setq inhibit-startup-screen t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq auto-save-default nil)
(setq make-backup-files nil)

(add-to-list 'default-frame-alist '(font . "Iosevka-12"))
(set-face-attribute 'default t :font "Iosevka-12")

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

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
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (setq doom-one-brighter-comments t)
  (load-theme 'doom-gruvbox t)
  (doom-themes-visual-bell-config))

(leaf smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'respectful)
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

(leaf neotree
  :ensure t
  :bind
  ("<f1>" . neotree-toggle)
  :config
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle))

(leaf solaire-mode
  :ensure t
  :hook
  ((change-major-mode after-revert ediff-prepare-buffer) . turn-on-solaire-mode)
  (minibuffer-setup . solaire-mode-in-minibuffer)
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

(leaf magit
  :ensure t)

(leaf evil-magit
  :ensure t)
