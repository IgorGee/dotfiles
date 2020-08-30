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
}
