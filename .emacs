;; Place this file in C:\Users\Username\AppData\Roaming and point to the appropriate files
(setq user-init-file (concat (getenv "EMACS_CFG_DIR") "/.emacs.d/init.el"))
(setq user-emacs-directory (concat (getenv "EMACS_CFG_DIR") "/.emacs.d/"))
(load user-init-file)
