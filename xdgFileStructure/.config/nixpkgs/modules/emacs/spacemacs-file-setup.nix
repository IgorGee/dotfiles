{ config }:

{
  # Instead of home-manager copying the contents and making it readonly, it will symlink back to source
  # allowing me to freely edit it in spacemacs via SPC f e d
  ".spacemacs".source = config.lib.file.mkOutOfStoreSymlink ./spacemacs.el;
}