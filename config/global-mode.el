;;; global-mode.el --- global mode config
;;; Commentary:
;; Enssential, Appearance, Addition, LSP contained
;;; Code:
(add-to-list 'default-frame-alist '(font . "IBMPlexMono-14"))
(set-face-attribute 'default t :font "IbmPlexMono-14")

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

(electric-pair-mode)

;; Essential
(leaf evil
  :config
  (evil-mode t))

(leaf ivy
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (ivy-mode t))

(leaf counsel
  :bind
  ("M-x" . counsel-M-x)
  ("C-x b" . counsel-switch-buffer)
  ("C-c c" . counsel-compile)
  ("C-c f" . counsel-fzf)
  :config
  (setq ivy-initial-inputs-alist nil))

(leaf swiper
  :bind
  ("C-s" . swiper-isearch))

(leaf company
  :config
  (setq company-idle-delay 0)
  (setq company-show-numbers t)
  (global-company-mode))

(leaf flycheck
  :config
  (global-flycheck-mode))

(leaf yasnippet
  :config
  (add-hook 'lsp-mode-hook 'yas-minor-mode-on))

(leaf magit)

(leaf evil-magit)

;; Appearance
(leaf doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-gruvbox t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config))

(leaf doom-modeline
  :require all-the-icons ;; M-x all-the-icons-install-fonts
  :config
  (doom-modeline-mode t))

;; Addition
(leaf neotree
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

(leaf indent-guide
  :config
  (indent-guide-global-mode))

(leaf rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(leaf diff-hl
  :config
  (setq diff-hl-margin-mode t)
  (global-diff-hl-mode))

(leaf golden-ratio
  :config
  (golden-ratio-mode t))

(leaf solaire-mode
  :hook (after-init . solaire-global-mode))

(leaf which-key
    :config
    (which-key-mode))

;; LSP
(leaf lsp-mode
  :config
  (setq lsp-keymap-prefix "s-l")
  
  (setq lsp-enable-snippet t)
  (setq lsp-auto-execute-action t)
  (setq lsp-eldoc-render-all t)
  (setq lsp-enable-completion-at-point t)
  (setq lsp-enable-xref t)
  (setq lsp-enable-indentation t)
  (setq lsp-enable-on-type-formatting t)
  (setq lsp-semantic-highlighting t)
  (setq lsp-enable-imenu t)
  (setq lsp-enable-text-document-color t)
  (setq lsp-completion-provider :capf)
  (setq lsp-modeline-diagnostics-enable t)
  (setq lsp-headerline-breadcrumb-mode t)
  :hook (lsp-mode . lsp-enable-which-key-integration)
  :commands lsp)

(leaf lsp-ui
  :config
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-peek-enable t)
  (setq lsp-ui-doc-enable t)

  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  :commands lsp-ui-mode)

(leaf lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(provide 'global-mode)
;;; global-mode.el ends here
