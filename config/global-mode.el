;;; global-mode.el --- global mode config
;;; Commentary:
;; Enssential, Appearance, Addition, LSP contained
;;; Code:
(add-to-list 'default-frame-alist '(font . "Iosevka-12"))
(set-face-attribute 'default t :font "Iosevka-12")

(global-display-line-numbers-mode)
(global-hl-line-mode t)

(setq inhibit-startup-screen t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq auto-save-default nil)
(setq make-backup-files nil)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(setq scroll-margin 1
      scroll-conservatively 10000
      scroll-up-aggressively 0.5
      scroll-down-aggressively 0.5
      mouse-wheel-scroll-amount '(3 ((shift). 1))
      mouse-wheel-progressive-speed nil)

;;(setq tramp-default-method "ssh")

;; Essential
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
  (company-tng-configure-default)
  (global-company-mode))

(leaf flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(leaf magit
  :ensure t)

(leaf evil-magit
  :ensure t)

;; Appearance
(leaf doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-gruvbox t))

(leaf smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'respectful)
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

(leaf minions
  :ensure t
  :config
  (minions-mode 1))

;; Addition
(leaf neotree
  :ensure t
  :bind
  ("<f1>" . neotree-toggle)
  :config
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle))

(leaf ivy-rich
  :ensure t
  :config
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (ivy-rich-mode 1))

(leaf ivy-posframe
  :ensure t
  :after ivy
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
  (ivy-posframe-mode 1))

(leaf electric-pair-mod
  :config
  (electric-pair-mode t))

(leaf golden-ratio
  :ensure t
  :config
  (golden-ratio-mode 1))

(leaf solaire-mode
  :ensure t
  :hook
  ((change-major-mode after-revert ediff-prepare-buffer) . turn-on-solaire-mode)
  (minibuffer-setup . solaire-mode-in-minibuffer)
  :config
  (solaire-global-mode +1)
  (solaire-mode-swap-bg))

;; LSP
(leaf eglot
  :ensure t
  :config
  (add-hook 'before-save-hook 'eglot-format))

(provide 'global-mode)
;;; global-mode.el ends here
