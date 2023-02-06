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

;; PConfig
(load! "~/repos/personal/pdotfiles/pconfig.el")

;; https://github.com/org-roam/org-roam-ui#doom
(use-package! websocket
    :after org-roam)
(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

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

(set-fontset-font t 'symbol "Twitter Color Emoji")

(setq flyspell-mode nil)

(setq treemacs-git-mode 'deferred)
(setq doom-themes-treemacs-theme "doom-colors")

;; Lets you select the search you're typing in case you're hovering over a fuzzy match that you don't want to select
(setq ivy-use-selectable-prompt t)

;; There are some surrounding symbols that are not included in vim, so we can manually add them here
;; e.g. org code blocks (=), and verbatim (~) tags are not included
(defmacro define-and-bind-text-object (key start-regex end-regex inner-name-symbol outer-name-symbol)
  (let ((inner-name (make-symbol inner-name-symbol))
        (outer-name (make-symbol inner-name-symbol)))
    `(progn
       (evil-define-text-object ,inner-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count nil))
       (evil-define-text-object ,outer-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count t))
       (define-key evil-inner-text-objects-map ,key (quote ,inner-name))
       (define-key evil-outer-text-objects-map ,key (quote ,outer-name)))))
(define-and-bind-text-object "=" "=" "=" "ig-evil-inner-equal" "ig-evil-outer-equal")
(define-and-bind-text-object "~" "~" "~" "ig-evil-inner-tilde" "ig-evil-outer-tilde")

(add-hook 'window-setup-hook #'treemacs 'append)
