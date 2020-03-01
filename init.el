(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp))
  (load bootstrap-file nil 'nomessage)))

;; Vim Key Bindings
(use-package evil
  :config
  (evil-mode 1))

;; Haskell IDE
(use-package haskell-mode
  :hook ((haskell-mode . interactive-haskell-mode)))
  ; (add-hook 'haskell-mode-hook 'haskell-indent-mode)
  ; (add-hook 'haskell-mode-hook 'haskell-doc-mode)
  ; (add-hook 'haskell-mode-hook 'hindent-mode))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-haskell
 :config
 (setq interactive-haskell-mode 1
       lsp-haskell-process-path-hie "ghcide"
       lsp-haskell-process-args-hie '())
  ;; Comment/uncomment this line to see interactions between lsp client/server.
 ;; (setq lsp-log-io t)
 )

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '(haskell-mode . ("ghcide" "--lsp"))))

(use-package flycheck
  :hook
  (haskell-mode . flycheck-mode))
(use-package flycheck-haskell
  :commands flycheck-haskell-setup)

; (use-package dante
;   :after haskell-mode
;   :commands 'dante-mode
;   :init
;   (add-hook 'haskell-mode-hook 'flycheck-mode)
;   (add-hook 'haskell-mode-hook 'dante-mode))

;; Relative Line Numbers
(use-package nlinum-relative
  :config
  ;; something else you want
  (nlinum-relative-setup-evil)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode))

;; Things I cherry picked from this guy: https://github.com/patrickt/emacs/blob/master/init.el
(use-package all-the-icons)

(use-package doom-themes
  :config
  (let ((chosen-theme 'doom-challenger-deep))
  (load-theme chosen-theme t)))

(use-package centaur-tabs
  :after all-the-icons
  :demand
  :config
  (centaur-tabs-mode t)
  :custom
  (centaur-tabs-buffer-groups-function 'centaur-tabs-projectile-buffer-groups)
  (centaur-tabs-gray-out-icons 'buffer)
  (centaur-tabs-style "rounded")
  (centaur-tabs-height 36)
  (centaur-tabs-set-icons t)
  (centaur-tabs-set-modified-marker t)
  (centaur-tabs-modified-marker "●"))

;; Company is the best Emacs completion system.
(use-package company
  :bind (("C-." . company-complete))
  :diminish company-mode
  :hook ((prog-mode . company-mode))
  :custom
  (company-dabbrev-downcase nil "Don't downcase returned candidates.")
  (company-show-numbers t "Numbers are helpful.")
  (company-tooltip-limit 20 "The more the merrier.")
  (company-idle-delay 0.1 "Faster!")
  :config
  ;; use numbers 0-9 to select company completion candidates
  (let ((map company-active-map))
    (mapc (lambda (x) (define-key map (format "%d" x)
                        `(lambda () (interactive) (company-complete-number ,x))))
          (number-sequence 0 9))))

;; Magit is one of the best pieces of OSS I have ever used. It is truly esssential.

(use-package magit
  :bind (("C-c g" . magit-status))

  ;; :diminish magit-auto-revert-mode
  ;; :diminish auto-revert-mode
  :custom
  (magit-remote-set-if-missing t)
  (magit-diff-refine-hunk t)
  (magit-branch-prefer-remote-upstream)
  :config
  (magit-auto-revert-mode t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package yasnippet
  :config
  (yas-global-mode 1)
  (setq yas-prompt-functions '(yas-completing-prompt))
  :diminish yas-minor-mode)

(use-package haskell-snippets
  :defer yasnippet)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; End of cherry picking

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(evil-set-initial-state 'haskell-interactive-mode 'emacs)
