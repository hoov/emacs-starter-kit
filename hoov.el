(add-to-list 'load-path (concat dotfiles-dir "/vendor"))

;; Color Themes
(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme"))
(require 'color-theme)
(color-theme-initialize)
(load (concat dotfiles-dir "hoov/color-theme-hoov.el"))
(load (concat dotfiles-dir "vendor/color-theme-irblack.el"))
(load (concat dotfiles-dir "vendor/color-theme-tango.el"))
(color-theme-hoov)

;; Pymacs
(require 'pymacs)
(add-to-list 'pymacs-load-path (concat dotfiles-dir "pymacs"))
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)
(setq ac-ropemacs-loaded t)

(add-hook 'python-mode-hook '(lambda ()
                               (local-set-key (kbd "RET") 'newline-and-indent)))

;; yasnippet

(add-to-list 'load-path (concat dotfiles-dir "/vendor/yasnippet"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "/vendor/yasnippet/snippets"))

;; Auto Complete
(add-to-list 'load-path (concat dotfiles-dir "/vendor/auto-complete"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "/vendor/auto-complete/dict"))
(ac-config-default)

(defun ac-python-mode-setup ()
  (ac-ropemacs-setup)
  (setq ac-sources (append '(ac-source-yasnippet) ac-sources)))
(add-hook 'python-mode-hook 'ac-python-mode-setup)

(add-to-list 'load-path (concat dotfiles-dir "/vendor/textmate.el"))
(require 'textmate)
(textmate-mode)
(require 'peepopen)

;; Mercurial support
(require 'mercurial)



;; Pycomplexity
;(add-to-list 'load-path (concat dotfiles-dir "/vendor/pycomplexity"))
;(require 'linum)
;(require 'pycomplexity)
;(add-hook 'python-mode-hook
;    (function (lambda ()
;        (pycomplexity-mode)
;        (linum-mode))))
