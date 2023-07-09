export ZSH="/usr/share/oh-my-zsh/"

plugins=(git docker kubectl)

source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/skim/key-bindings.zsh
source /usr/share/skim/completion.zsh

autoload -U promptinit; promptinit;
autoload -U compinit bashcompinit
compinit
bashcompinit
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action


# Display Images in Terminal
function imgcat()
{
  local CNT=0
  local IFS=$'\n'
  local posY=$(($(echo -e "cols" | tput -S) / 2))
  local posX=$(($(echo -e "lines" | tput -S) / 4))

  for i in $(find $1 -type f -exec file --mime-type {} \+ | awk -F: '{if ($2 ~/image\//) print $1}'); do
    CNT=$((CNT+1))
    if test $(($CNT % 2)) -eq 0 && test "$2" != "-1"; then
      printf "\033[${posX}A"
      printf "\033[${posY}C"
      echo -e "==== $(basename $i) ===="
      printf "\033[${posY}C"
    else
      echo -e "==== $(basename $i) ===="
    fi

    if echo "$i" | grep -e ".svg$" &> /dev/null; then
      ffmpeg -i "$i" -vf scale=640:-1 -f image2pipe -vcodec png - 2> /dev/null | wezterm imgcat --height 20%
    else
      wezterm imgcat --height 20% "$i";
    fi
  done
}


# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# Aliase 
alias eZ="vim ~/.zshrc"
alias eI="vim ~/.config/i3/config"
alias eW="vim ~/.config/wezterm/wezterm.lua"
alias eI="vim ~/.config/i3/config"
alias eV="vim ~/.vimrc"
alias eS="vim ~/.config/starship.toml"
alias history="history 0"
alias etcher="usbimager"
alias ls='ls --color=auto'
alias k='kubectl'
alias vim='nvim'

export EDITOR="nvim"

eval "$(starship init zsh)"
