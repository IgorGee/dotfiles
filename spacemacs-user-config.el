;;; spacemacs-user-config.el

;; as soon as I open gchi, do insert mode
(add-hook 'haskell-interactive-mode-hook (lambda () (evil-append-line 1)))

;; kill scratch
;; This will break SPC SPC
;; (kill-buffer "*scratch*")

;; https://github.com/syl20bnr/spacemacs/issues/13100
(setq helm-completion-style 'emacs)
(setq completion-styles '(helm-flex))

;; Disable confirmation questions when killing buffers
(setq confirm-kill-processes nil)
;; Disable confirmation of killing buffers that have processes running inside them
(setq kill-buffer-query-functions nil)
;; Disable prompt to follow symlinks that are git controlled. Who cares, just go into the file ffs.
(setq vc-follow-symlinks t)

(defun find-user-config-dotfile()
  (interactive)
  (find-file "~/.spacemacs-user-config.el"))

(spacemacs/set-leader-keys "feu" 'find-user-config-dotfile)
