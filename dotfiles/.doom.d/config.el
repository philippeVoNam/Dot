;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-gruvbox-light)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; - PERSONAL CONFIG GOES HERE -

;;Exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;; Org-mode configs
(setq org-log-done 'time)

;; Setting Meta key
(setq x-super-keysym 'meta)

;; Projectile search for projects
(setq projectile-project-search-path '("~/Documents/Personal_Projects/"))

;; Avy keybindings
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g SPC") 'avy-goto-char-timer)
(global-set-key (kbd "M-g h") 'avy-goto-word-1)

;;Transparent window
(set-frame-parameter (selected-frame)'alpha '(95 . 95))
(add-to-list 'default-frame-alist'(alpha . (95 . 95)))

;; activate these modes
(company-quickhelp-mode)
(setq company-minimum-prefix-length 1)
;; (setq company-idle-delay 0)
(python-mode)
(require 'highlight-indentation)
(add-hook 'prog-mode-hook 'highlight-indentation-mode)

(defun org-open-link-other-window ()
  "Jump to bookmark in another window. See `bookmark-jump' for more."
  (interactive)
  (let ((org-link-frame-setup (acons 'file 'find-file-other-window org-link-frame-setup)))
    (org-open-at-point)))

(global-set-key (kbd "M-SPC") 'org-open-link-other-window)

;;; Agenda settings
(setq org-agenda-files (list "/home/namv/Documents/Agenda/agenda.org"))
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((agenda "")
          (tags-todo "work")
          (tags-todo "capstone")
          (tags-todo "personal")
          (tags-todo "school")
          (alltodo "")))))

;; Continous scrolling for pdf view
(setq doc-view-continuous t)

;; Default Web Browser
;; set specific browser to open links
(setq browse-url-browser-function 'browse-url-firefox)

(yas-global-mode 1)
