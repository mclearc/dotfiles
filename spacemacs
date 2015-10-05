;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `!distribution'. For now available distributions are `spacemacs-core'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     deft
     emacs-lisp
     ;; eyebrowse
     git
     latex
     markdown
     org
     osx
     pandoc
     (shell :variables
            shell-default-term-shell "/usr/local/bin/zsh"
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'multi-term
            )
     spell-checking
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(lorem-ipsum
                                      sr-speedbar
                                      sublimity
                                      molokai-theme
                                      flatland-theme
                                      soothe-theme
                                      gotham-theme
                                      visual-fill-column
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'random
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects bookmarks)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(darktooth
                         spacemacs-light
                         spacemacs-dark
                         molokai
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Inconsolata LGC for Powerline"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   ;; set escape key to "jk"
   evil-escape-key-sequence "jk"
   )
  ;; User initialization goes here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (add-hook 'text-mode-hook '(lambda() (turn-on-auto-fill) (set-fill-column 80)))
  (add-hook 'org-mode-hook '(lambda() (turn-on-auto-fill) (set-fill-column 80)))
  (add-hook 'markdown-mode-hook '(lambda() (turn-on-auto-fill) (set-fill-column 80)))
  ;;;;MODELINE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq display-time-format "%a %b %d | %H:%M |")
  (display-time-mode)
  )

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  ;;; GENERAL SETTINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Save buffers 
  (setq desktop-mode t)
  ;; Line numbers
  ;(global-linum-mode) ;; show line numbers
  ; Turn on line numbers for hooke osd modes
  (add-hook 'prog-mode-hook 'linum-mode)
  (add-hook 'markdown-mode-hook
            (lambda ()
              (linum-mode)))
  ;; line number spacing  
  (setq linum-format "%4d ")

  ;; Highlight current line number
    (require 'linum)

    (defvar linum-current-line 1 "Current line number.")
    (defvar linum-border-width 1 "Border width for linum.")

    (defface linum-current-line
    `((t :inherit linum
        :foreground "goldenrod"
        :weight bold
        ))
    "Face for displaying the current line number."
    :group 'linum)

    (defadvice linum-update (before advice-linum-update activate)
    "Set the current line."
    (setq linum-current-line (line-number-at-pos)
            ;; It's the same algorithm that linum dynamic. I only had added one
            ;; space in front of the first digit.
            linum-border-width (number-to-string
                                (+ 1 (length
                                    (number-to-string
                                    (count-lines (point-min) (point-max))))))))

    (defun linum-highlight-current-line (line-number)
    "Highlight the current line number using `linum-current-line' face."
    (let ((face (if (= line-number linum-current-line)
                    'linum-current-line
                    'linum)))
        (propertize (format (concat "%" linum-border-width "d") line-number)
                    'face face)))

    (setq linum-format 'linum-highlight-current-line)

  ;; navigate using visual lines rather than true lines
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  ;; control seperators
  ; (setq powerline-default-separator 'arrow)

  ;;; PACKAGE SETTINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; latex config
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  ;; deft settings
  (setq deft-extensions '("org" "md" "txt" "tex"))
  (setq deft-directory "~/Dropbox/Notes")
  (setq deft-recursive t)
  (evil-leader/set-key "od" 'deft)

  ;; pandoc settings
  (add-hook 'markdown-mode-hook 'pandoc-mode)

  ;; Only use spaces
  (setq-default indent-tabs-mode nil)

  ;; Speedbar
  (require 'speedbar)
  (setq speedbar-show-unknown-files t) ; show all files
  (setq speedbar-use-images nil) ; use text for buttons
  (setq speedbar-directory-unshown-regexp "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")
  (speedbar-add-supported-extension ".md")
  (speedbar-add-supported-extension ".mdown")
  (speedbar-add-supported-extension ".markdown")
  (require 'sr-speedbar)
  (evil-leader/set-key "os" 'sr-speedbar-toggle)
  ;; (setq sr-speedbar-max-width 80)
  ;; (setq sr-speedbar-width-console 40)
  ;; (setq sr-speedbar-right-side nil) ; put on left side
  ;; (sr-speedbar-open)
  ;; (with-current-buffer sr-speedbar-buffer-name
  ;;   (setq window-size-fixed 'width))
  ;; (setq sr-speedbar-skip-other-window-p t)

  ;;; TERMINAL SETTINGS
  (add-hook 'term-mode-hook
            (lambda ()
              (define-key term-raw-map (kbd "C-y") 'term-paste)))

  (add-hook 'term-mode-hook
            (lambda ()
              (setq show-trailing-whitespace nil)))
  (add-hook 'term-mode-hook
            (lambda ()
              (setq term-buffer-maximum-size 10000)))
  ;;; KEYBINDINGS ;;;;;;;;;;;;;;;;;;;;;;

  ;; Quick keyboard shortcut for recent files
  (evil-leader/set-key "or" 'recentf-open-files)

  ;;; SUBLIMITY ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (require 'sublimity)
  ;; (require 'sublimity-scroll)
  (require 'sublimity-map)
  (setq sublimity-map-size 20)
  (setq sublimity-map-fraction 0.3)
  (setq sublimity-map-text-scale -7)
  (require 'sublimity-attractive)
  (evil-leader/set-key "oc" 'sublimity-mode)
  (setq sublimity-attractive-centering-width 100)
  (add-hook 'sublimity-map-setup-hook
            (lambda ()
              (setq buffer-face-mode-face '(:family "Monospace"))
              (buffer-face-mode)))

)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doc-view-continuous t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata LGC for Powerline" :foundry "nil" :slant normal :weight normal :height 120 :width normal))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(term ((t (:inherit default)))))
