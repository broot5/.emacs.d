(leaf cmake-mode
  :ensure t
  :mode("CMakeLists.txt'" . cmake-mode))

(leaf cmake-ide
  :ensure t
  :config
  (cmake-ide-setup))

(leaf clang-format
  :ensure t
  :config
  (setq clang-format-style-option "Google"))

(leaf irony
  :ensure t
  :hook
  (c-mode-common-hook . irony-mode)
  :init
  (if (string= system-type "windows-nt")
      (when (boundp 'w32-pipe-read-delay)
	(setq w32-pipe-read-delay 0))
    (when (boundp 'w32-pipe-buffer-size)
      (setq irony-server-w32-pipe-buffer-size (* 64 1024)))))


(defun irony-company-backend()
  (add-to-list 'company-backends 'company-irony))

(defun irony-flycheck-backend()
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(defun irony-headers-company-backend()
  (add-to-list 'company-backends 'company-irony-c-headers))

(leaf company-irony
  :ensure t
  :hook
  (c-mode-common-hook . irony-company-backend))

(leaf flycheck-irony
  :ensure t
  :hook
  (c-mode-common-hook . irony-flycheck-backend))

(leaf company-irony-c-headers
  :ensure t
  :hook
  (c-mode-common-hook . irony-headers-company-backend))
