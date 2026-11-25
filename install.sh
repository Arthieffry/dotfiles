#!/bin/zsh
# Installe les paquets du Brewfile et crée les liens vers ce dépôt.
set -e

DOTFILES="${0:A:h}"

if (( ! $+commands[brew] )) && [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if (( ! $+commands[brew] )); then
  echo "Installe d'abord Homebrew : https://brew.sh"
  exit 1
fi

brew bundle --file="$DOTFILES/Brewfile"

# Crée le lien $2 vers $1, en sauvegardant ce qui se trouve déjà en $2
link() {
  local src=$1 dest=$2
  if [[ -L $dest && ${dest:A} == ${src:A} ]]; then
    return
  fi
  mkdir -p "${dest:h}"
  if [[ -e $dest || -L $dest ]]; then
    local backup="$dest.backup-$(date +%Y%m%d%H%M%S)"
    mv "$dest" "$backup"
    echo "-----> Sauvegarde : $backup"
  fi
  ln -s "$src" "$dest"
  echo "-----> Lien : $dest"
}

for name in aliases gitconfig irbrc rspec zshrc; do
  link "$DOTFILES/$name" "$HOME/.$name"
done

link "$DOTFILES/cursor_settings.json" "$HOME/Library/Application Support/Cursor/User/settings.json"

echo "Terminé. Ouvre un nouveau terminal."
