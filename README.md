# Dotfiles

Configuration pour macOS (Apple Silicon). Basée à l'origine sur [lewagon/dotfiles](https://github.com/lewagon/dotfiles).

## Outils

- zsh avec le prompt [Starship](https://starship.rs)
- [fnm](https://github.com/Schniz/fnm) pour Node, [rbenv](https://github.com/rbenv/rbenv) pour Ruby
- [fzf](https://github.com/junegunn/fzf), [zoxide](https://github.com/ajeetdsouza/zoxide), zsh-autosuggestions, zsh-syntax-highlighting
- [Cursor](https://cursor.com)

## Installation

1. Installer [Homebrew](https://brew.sh) et [Cursor](https://cursor.com).
2. Dans Cursor, installer la commande `cursor` (palette de commandes : « Install 'cursor' command »).
3. Cloner ce dépôt, puis lancer `./install.sh`.
4. Dans un nouveau terminal, installer Node et Ruby :

```sh
fnm install 24 && fnm default 24
rbenv install <version> && rbenv global <version>
```

Les fichiers déjà présents sont renommés en `*.backup-<date>` avant la création des liens.

## Contenu

| Fichier | Lien créé |
|---|---|
| `zshrc`, `aliases`, `gitconfig`, `irbrc`, `rspec` | `~/.<nom>` |
| `cursor_settings.json` | `~/Library/Application Support/Cursor/User/settings.json` |
| `Brewfile` | aucun, utilisé par `install.sh` |

`gitconfig` contient mon nom et mon adresse e-mail : à adapter avant toute réutilisation.

Ce dépôt est public : n'y mettre ni jeton ni mot de passe.
