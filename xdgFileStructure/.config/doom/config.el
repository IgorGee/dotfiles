;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Igor Goldvekht"
      user-mail-address "goldvekht.igor@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(global-display-line-numbers-mode 't)

;; Remove any delays when navigating commands via <LEADER> <KEY> <KEY>
(setq which-key-idle-delay 0.1)

;; Disable confirmation when quitting emacs
(setq confirm-kill-emacs nil)

;; Press fd to simulate pressing escape in insert mode
(setq evil-escape-key-sequence "fd")
;; Workaround to allow for multiple escape sequences
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "FD" 'evil-escape)

;; Switching x and d.
(define-key evil-normal-state-map "x" 'evil-delete)
(define-key evil-normal-state-map "X" 'evil-delete-line)

;; org-roam-server
(setq org-roam-server-port 7048)
(require 'org-roam-protocol)
;; This is currently necessary because of this bug: https://github.com/org-roam/org-roam-server/issues/115
(after! org-roam
  (smartparens-global-mode -1)
  (org-roam-server-mode)
  (smartparens-global-mode 1))

(use-package! company
  :config
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 3
        company-dabbrev-code-everywhere t)
  (add-to-list 'company-backends 'company-dabbrev)
  ;; this is from the external package "company-fuzzy". Must be called after 'company-backends are set
  (global-company-fuzzy-mode t))

(defun doom/ediff-init-and-example ()
  "ediff the current `init.el' with the example in doom-emacs-dir"
  (interactive)
  (ediff-files (concat doom-private-dir "init.el")
               (concat doom-emacs-dir "init.example.el")))

(define-key! help-map
  "di"   #'doom/ediff-init-and-example
  )
