;;; init.el --- Emacs init file
;;; Commentary:
;; personal Emacs configuration
;;; Code:
;; <leaf-install-code>
(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu" . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf)))
;; </leaf-install-code>

(leaf leaf
  :custom ((leaf-defaults . '(:ensure t))))

(setq comp-deferred-compilation t)
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

(defun load-directory (dir)
  (let ((load-it (lambda (f) (load-file (concat (file-name-as-directory dir) f)))))
    (mapc load-it (directory-files dir nil "\\.el"))))

(load-directory "~/.emacs.d/config")

(provide 'init)
;;; init.el ends here
