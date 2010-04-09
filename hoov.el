(add-to-list 'load-path (concat dotfiles-dir "/vendor"))

;; Color Themes
(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme"))
(require 'color-theme)
(color-theme-initialize)

;; Pymacs
(require 'pymacs)
(add-to-list 'pymacs-load-path (concat dotfiles-dir "pymacs"))
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)
(setq ac-ropemacs-loaded t)

;; yasnippet

(add-to-list 'load-path (concat dotfiles-dir "/vendor/yasnippet"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "/vendor/yasnippet/snippets"))

;; Auto Complete
(add-to-list 'load-path (concat dotfiles-dir "/vendor/auto-complete"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "ac-dict"))
(ac-config-default)

(defun ac-python-mode-setup ()
  (ac-ropemacs-setup)
  (setq ac-sources (append '(ac-source-yasnippet) ac-sources)))
(add-hook 'python-mode-hook 'ac-python-mode-setup)

; 
; (setq ac-sources (append '(ac-source-yasnippet) ac-sources)))