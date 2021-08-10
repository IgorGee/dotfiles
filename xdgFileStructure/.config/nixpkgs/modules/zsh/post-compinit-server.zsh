zshDirPath=$HOME/dotfiles/xdgFileStructure/.config/nixpkgs/modules/zsh
source $zshDirPath/post-compinit-common.zsh

# https://stackoverflow.com/a/59667608
function k8s-remove-stuck-ns() {
  local namespace=$1

  kubectl get namespace "$namespace" -o json \
  | tr -d "\n" | sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/" \
  | kubectl replace --raw /api/v1/namespaces/"$namespace"/finalize -f -

}

function k8s-seal-secret() {
  local secretFilename=$1
  cat "$secretFilename" | kubeseal --controller-name sealed-secrets --format yaml > sealed-"$secretFilename"
}
