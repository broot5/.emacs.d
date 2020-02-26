;;; global-mode.el --- global mode config
;;; Commentary:
;; Enssential, Appearance, Addition, LSP contained
;;; Code:
(add-to-list 'default-frame-alist '(font . "Iosevka-14"))
(set-face-attribute 'default t :font "Iosevka-14")

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

;; Essential
(leaf evil
  :ensure t
  :config
  (evil-mode t))

(leaf ivy
  :ensure t
  :config
  (ivy-mode t))

(leaf counsel
  :ensure t
  :bind
  ("M-x" . counsel-M-x)
  ("C-x b" . counsel-switch-buffer)
  :config
  (add-to-list 'ivy-initial-inputs-alist '(counsel-M-x . ""))
  (add-to-list 'ivy-initial-inputs-alist '(counsel-desribe-function . ""))
  (add-to-list 'ivy-initial-inputs-alist '(counsel-describe-variable . "")))

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
  (load-theme 'doom-wilmersdorf t))

(leaf smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'respectful)
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

(leaf minions
  :ensure t
  :config
  (minions-mode t))

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
  (ivy-rich-mode t))

(leaf ivy-posframe
  :ensure t
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
  (setq ivy-posframe-parameters
	'((left-fringe . 10)
	  (right-fringe . 10)
	  (height . 20)))
  (setq ivy-height '20)
  (ivy-posframe-mode t))

(leaf indent-guide
  :ensure t
  :config
  (indent-guide-global-mode))

(leaf electric-pair-mod
  :config
  (electric-pair-mode t))

(leaf diff-hl
  :ensure t
  :config
  (setq diff-hl-margin-mode t)
  (global-diff-hl-mode))

(leaf golden-ratio
  :ensure t
  :config
  (golden-ratio-mode t))

(leaf solaire-mode
  :ensure t
  :hook
  ((change-major-mode after-revert ediff-prepare-buffer) . turn-on-solaire-mode)
  (minibuffer-setup . solaire-mode-in-minibuffer)
  :config
  (solaire-global-mode +1)
  (solaire-mode-swap-bg))

(leaf focus
  :ensure t)

;; LSP
(leaf eglot
  :ensure t
  :config
  (add-hook 'before-save-hook 'eglot-format))

(provide 'global-mode)
;;; global-mode.el ends here
