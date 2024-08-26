;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Scroll margins
(setq scroll-margin 8)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Gravity"
      user-mail-address "alternativegravitational@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

(setq doom-font (font-spec :family "IosevkaTerm Nerd Font" :size 20)
      doom-variable-pitch-font (font-spec :family "Iosevka Aile" :size 20))
;; doom-variable-pitch-font (font-spec :family "Ubuntu Sans Nerd Font" :size 20))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-rose-pine-dawn)

(setq fancy-splash-image "~/.doom.d/themes/marisa-20.png")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-current-absolute t)
(setq display-line-numbers-type 'visual)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Notes/")

;; Default
(setq org-archive-location (concat org-directory "/.archive/%s_archive::"))

;; Captures
(setq org-default-notes-file (concat org-directory "/refile.org"))

;; RETURN will follow links in org-mode files
(setq org-return-follows-link  t)

;; Hide emphasis markers
(setq org-hide-emphasis-markers t)

;; Schedules
(setq org-agenda-prefix-format
      '((agenda . " %-12:c%?-12t% s")
        (todo . " %i %-12:c")
        (tags . " %i %-12:c")
        (search . " %i %-12:c")))

;; Org-Roam
(setq org-roam-directory (file-truename "~/Notes/wiki"))

;; Org priorities
(setq org-highest-priority ?A)
(setq org-default-priority ?D)
(setq org-lowest-priority ?E)

;; Org when export
(setq org-export-with-section-numbers nil)
(setq org-export-with-toc nil)
(setq org-export-with-date t)
(setq org-latex-packages-alist '(("margin=1.5in" "geometry" nil)(" " "nopageno" t)))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Set the time delay (in seconds) for the which-key popup to appear. A value of
;; zero might cause issues so a non-zero value is recommended.
;;
;; Allow for movement in softwrapped text
;; Nakakatawa ka naman
(after! org-capture
  (add-to-list 'org-capture-templates
               '("s" "School todo" entry (file+headline (concat org-directory "/school_todo.org") "Refile") "* %?\n%U\n%i"))
  (add-to-list 'org-capture-templates
               '("R" "Reminders" entry (file+headline (concat org-directory "/reminders.org") "Refile") "* %?\n%U\n%i"))
  (add-to-list 'org-capture-templates
               '("r" "Refile" entry (file+headline org-default-notes-file "Refile") "* %?\n%U\n%i")))

(after! ispell
  (setq ispell-dictionary "en_US,tl")
  (ispell-hunspell-add-multi-dic "en_US,tl"))

(add-hook 'spell-fu-mode-hook
          (lambda ()
            (spell-fu-dictionary-add (spell-fu-get-ispell-dictionary "en_US"))
            (spell-fu-dictionary-add (spell-fu-get-ispell-dictionary "tl"))))

(after! which-key
  (setq which-key-idle-delay 0.1))

;; Key maps
;; open treemacs with >
(define-key doom-leader-map (kbd ">") 'treemacs)

;; onlyrmove through visual lines
(map! :after evil
      :map evil-motion-state-map
      [remap evil-next-line] #'evil-next-visual-line
      [remap evil-previous-line] #'evil-previous-visual-line)

;; Allow for C-y to accept company selection
(map! :after company
      :map company-active-map
      "RET" #'newline
      "C-y" #'company-complete-selection
      "C-e" #'company-abort)

(map! :leader
      :desc "Mixed Pitch Mode"
      "t p" #'mixed-pitch-mode)

(map! :leader
      :desc "Open plan/schedule"
      "n p" #'(lambda () (interactive) (find-file "~/Notes/assets/Grade11Schedule.jpg")))

(map! :leader
      :desc "Export to pdf"
      "n e" #'org-latex-export-to-pdf)

(after! org-fancy-priorities
  (setq org-fancy-priorities-list '((?A . "⚑")
                                    (?B . "⬆")
                                    (?C . "■")
                                    (?D . "⬇")
                                    (?E . "❄")))
  (setq org-priority-faces '((?A . (:foreground "#b4637a"))
                             (?B . (:foreground "#d7827e"))
                             (?C . (:foreground "#ea9d34"))
                             (?D . (:foreground "#907aa9"))
                             (?E . (:foreground "#56949f")))))

(after! lsp-ltex
  (setq lsp-ltex-version "16.0.0")
  (setq lsp-ltex-additional-rules-enable-picky-rules "true")
  (setq lsp-ltex-language "en")
  (setq lsp-ltex-mother-tongue "tl-PH" ))
(add-hook 'org-mode-local-vars-hook (lambda ()
                                      (require 'lsp-ltex)
                                      (lsp-deferred)))
(add-hook 'markdown-mode-local-vars-hook (lambda ()
                                           (require 'lsp-ltex)
                                           (lsp-deferred)))

;; (after! org-modern
;;   (setq org-modern-label-border 0.3)
;;   (setq org-modern-priority
;;         (quote ((?A . "⚑")
;;                 (?B . "⬆")
;;                 (?C . "■")
;;                 (?D . "⬇")
;;                 (?E . "❄"))))
;;   (setq org-modern-priority-faces
;;         (quote ((?A :background \"red\"
;;                  :foreground \"yellow\"))))

;;   (setq org-modern-priority-faces
;;         (quote((?A :background "#b4637a")
;;                (?B :background "#d7827e")
;;                (?C :background "#ea9d34")
;;                (?D :background "#907aa9")
;;                (?E :background "#56949f"))))
;;   ;; Minimal UI
;;   ;; (package-initialize)
;;   ;; (menu-bar-mode -1)
;;   ;; (tool-bar-mode -1)
;;   ;; (scroll-bar-mode -1)

;;   ;; Choose some fonts
;;   ;; (set-face-attribute 'default nil :family "Iosevka")
;;   ;; (set-face-attribute 'variable-pitch nil :family "Iosevka Aile")
;;   ;; (set-face-attribute 'org-modern-symbol nil :family "Iosevka")

;;   ;; Add frame borders and window dividers
;;   (modify-all-frames-parameters
;;    '((right-divider-width . 40)
;;      (internal-border-width . 40)))
;;   (dolist (face '(window-divider
;;                   window-divider-first-pixel
;;                   window-divider-last-pixel))
;;     (face-spec-reset-face face)
;;     (set-face-foreground face (face-attribute 'default :background)))
;;   (set-face-background 'fringe (face-attribute 'default :background))
;;   (setq
;;    ;; Edit settings
;;    org-auto-align-tags nil
;;    org-tags-column 0
;;    org-catch-invisible-edits 'show-and-error
;;    org-special-ctrl-a/e
;;   (global-org-modern-mode))
