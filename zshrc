# ~/.zshrc — source: ~/code/Arthieffry/dotfiles/zshrc

# Homebrew avant les outils fournis par macOS (python3, pip3, git...)
typeset -U path
path=(/opt/homebrew/bin /opt/homebrew/sbin $path)

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.mammouth/bin:$PATH"

export HOMEBREW_NO_ANALYTICS=1

# rbenv
export PATH="${HOME}/.rbenv/bin:${PATH}"
type -a rbenv > /dev/null && eval "$(rbenv init - zsh)"

# Node (fnm) : change de version selon .nvmrc ou .node-version
type -a fnm > /dev/null && eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"

export PATH="${PATH}:/usr/local/sbin"

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR=cursor
export EDITOR="cursor --wait"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Historique
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE
setopt AUTO_CD INTERACTIVE_COMMENTS

# Complétion, insensible à la casse
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ↑/↓ : recherche selon le début de la ligne
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

# Ctrl-R : historique, Ctrl-T : fichiers
[[ -t 0 ]] && source <(fzf --zsh)

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"

# z <nom> : saute vers un dossier déjà visité
eval "$(zoxide init zsh)"

# Doit rester en dernier
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
