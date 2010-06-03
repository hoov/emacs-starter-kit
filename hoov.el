(add-to-list 'load-path (concat dotfiles-dir "/vendor"))

(setq exec-path (append exec-path '("/usr/local/bin")))

;; Color Themes
(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme"))
(require 'color-theme)
(color-theme-initialize)
(load (concat dotfiles-dir "hoov/color-theme-hoov.el"))
(load (concat dotfiles-dir "vendor/color-theme-irblack.el"))
(load (concat dotfiles-dir "vendor/color-theme-tango.el"))
(color-theme-hoov)

;; Pymacs
;(autoload 'pymacs-apply "pymacs")
;(autoload 'pymacs-call "pymacs")
;(autoload 'pymacs-eval "pymacs" nil t)
;(autoload 'pymacs-exec "pymacs" nil t)
;(autoload 'pymacs-load "pymacs" nil t)
;(eval-after-load "pymacs"
;  '(add-to-list 'pymacs-load-path (concat dotfiles-dir "pymacs")))
;(pymacs-load "ropemacs" "rope-")
;(setq ropemacs-enable-autoimport t)
;(setq ac-ropemacs-loaded t)

(require 'pysmell)
(add-hook 'python-mode-hook (lambda () (pysmell-mode 1)))

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

(defun ac-pysmell-candidate ()
  (pysmell-get-all-completions))

(ac-define-source pysmell
  '((candidates . ac-pysmell-candidate)
    (symbol . "ps")))

(defun ac-python-mode-setup ()
;  (ac-ropemacs-setup)
  (setq ac-sources '(ac-source-yasnippet ac-source-pysmell)))
(add-hook 'python-mode-hook 'ac-python-mode-setup)

;
(add-to-list 'load-path (concat dotfiles-dir "/vendor/textmate.el"))
(require 'textmate)
(require 'peepopen)
(setq ns-pop-up-frames nil)
(textmate-mode)

;; Mercurial support
(require 'mercurial)

;; Highlight the current line
;(global-hl-line-mode 1)

;; Column number
(column-number-mode)

;; Line numbers
(global-linum-mode 1)

;; Same as linum.el, but we're adding a space after the %d
(setq linum-format
      (lambda (line)
        (propertize (format
                     (let ((w (length (number-to-string
                                       (count-lines (point-min) (point-max))))))
                       (concat "%" (number-to-string w) "d ")) line) 'face 'linum)))

;; Set up flymake to use pyflakes
(when (load "flymake" t) 
      (defun flymake-pyflakes-init () 
        (let* ((temp-file (flymake-init-create-temp-buffer-copy 
                           'flymake-create-temp-inplace)) 
           (local-file (file-relative-name 
                        temp-file 
                        (file-name-directory buffer-file-name)))) 
          (list "pyflakes" (list local-file)))) 

      (add-to-list 'flymake-allowed-file-name-masks 
               '("\\.py\\'" flymake-pyflakes-init))) 

(add-hook 'find-file-hook 'flymake-find-file-hook)

;; haml + sass
(require 'haml-mode)
(require 'sass-mode)


(setq ack-root-directory-functions '(textmate-project-root))
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)
