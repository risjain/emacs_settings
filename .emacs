;; Place this file in C:\Users\Username\AppData\Roaming and point to the appropriate files
(setq user-init-file (concat (getenv "EMACS_CFG_DIR") "/.emacs.d/init.el"))
(setq user-emacs-directory (concat (getenv "EMACS_CFG_DIR") "/.emacs.d/"))
(load user-init-file)

;; Loading the compiled org-mode correctly for the emacs installation
(add-to-list 'load-path (concat (getenv "EMACS_SRC_DIR") "/org-mode/lisp"))
(add-to-list 'load-path (concat (getenv "EMACS_SRC_DIR") "/org-mode/contrib/lisp" t))
