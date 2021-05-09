{ pkgs }:

with import ../variables.nix;
  let
    inherit
      df
    ;

    # personalVimPackages = import ./personalPackages.nix {inherit pkgs;};
    personalVimPackages = pkgs.callPackage ./personalPackages.nix {};
in {
  enable = true;
  vimAlias = true;
  extraConfig = builtins.readFile "${df.vim}/extraConfig.vim";
  plugins = with pkgs.vimPlugins; with personalVimPackages; [
    # Languages
    vim-polyglot

    # Code Completion
    coc-nvim
    coc-pairs
    coc-snippets
    coc-json
    jsonc
    coc-fzf
    coc-highlight
    coc-tsserver
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
    # quick-scope # Helps target fF and tT markers. Disabling because it freezes fern.
    vim-cutlass # Convert D to a strict deletion, without adding to clipboard. I use X for Cut.
    vim-caser # Case conversion
    ale # syntax checker for languages not covered by coc
    vim-lastplace # opens the file in the last place you were positioned
    fern
    fern-git-status
    fern-mapping-git
    nerdfont
    fern-renderer-nerdfont
    fern-mapping-project-top
    fixCursorHold

    # Buffer / Pane / File Management
    fzf-vim # File Search
    # coc-explorer # File Manager
    ranger-vim
    nerdtree
    vim-fugitive # Gblame
    vimagit # Magit

    # Should be in UI but it requested to be the last one
    vim-devicons
  ];
}
