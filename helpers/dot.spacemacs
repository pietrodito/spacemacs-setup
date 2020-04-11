;; i-*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------


     ;; -------- Languages
     ess
     emacs-lisp
     html
     latex
     markdown
     python
     julia
     javascript
     sql
     go

     ;; Others
     systemd
     csv

     ;; Applications
     org
     gnus
     fasd

     (spell-checking :variables spell-checking-enable-by-default nil)

     ;; Project management
     git
     (treemacs :variables
               treemacs-use-follow-mode t
               treemacs-use-filewatch-mode t)

     ;; ------- Tools
     ;; helm
     (helm :variables
           helm-position 'bottom
           helm-no-header t)
     pdf
     (shell :variables
            shell-default-term-shell "/bin/zsh"
            shell-default-height 30
            shell-default-position 'bottom)

     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      )

     syntax-checking
     ;; spacemacs-purpose

     ;; -------
     theming

     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      polymode
                                      poly-R
                                      poly-noweb
                                      poly-markdown
                                      evil-smartparens
                                      org-noter)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper t

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 100

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 11.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "TODO"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names t

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols nil

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'visual

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil
   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  (setq undo-tree-auto-save-history t)
  (setq vc-follow-symlinks t) ;; To edit .spacemacs without to be prompted each time
  (setq paradox-github-token "f3b34c73d58490f6a8dae190a8e3797b6546dd4a")
  (ulys/conf/general)
  (ulys/conf/kbd)
  (ulys/conf/dired)
  (ulys/config/org)
  (ulys/conf/org-noter)
  (ulys/conf/doc-view)
  (ulys/config/ess)
  (ulys/conf/mail)
  )


;; doc-view config
(defun ulys/conf/doc-view ())

;; dired config (hide .~undo-tree~ files)
(defun ulys/conf/dired ()
  ;; Auto-refresh dired on file change
  (add-hook 'dired-mode-hook 'auto-revert-mode)

  (spacemacs/set-leader-keys "ad" 'ulys/dired-open-current-dir)

  (setq dired-omit-verbose nil)
  (add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))
  (ulys/conf/dired/kbd/C-hjkl))
(defun ulys/dired-open-current-dir ()
  (interactive)
  (spacemacs/dired "."))


(defun ulys/conf/dired/kbd/C-hjkl ()
  (evil-define-key '(normal) dired-mode-map  (kbd "C-h") 'dired-up-directory)
  (evil-define-key '(normal) dired-mode-map  (kbd "C-j") 'evil-next-line)
  (evil-define-key '(normal) dired-mode-map  (kbd "C-k") 'evil-previous-line)
  (evil-define-key '(normal) dired-mode-map  (kbd "C-l") 'dired-find-alternate-file))

;; org-noter config
(defun ulys/conf/org-noter ()
  (use-package org-noter
    :config
    (setq org-noter-always-create-frame nil
          org-noter-insert-note-no-questions t
          org-noter-separate-notes-from-heading t
          org-noter-auto-save-last-location t)

    (defun org-noter-init-pdf-view ()
      ;; (run-at-time "0.5 sec" nil #'org-noter)
      (pdf-view-fit-page-to-window)
      (pdf-view-auto-slice-minor-mode))
    (add-hook 'pdf-view-mode-hook 'org-noter-init-pdf-view)))

;; General config (time, fullscreen...)
(defun ulys/conf/general ()

  (setq hybrid-style-enable-hjkl-bindings t)
  (spacemacs/toggle-centered-point-globally-on)

  ;; Count windows from one inside each frame
  ;; (setq winum-scope 'frame-local)

  ;; add time in powerline
  (display-time-mode 1)

  ;; New frame will open fullscreen
  (add-to-list 'default-frame-alist '(fullscreen . fullboth))
  )

;; Keyboard config
(defun ulys/conf/kbd ()
  (ulys/conf/smartparens)
  (ulys/conf/toggle-shell)

  ;; C-h to delete buffer and C-S-h for help
  (global-set-key (kbd "C-h") 'spacemacs/kill-this-buffer)

  ;; Simulates vim increment and decrement number
  (define-key evil-normal-state-map  (kbd "C-a C-a") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map  (kbd "C-x C-x") 'evil-numbers/dec-at-pt)

  ;; F5 to execute lnh <=> ln -s `pwd` ~/0_Quick-Link/
  (global-set-key (kbd "<f5>") (lambda () (interactive) (shell-command "lnh")))

  (define-key evil-visual-state-map (kbd "M-v") 'ulys/region-to-process)
  (global-set-key (kbd "<f3>") 'ulys/current-line-to-process)
  (global-set-key (kbd "<f4>") 'ulys/toggle-shell)
  (global-set-key (kbd "S-<f4>") 'ulys/force-toggle-shell)
  )
(defun ulys/conf/smartparens ()
  (use-package smartparens
    :defer t
    :diminish ""
    :bind (("C-)" . sp-forward-slurp-sexp)
           ("C-}" . sp-forward-barf-sexp)
           ("C-(" . sp-splice-sexp))
    :config
    (progn
      (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
      (push 'yas-installed-snippets-dir yas-snippet-dirs))))
(defun ulys/region-to-process (arg beg end)
  "Send the current region to a process buffer.
The first time it's called, will prompt for the buffer to send
to. Subsequent calls send to the same buffer, unless a prefix
argument is used (C-u), or the buffer no longer has an active
process."
  (interactive "P\nr")
  (unless (evil-visual-state-p) (error "Not in visual mode..."))
  (if (or arg ;; user asks for selection
          (not (boundp 'region-to-process-target)) ;; target not set
          ;; or target is not set to an active process:
          (not (process-live-p (get-buffer-process
                                region-to-process-target))))
      (setq region-to-process-target
            (completing-read
             "Process: "
             (seq-map (lambda (el) (buffer-name (process-buffer el)))
                      (process-list)))))
  (process-send-string region-to-process-target (concat (buffer-substring-no-properties beg end) "\n"))
  (evil-exit-visual-state))
(defun ulys/current-line-to-process (arg)
  "Send the current line to a process buffer.
The first time it's called, will prompt for the buffer to send
to. Subsequent calls send to the same buffer, unless a prefix
argument is used (C-u), or the buffer no longer has an active
process."
  (interactive "P")
  (if (or arg ;; user asks for selection
          (not (boundp 'region-to-process-target)) ;; target not set
          ;; or target is not set to an active process:
          (not (process-live-p (get-buffer-process
                                region-to-process-target))))
      (setq region-to-process-target
            (completing-read
             "Process: "
             (seq-map (lambda (el) (buffer-name (process-buffer el)))
                      (process-list)))))
  ;; Need to check if current line is ended with newline
    (setq line-at-point (thing-at-point 'line))
    (setq string-to-send
          (if (string-suffix-p "\n" line-at-point)
              line-at-point
              (concat line-at-point "\n")))
    (process-send-string region-to-process-target string-to-send)
    (evil-next-line))
(defun ulys/open-ansi-term ()
  (interactive)
  (spacemacs/default-pop-shell)
  (setq region-to-process-target (current-buffer)))
(defun ulys/open-ansi-term-and-back ()
    (interactive)
    (ulys/open-ansi-term)
    (other-window -1))
(defun ulys/close-shell ()
  (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
  (kill-buffer region-to-process-target)
  (add-to-list 'kill-buffer-query-functions 'process-kill-buffer-query-function)
  )
(defun ulys/conf/toggle-shell ()
  (setq ulys/toggle-shell-on nil))
(defun ulys/toggle-shell ()
  (interactive)
  (if ulys/toggle-shell-on
      (ulys/close-shell)
    (ulys/open-ansi-term-and-back))
  (setq ulys/toggle-shell-on (not ulys/toggle-shell-on)))
(defun ulys/force-toggle-shell ()
  (interactive)
  (setq ulys/toggle-shell-on t)
  (ulys/open-ansi-term))

;; Mail setup
;; TODO Try harder to make this work see http://cachestocaches.com/series/emacs-productivity/
(defun ulys/conf/mail ()
    ;; Get email, and store in nnml
  (setq gnus-secondary-select-methods
        '(
          (nnimap "gmail"
                  (nnimap-address
                   "imap.gmail.com")
                  (nnimap-server-port 993)
                  (nnimap-stream ssl))
          ))

  ;; Send email via Gmail:
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-default-smtp-server "smtp.gmail.com")

  ;; Archive outgoing email in Sent folder on imap.gmail.com:
  (setq gnus-message-archive-method '(nnimap "imap.gmail.com")
        gnus-message-archive-group "[Gmail]/Sent Mail")

  ;; set return email address based on incoming email address
  (setq gnus-posting-stylesg-styles
        '(((header "to" "address@outlook.com")
           (address "address@outlook.com"))
          ((header "to" "address@gmail.com")
           (address "address@gmail.com"))))

  ;; store email in ~/gmail directory
  (setq nnml-directory "~/gmail")
  (setq message-directory "~/gmail")


  )

;; ESS config
(defun ulys/config/ess ()
  (ulys/conf/ess-devtools-save-silentely)
  (add-hook 'ess-mode-hook
            (lambda ()
              (define-key ess-mode-map (kbd ";") 'ess-insert-assign)
              (define-key ess-mode-map (kbd "C-;") 'ulys/conf/ess-insert-magrittr-pipe)
              (define-key ess-mode-map (kbd "C-:")
                'ulys/conf/ess-insert-right-assign-operator)
              (define-key ess-mode-map (kbd "C-x C-j")
                'ess-eval-line-invisibly-and-step)
              (define-key ess-mode-map (kbd "C-`") 'ulys/conf/ess-backquote-from-dollar)
              (define-key ess-mode-map (kbd "C-~") 'ulys/conf/ess-backquote-delete-df$)
              )))
(defun ulys/conf/ess-insert-magrittr-pipe ()
  "Insert magrittr pipe at i.e. \"%>%\"."
  (interactive)
  (insert "\n  %>% "))
(defun ulys/conf/ess-insert-right-assign-operator ()
  "Insert  \"->\"."
  (interactive)
  (insert " -> "))
(defun ulys/conf/ess-devtools-save-silentely ()
  (setq ess-save-silently t))
(defun ulys/conf/ess-backquote-from-dollar ()
  "Surround with backquotes form last $ till point."
  (interactive)
  (insert "`")
  (setq initial-position (point))
  (evil-find-char-to-backward 1 (string-to-char "$"))
  (insert "`")
  (goto-char (+ 1 initial-position)))
(defun ulys/conf/ess-backquote-delete-df$ ()
  (interactive)
  (ulys/conf/ess-backquote-from-dollar)
  (evil-find-char-to-backward 1 (string-to-char "$"))
  (setq dollar-position (point))
  (evil-backward-WORD-begin)
  (evil-sp-delete (point) dollar-position)
  (evil-find-char 1 (string-to-char "`"))
  (evil-forward-char)
  )

;; Org config
(defun ulys/config/org ()
  (setq org-src-window-setup 'current-window)
  (setq org-list-allow-alphabetical t)
  (setq org-hide-emphasis-markers t)
  (ulys/config/org-tempo)
  (ulys/config/org-babel)
  (ulys/config/org-calendar)
  (ulys/config/org-minted)
  (ulys/config/org-odt-export-latexml)
  (ulys/config/org-capture)
  (ulys/config/org-file-apps))
(defun ulys/org-insert-csv-as-table (filename)
  "Insert a csv file into the current buffer at point, and convert it to an org table."
  (interactive (list (ido-read-file-name "csv file: ")))
  (let* ((start (point))
         (end (+ start (nth 1 (insert-file-contents filename)))))
    (org-table-convert-region start end)))
(defun ulys/config/org-capture ()
  (setq org-default-notes-file "~/Nextcloud/org/tasks.org" )
  (setq org-capture-templates
        '(("t" "Thesis-related Task" entry
            (file "~/Nextcloud/org/thesis.org")
            "** TODO %?" :empty-lines 1)
          ("u" "Teaching-related Task" entry
           (file "~/Nextcloud/org/teaching.org")
           "** TODO %?" :empty-lines 1)
          ("h" "Hospital-related Task" entry
           (file "~/Nextcloud/org/hospital.org")
           "** TODO %?" :empty-lines 1))))
(defun ulys/config/org-file-apps ()
  (defun ulys/org-pdf-app (file-path link-without-schema)
    "Open pdf file using pdf-tools and go to the specified page."
    (let* ((page (if (not (string-match "\\.pdf::\\([0-9]+\\)\\'"
                                        link-without-schema))
                     1
                   (string-to-number (match-string 1 link-without-schema)))))
      (find-file-other-window file-path)
      (pdf-view-goto-page page)))
  (setq org-file-apps
        '((auto-mode . emacs)
          ("\\.x?html?\\'" . "firefox %s")
          ("\\.pdf\\(::[0-9]+\\)?\\'" . whatacold/org-pdf-app)
          ("\\.gif\\'" . "eog \"%s\"")
          ("\\.mp4\\'" . "vlc \"%s\"")
          ("\\.mkv" . "vlc \"%s\""))))
(defun ulys/config/org-calendar ()
  (setq calendar-week-start-day 1))
(defun ulys/config/org-babel ()
  ;; In org mode R will be loaded and code executed without prompt
  (custom-set-variables
   '(org-babel-load-languages (quote ((emacs-lisp . t)
                                      (R          . t)
                                      (latex      . t)
                                      (shell      . t)
                                      (ditaa      . t)
                                      (python     . t)
                                      (sql        . t))))
   '(org-confirm-babel-evaluate nil)))
(defun ulys/org//capture-helper-capture-with-yank-method (method arg)

  ;; helper 1/2
  (defun wrap-into-results-example (capture)
    (concat
     "#+RESULTS:\n"
     "#+ATTR_LATEX: :options frame=lines\n"
     "#+BEGIN_SRC R :eval no :tangle no\n"
     capture
     "\n#+END_SRC\n"))

  ;; helper 2/2
  (defun choose-process (arg)
    (if (or arg ;; user asks for selection
            (not (boundp 'R-process-target)) ;; target not set
            ;; or target is not set to an active process:
            (not (process-live-p (get-buffer-process
                                  R-process-target))))
        (setq R-process-target
              (completing-read
               "Choose R process: "
               (seq-map (lambda (el) (buffer-name (process-buffer el)))
                        (process-list))))))

  ;; main
  (choose-process arg)
  (insert (wrap-into-results-example
           (funcall method R-process-target))))
(defun ulys/org/tibble-capture (arg)
  "Let the user choose a R process, then kill last tibble output
in the process and insert it in current buffer in a org
#+RESULTS: format."
  (interactive "P")

  ;; helper 1/3
  (defun extract-nrows-from-tibble-first-line (line)
    "Extract the number N in the pattern: # A tibble N x M"
    (let* (( line-without-commas (replace-regexp-in-string "," "" line))
           ( x-position    (string-match " x" line-without-commas))
           ( nrow-start-at (length "# A tibble ")))
      (string-to-number
       (substring line-without-commas nrow-start-at x-position))))


  ;; helper 3/3
  (defun yank-last-tibble-from-buffer (buffer)
    (interactive)

    (save-current-buffer
      (set-buffer buffer)
      (search-backward "tibble")
      (beginning-of-line)
      (let* ((tibble-beg (point))
             (nrow (extract-nrows-from-tibble-first-line (thing-at-point 'line t)))
             (tibble-end (progn
                           (message "nrow: %d" nrow)
                           (re-search-forward (concat "^" (number-to-string (min 10 nrow))))
                           (while (search-forward "#"  nil t))   ;; t means no error
                           (end-of-line)
                           (point))))
        (buffer-substring tibble-beg tibble-end))))

  ;; main
  (ulys/org//capture-helper-capture-with-yank-method 'yank-last-tibble-from-buffer arg))
(defun ulys/org/glimpse-capture (arg)
  "Let the user choose a R process, then kill last glimpse output
in the process and insert it in current buffer in a org
#+RESULTS: format."
  (interactive "P")

  ;; helper 1
  (defun extract-nb-vars-from-glimpse-second-line (line)
    "Extract the number N in the pattern: Variables: N"
    (let (( nb-vars-start-at (length "Varialbes: "))
          ( nb-vars-end-at   (length line)))
      (string-to-number
       (substring line nb-vars-start-at nb-vars-end-at))))

  ;; helper 2
  (defun suppress_$_in_front_of_lines (lines)
    (replace-regexp-in-string "^\$ "  "" lines))

  ;; helper 3
  (defun yank-last-glimpse-from-buffer (buffer)
    (interactive)

    (save-current-buffer
      (set-buffer buffer)
      (search-backward "Observations: ")
      (beginning-of-line)
      (let* ((glimpse-beg (point))
             (nrow (progn
                     (forward-line)
                     (extract-nb-vars-from-glimpse-second-line
                      (thing-at-point 'line t))))
             (glimpse-end (progn
                           (forward-line nrow)
                           (end-of-line)
                           (point))))
        (suppress_$_in_front_of_lines
         (buffer-substring glimpse-beg glimpse-end) ))))

  ;; main
  (ulys/org//capture-helper-capture-with-yank-method 'yank-last-glimpse-from-buffer arg))
(defun ulys/config/org-tempo ()
  ;; In org mode : auto complete #+begin #+end
  (require 'org-tempo))
(defun ulys/config/org-minted ()
  (setq org-latex-listings 'minted
        org-latex-packages-alist '(("" "minted"))
        org-latex-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")))
(defun ulys/config/org-odt-export-latexml ()
  (setq org-latex-to-mathml-convert-command"latexmlmath \"%i\" --presentationmathml=%o"))


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(evil-want-fine-undo t)
 '(org-agenda-files
   (quote
    ("~/Nextcloud/These-de-sciences/Biblioraphy/Kaplan-Meyer-1958.org" "~/Comp/R/ess-tests.org" "~/Comp/Org/draft.org")))
 '(org-babel-load-languages (quote ((emacs-lisp . t) (R . t))))
 '(org-confirm-babel-evaluate nil)
 '(package-selected-packages
   (quote
    (tern nodejs-repl livid-mode skewer-mode js2-refactor multiple-cursors js2-mode js-doc import-js grizzl helm-gtags ggtags dap-mode lsp-treemacs bui counsel-gtags counsel swiper ivy add-node-modules-path xterm-color ws-butler winum which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit systemd spaceline powerline smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs ranger rainbow-delimiters pug-mode popwin persp-mode pcre2el paradox spinner orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit transient git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu ess-smart-equals ess-R-data-view ctable ess julia-mode eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump f s diminish define-word csv-mode company-web web-completion-data dash company-statistics company-auctex company column-enforce-mode clean-aindent-mode bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed auctex-latexmk auctex aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(xterm-color ws-butler winum which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit systemd spaceline powerline smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs ranger rainbow-delimiters pug-mode popwin persp-mode pcre2el paradox spinner orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit transient git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu ess-smart-equals ess-R-data-view ctable ess julia-mode eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump f s diminish define-word csv-mode company-web web-completion-data dash company-statistics company-auctex company column-enforce-mode clean-aindent-mode bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed auctex-latexmk auctex aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
