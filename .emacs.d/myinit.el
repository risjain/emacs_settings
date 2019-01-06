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

(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(defalias 'list-buffers 'ibuffer-other-window)

(use-package tabbar
  :ensure t
  :config
  (tabbar-mode 1))

(winner-mode 1)

(use-package yasnippet
:ensure t
:init
(yas-global-mode 1))

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

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package smartparens
 :ensure t
 :config

 (setq sp-show-pair-from-inside nil)
 (require 'smartparens-config)
 (smartparens-global-mode t)
 (show-smartparens-global-mode t)

 ;; keybinding management
 (define-key smartparens-mode-map (kbd "C-M-f") 'sp-forward-sexp)
 (define-key smartparens-mode-map (kbd "C-M-b") 'sp-backward-sexp)

 (define-key smartparens-mode-map (kbd "C-M-d") 'sp-down-sexp)
 (define-key smartparens-mode-map (kbd "C-M-a") 'sp-backward-down-sexp)
 (define-key smartparens-mode-map (kbd "C-S-d") 'sp-beginning-of-sexp)
 (define-key smartparens-mode-map (kbd "C-S-a") 'sp-end-of-sexp)

 (define-key smartparens-mode-map (kbd "C-M-e") 'sp-up-sexp)
 (define-key smartparens-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
 (define-key smartparens-mode-map (kbd "C-M-t") 'sp-transpose-sexp)

 (define-key smartparens-mode-map (kbd "C-M-n") 'sp-forward-hybrid-sexp)
 (define-key smartparens-mode-map (kbd "C-M-p") 'sp-backward-hybrid-sexp)

 (define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
 (define-key smartparens-mode-map (kbd "C-M-w") 'sp-copy-sexp)

 (define-key smartparens-mode-map (kbd "M-<delete>") 'sp-unwrap-sexp)
 (define-key smartparens-mode-map (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

 (define-key smartparens-mode-map (kbd "C-S-<right>") 'sp-forward-slurp-sexp)
 (define-key smartparens-mode-map (kbd "C-S-<left>") 'sp-forward-barf-sexp)
 (define-key smartparens-mode-map (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
 (define-key smartparens-mode-map (kbd "C-M-<right>") 'sp-backward-barf-sexp)

 (define-key smartparens-mode-map (kbd "M-D") 'sp-splice-sexp)
 (define-key smartparens-mode-map (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
 (define-key smartparens-mode-map (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
 (define-key smartparens-mode-map (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)

 (define-key smartparens-mode-map (kbd "C-]") 'sp-select-next-thing-exchange)
 (define-key smartparens-mode-map (kbd "C-<left_bracket>") 'sp-select-previous-thing)
 (define-key smartparens-mode-map (kbd "C-M-]") 'sp-select-next-thing)

 (define-key smartparens-mode-map (kbd "M-F") 'sp-forward-symbol)
 (define-key smartparens-mode-map (kbd "M-B") 'sp-backward-symbol)

 (define-key smartparens-mode-map (kbd "C-i") 'sp-change-inner)
 (define-key smartparens-mode-map (kbd "M-i") 'sp-change-enclosing)

 (bind-key "C-c f" (lambda () (interactive) (sp-beginning-of-sexp 2)) smartparens-mode-map)
 (bind-key "C-c b" (lambda () (interactive) (sp-beginning-of-sexp -2)) smartparens-mode-map)


 :diminish smartparens-mode)

(custom-set-variables
 '(org-directory (concat (getenv "DROPBOX_DIR") "/orgfiles"))
 '(org-default-notes-file (concat org-directory "/worklog.org"))
 '(org-export-html-postamble nil)
 '(org-startup-indented-t)
)

(global-set-key (kbd "\C-c c") 'org-capture)

(custom-set-variables
 '(org-directory (concat (getenv "DROPBOX_DIR") "/orgfiles"))
 '(org-default-notes-file (concat org-directory "/worklog.org"))
)
(setq org-capture-templates
 '(("a" "Appointment" entry (file+datetree org-default-notes-file "Appointments")
 "* TODO %?\n:PROPERTIES:\n\n:END:\nDEADLINE: %^T \n %i\n")
 ("q" "Note" entry (file+headline org-default-notes-file "Notes")
 "* Note %?\n%T")
 ("l" "Link" entry (file+headline org-default-notes-file "Links")
 "* %? %^L %^g \n%T" :prepend t)
 ("b" "Blog idea" entry (file+headline org-default-notes-file "Blog Topics:")
 "* %?\n%T" :prepend t)
 ("t" "To Do Item" entry (file+headline org-default-notes-file "To Do Items")
 "* %?\n%T" :prepend t)
 ("h" "Eaton HIP" entry (file+headline org-default-notes-file "Eaton HIP")
 "* %?\n%T" :prepend t)
 ("e" "Electrolyzer PHIL" entry (file+headline org-default-notes-file "Electrolyzer PHIL")
 "* %?\n%T" :prepend t)
 ("o" "OptGrid" entry (file+headline org-default-notes-file "OptGrid")
 "* %?\n%T" :prepend t)
 ("n" "NMG" entry (file+headline org-default-notes-file "NMG")
 "* %?\n%T" :prepend t)
 ("m" "East Campus Modeling" entry (file+headline org-default-notes-file "East Campus Modeling")
 "* %?\n%T" :prepend t)
 ("j" "Journal" entry (file+datetree org-default-notes-file)
 "* %?\nEntered on %U\n  %i\n  %a")
 ("s" "Screencast" entry (file org-default-notes-file
 "* %?\n%i\n"))))

(global-set-key (kbd "\C-c a") 'org-agenda)

(setq org-agenda-files (list (concat org-directory "/calendar.org")))

(use-package org-bullets
:ensure t
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-ref
  :ensure t
  :after org
  :init
  (setq reftex-default-bibliography '((concat (getenv "DROPBOX_DIR") "/Research/references.bib")))
  (setq org-ref-bibliography-notes (concat (getenv "DROPBOX_DIR") "/Research/notes/worklog.org")
        org-ref-default-bibliography '((concat (getenv "DROPBOX_DIR") "/Research/references.bib"))
        org-ref-pdf-directory (concat (getenv "DROPBOX_DIR") "/papers/"))

  (setq helm-bibtex-bibliography (concat (getenv "DROPBOX_DIR") "/Research/references.bib"))
  (setq helm-bibtex-library-path (concat (getenv "DROPBOX_DIR") "/papers/"))

  (setq helm-bibtex-pdf-open-function
        (lambda (fpath)
          (start-process "open" "*open*" "open" fpath)))

  (setq helm-bibtex-notes-path (concat (getenv "DROPBOX_DIR") "/Research/notes/worklog.org"))
  :config
  (key-chord-define-global "uu" 'org-ref-cite-hydra/body)
  ;; variables that control bibtex key format for auto-generation
  ;; I want firstauthor-year-title-words
  ;; this usually makes a legitimate filename to store pdfs under.
  (setq bibtex-autokey-year-length 4
        bibtex-autokey-name-year-separator "-"
        bibtex-autokey-year-title-separator "-"
        bibtex-autokey-titleword-separator "-"
        bibtex-autokey-titlewords 2
        bibtex-autokey-titlewords-stretch 1
        bibtex-autokey-titleword-length 5))

(use-package org-ref

:config
(require 'org-ref)
(key-chord-define-global "uu" 'org-ref-cite-hydra/body)
;; variables that control bibtex key format for auto-generation
;; I want firstauthor-year-title-words
;; this usually makes a legitimate filename to store pdfs under.
(setq bibtex-autokey-year-length 4
     bibtex-autokey-name-year-separator "-"
     bibtex-autokey-year-title-separator "-"
     bibtex-autokey-titleword-separator "-"
     bibtex-autokey-titlewords 2
     bibtex-autokey-titlewords-stretch 1
     bibtex-autokey-titleword-length 5))

(with-eval-after-load 'ox-latex
   (add-to-list 'org-latex-classes
                '("rj_thesis"
                  "\\documentclass{report}"
                  ("\\chapter{%s}" . "\\chapter*{%s}")
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

(use-package hl-sentence
:ensure t
:config
(require 'hl-sentence)
(add-hook 'org-mode-hook 'hl-sentence-mode 1)

;; Configuring the appearance of the highlighted sentence
(set-face-attribute 'hl-sentence nil
                    :background "#555555"))
