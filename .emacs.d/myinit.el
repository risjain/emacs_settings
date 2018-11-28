(setq inhibit-startup-message t)              ;;Prevents the initial load screen 
(tool-bar-mode -1)                            ;;Disables the toolbar
(fset 'yes-or-no-p 'y-or-n-p)                 ;;Allows using y/n for yes/no
(global-set-key (kbd "<f5>") 'revert-buffer)  ;;Allows reloading a buffer using F5 directly

(use-package key-chord
  :ensure t
  :init
  (key-chord-define-global "lk" 'forward-char)
  :config
  (require 'key-chord)
  (key-chord-mode 1))

(defun my-bell-function ())  ;;Defines an arbitrary function which does nothing
(setq ring-bell-function 'my-bell-function) ;; remaps the bell function to the above arbitraty function to do nothing
(setq visible-bell nil)

(global-set-key (kbd "C-M-q") 'visual-line-mode)  ;;Allows toggle of word wrapping

(use-package multiple-cursors
:ensure t
:bind (("C-S-c C-S-c" . mc/edit-lines)
("C->" . mc/mark-next-like-this)
("C-<" . mc/mark-previous-like-this)
("C-c C-<" . mc/mark-all-like-this)
("C-c C-* C-*" . mc/mark-more-like-this)
("C-* i" . mc/insert-numbers)
("C-* s" . mc/sort-regions)
("C-* r" . mc/reverse-regions)
("M-<mouse-1>" . mc/add-cursor-on-click))
:init
(global-unset-key (kbd "M-<down-mouse-1>"))
:config
(require 'mc-extras))

(use-package mc-extras
:ensure t
:commands 
(mc/compare-chars mc/compare-chars-backward mc/compare-chars-forward
mc/cua-rectangle-to-multiple-cursors
 mc/remove-current-cursor mc/remove-duplicated-cursors)
 :config
 (progn
 (bind-keys :map mc/keymap
 ("C-. C-d" . mc/remove-current-cursor)
 ("C-. d" . mc/remove-duplicated-cursors)
 ("C-. =" . mc/compare-chars))
 (eval-after-load 'cua-base
 '(bind-key "C-. C-," 'mc/cua-rectangle-to-multiple-cursors cua--rectangle-keymap))))



(use-package monokai-theme
:ensure t
:config (load-theme 'monokai t))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org-bullets
:ensure t
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(defalias 'list-buffers 'ibuffer-other-window)

(use-package tabbar
  :ensure t
  :config
  (tabbar-mode 1))

(winner-mode 1)

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0))))) ;;Makes the window name more distinguishable
    ))

(use-package counsel
  :ensure t
  :bind ;;Makes the yanking-kill-ring so much cooler!!
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

(use-package company
  :ensure t
  :defer 5
  :config
  (global-company-mode t))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package yasnippet
:ensure t
:init
(yas-global-mode 1))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package try
:ensure t)

(with-eval-after-load 'ox-latex
   (add-to-list 'org-latex-classes
                '("rj_thesis"
                  "\\documentclass{report}"
                  ("\\chapter{%s}" . "\\chapter*{%s}")
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
