#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup"

mkdir -p "$BACKUP_DIR"

backup_if_exists() {
    target="$1"

    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Backing up $target -> $BACKUP_DIR"
        mv "$target" "$BACKUP_DIR/"
    fi
}

echo "Backing up existing configs..."

backup_if_exists "$HOME/.zshrc"
backup_if_exists "$HOME/.config/nvim"
backup_if_exists "$HOME/.config/tmux"
backup_if_exists "$HOME/.config/waybar"
backup_if_exists "$HOME/.config/omarchy"
backup_if_exists "$HOME/.config/alacritty"
backup_if_exists "$HOME/.config/starship.toml"
backup_if_exists "$HOME/.local/bin/tmux-sessionizer"

echo "Stowing dotfiles..."

stow -d "$DOTFILES_DIR" -t ~ zsh bin nvim tmux waybar hypr omarchy alacritty starship

echo "Done."
