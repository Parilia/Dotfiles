# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
EDITOR=nvim
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/parilia/.zshrc'

autoload -Uz compinit
compinit

# Aliases
alias cat="bat"
alias :q="exit"
alias :x="clear"
## Image Viewing in Kitty
alias icat="kitten icat"
## LSD ## https://github.com/lsd-rs/lsd
alias ls="lsd -a"
alias ll="lsd -lah"
## Force Neofetch to Display Shell as zsh
alias neofetch="env SHELL=zsh neofetch"


# mkcd
function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

# Vivid Color Theme # https://github.com/sharkdp/vivid
export LS_COLORS="$(vivid generate molokai)"


# nvim switcher
alias nvchad="NVIM_APPNAME=nvchad nvim"
alias lvim="NVIM_APPNAME=lvim nvim"

nvims() {
  items=("default" "nvchad" "lvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}



##################################################################


# End of lines added by compinstall
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
