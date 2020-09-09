{pkgs}:
{
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

  fern = pkgs.vimUtils.buildVimPlugin {
    name = "fern";
    src = builtins.fetchGit {
      url = "https://github.com/lambdalisue/fern.vim";
      name = "fern";
      rev = "d3d9412d641590036e12d4d803ef922acd026c6a";
    };
    # src = /home/igor/repos/contribute/fern.vim;
  };

  fern-git-status = pkgs.vimUtils.buildVimPlugin {
    name = "fern-git-status";
    src = builtins.fetchGit {
      url = "https://github.com/lambdalisue/fern-git-status.vim";
      name = "fern-git-status";
      rev = "db931a581009cd76bf548b32df9a117acc507dc7";
    };
  };

  fern-mapping-git = pkgs.vimUtils.buildVimPlugin {
    name = "fern-mapping-git";
    src = builtins.fetchGit {
      url = "https://github.com/lambdalisue/fern-mapping-git.vim";
      name = "fern-mapping-git";
      rev = "b010b69905b79c6f67051bcc6db9acbdf81773eb";
    };
  };

  nerdfont = pkgs.vimUtils.buildVimPlugin {
    name = "nerdfont";
    src = builtins.fetchGit {
      url = "https://github.com/lambdalisue/nerdfont.vim";
      name = "nerdfont";
      rev = "ebc32d87a086b66d86e7cc52b73c1de8f413678a";
    };
  };

  fern-renderer-nerdfont = pkgs.vimUtils.buildVimPlugin {
    name = "fern-renderer-nerdfont";
    src = builtins.fetchGit {
      url = "https://github.com/lambdalisue/fern-renderer-nerdfont.vim";
      name = "fern-renderer-nerdfont";
      rev = "cc1fb9fe741665056eabf5fb9487dc0ede0955ac";
    };
  };

  fern-mapping-project-top = pkgs.vimUtils.buildVimPlugin {
    name = "fern-mapping-project-top";
    src = builtins.fetchGit {
      url = "https://github.com/lambdalisue/fern-mapping-project-top.vim";
      name = "fern-mapping-project-top";
      rev = "1107f0cecb5d68df9801dad8a40933a6d0779a24";
    };
  };

  # Necessary for neovim users who use fern
  fixCursorHold = pkgs.vimUtils.buildVimPlugin {
    name = "FixCursorHold";
    src = builtins.fetchGit {
      url = "https://github.com/antoinemadec/FixCursorHold.nvim";
      name = "FixCursorHold";
      rev = "d932d56b844f6ea917d3f7c04ff6871158954bc0";
    };
  };

  # Necessary for neovim users who use fern
  jsonc = pkgs.vimUtils.buildVimPlugin {
    name = "jsonc.vim";
    src = builtins.fetchGit {
      url = "https://github.com/neoclide/jsonc.vim";
      name = "jsonc.vim";
      rev = "80da2a52db41b4c1ecf6f511422d3771e05622fa";
    };
  };
}
