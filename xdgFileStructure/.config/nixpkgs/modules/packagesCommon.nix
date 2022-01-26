{pkgs}:

with pkgs;
[
  # CLI
  ripgrep
  ripgrep-all
  stow
  tree
  pistol
  gtop
  ctop
  ranger
  navi
  cht-sh
  rsync
  k9s

  # Misc
  nodejs-16_x # nodejs

  # Networking
  dig
  traceroute

  # Kubernetes
  kubernetes-helm
]
