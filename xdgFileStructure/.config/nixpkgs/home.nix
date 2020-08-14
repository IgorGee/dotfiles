{ config, pkgs, lib, ... }:

with import "/home/igor/dotfiles/variables.nix";
  let
    inherit
      username
      homeDirectory
      nixBinDir
      relativeXDGConfigPath
      df
    ;
    pkgsUnstable = import <nixpkgs-unstable> {};


    vim-cutlass = pkgs.vimUtils.buildVimPlugin {
      name = "vim-cutlass";
      src = builtins.fetchGit {
        url = "https://github.com/svermeulen/vim-cutlass";
        name = "vim-cutlass";
        rev = "7afd649415541634c8ce317fafbc31cd19d57589";
      };
    };

    vim-caser = pkgs.vimUtils.buildVimPlugin {
      name = "vim-caser";
      src = builtins.fetchGit {
        url = "https://github.com/arthurxavierx/vim-caser";
        name = "vim-caser";
        rev = "c66b8e8c2678d5446fed3a11bc02c762244608b5";
      };
    };
in {
  home = {
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    inherit username;
    inherit homeDirectory;


    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "20.09";

    packages = with pkgs; [
      # Editor
      ctags
      vscode

      # CLI
      ripgrep
      ripgrep-all
      stow
      tree
      unzip
      pistol
      gtop
      ctop
      chafa
      neofetch

      # Fonts
      nerdfonts # Note this has an override below
      twitter-color-emoji
      symbola

      # Browser
      brave

      # UI
      dmenu # Adhoc command runner
      # picom # For transparency for st. Currently breaks when opening Brave.
      xcompmgr # Older alternative for transparency for st
      bspwm # Window Manager. There is a service for this, but it doesn't seem to work or allow for
      # restarting of  settings. Thinking about it more, I should let home-manager do what it does
      # best, which is manage packages. For settings, it's probably better for me to manually place
      # those via stow. This lets me use proper DSL for the tool as well.
      sxhkd # Simple X Hotkey Daemon
      polybar # Status bar
      xdg_utils # Automatically open files appropriately in browser, mpv, etc.

      # Misc
      nodejs-14_x
      shellcheck
      docker
      docker-compose
      python3
      jq
      wireguard-tools
    ];
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (self: super: {
        nerdfonts = super.nerdfonts.override {
          fonts = [
            "Meslo"
            "Mononoki"
            "Hack"
          ];
        };
        inherit vim-cutlass;
      })
    ];
  };
  xdg.enable = true;
  fonts.fontconfig.enable = true;
  targets.genericLinux.enable = true;

  services.dunst = {
    enable = true;
  };

  programs = {
    # Let Home Manager install and manage itself.
    feh.enable = true;
    home-manager.enable = true;
    ssh.enable = true;
    bat.enable = true;
    z-lua = {
      enable = true;
      options = ["fzf"];
    };
    fzf.enable = true;
    mpv.enable = true;
    lf = {
      enable = true;
      settings = {
        hidden = true;
        icons = true;
      };
      previewer.source = "${nixBinDir}/pistol";
    };
    newsboat.enable = true;
    htop.enable = true;
    neomutt.enable = true;
    # termite = {
    #   enable = true;
    # };
    tmux = {
      enable = true;
      baseIndex = 1;
      sensibleOnTop = true;
      shortcut = "a";
      escapeTime = 1;
      keyMode = "vi";
      extraConfig = builtins.readFile "${df.tmux}/tmux.conf";
      plugins = with pkgs.tmuxPlugins; [
        resurrect
        continuum
        yank
        gruvbox
      ];
    };
    zathura.enable = true;
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      dotDir = "${relativeXDGConfigPath}/zsh";
      history = {
        path = "${config.xdg.dataHome}/zsh/.zsh_history";
      };
      # shellAliases = import "${df.zsh}/aliases.nix";
      # To get aliases to work in vim shell execution, we need to put them in zshenv
      envExtra =
        "EDITOR=vim\n" +
        builtins.concatStringsSep "\n"
          (lib.mapAttrsToList (k: v: "alias ${k}=${lib.escapeShellArg v}")
            (import "${df.zsh}/aliases.nix"));
      initExtra = builtins.readFile "${df.zsh}/post-compinit.zsh";
      oh-my-zsh = {
        enable = true;
        custom = "${df.zsh}/ohMyZshCustomizations";
        theme = "powerlevel10k/powerlevel10k";
        plugins = [
          "git"
          "sudo"
          "tmux"
          "docker"
          "docker-compose"
          "fzf"
          "ripgrep"
          "extract"
          "zsh-syntax-highlighting"
        ];
      };
      sessionVariables = {
        EDITOR = "vim";
        BROWSER = "brave";

        # Misc XDG Spec Fixes

        # LESS
        LESSHISTFILE="-";

        # Xorg
        # Only respected by xinit, not startx
        XINITRC="${config.xdg.configHome}/X11/xinitrc";
        XAUTHORITY="${config.xdg.cacheHome}/Xauthority";
        ICEAUTHORITY="${config.xdg.cacheHome}/ICEauthority";

        # Z-Lua
        _ZL_DATA = "${config.xdg.dataHome}/zlua/.zlua";

        # GnuPG
        GNUPGNOME="${config.xdg.dataHome}/gnupg";

        # Bash
        HISTFILE="${config.xdg.dataHome}/bash/history";

        # VSCode
        VSCODE_PORTABLE="${config.xdg.dataHome}/vscode";
      };
    };
    neovim = {
      enable = true;
      vimAlias = true;
      extraConfig = builtins.readFile "${df.vim}/extraConfig.vim";
      plugins = with pkgs.vimPlugins; [
        # Languages
        vim-polyglot

        # Code Completion
        coc-nvim
        coc-pairs
        coc-snippets
        coc-json
        coc-fzf
        coc-highlight
        vim-snippets
        ultisnips

        # UI
        vim-gitgutter
        vim-airline
        awesome-vim-colorschemes
        rainbow
        vim-startify
        colorizer # Replace with vim-hexokinase

        # Editor Features
        vim-surround # cs.,
        vim-repeat # cd.,...
        vim-commentary # gcj OR dcap
        vim-easy-align # vipga
        vim-eunuch # :Rename foo.js, :SudoWrite
        vim-sneak # vim motions
        vim-visualstar # search with * and # using the entire visual selection, not just word
        vim-easymotion # faster file navigation
        is-vim # better find/search experience in regards to highlighting
        vim-asterisk # better * functionality
        quick-scope # Helps target fF and tT markers
        vim-cutlass # Convert D to a strict deletion, without adding to clipboard. I use X for Cut.
        vim-caser # Case conversion
        ale # syntax checker for languages not covered by coc
        vim-lastplace # opens the file in the last place you were positioned

        # Buffer / Pane / File Management
        fzf-vim # File Search
        # coc-explorer # File Manager
        nerdtree
        vim-fugitive # Gblame
        vimagit # Magit

        # Ctags
        vim-gutentags

        # Should be in UI but it requested to be the last one
        vim-devicons
      ];
    };
    git = {
      enable = true;
      userName = "Igor Goldvekht";
      userEmail = "goldvekht.igor@gmail.com";

      ignores = [
        "/tags"
      ];
    };
  };
}
