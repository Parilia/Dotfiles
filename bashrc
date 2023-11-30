# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
EDITOR=nvim
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

alias cat="bat"
alias :q="exit"
alias :x="clear"
alias :e="vifm"
alias so="source"
## LSD ## https://github.com/lsd-rs/lsd
alias ls="lsd -a"
alias ll="lsd -lah"
alias tree="lsd --tree"
# Quick access to the .zshrc, .bashrc, .vimrc and init.lua
alias zshrc='${=EDITOR} ~/.zshrc' 
alias bashrc='${=EDITOR} ~/.bashrc' 
alias vimrc='${=EDITOR} ~/.vimrc' 
alias init='${=EDITOR} ~/.config/nvim/init.lua' 
# Restart docker apachee server
alias parstart="sudo docker container restart parilia"

# Vivid Color Theme # https://github.com/sharkdp/vivid
export LS_COLORS="$(vivid generate molokai)"

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

# Neovim config switcher
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

bind -x '"\C-a": nvims'


# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xJf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


#Zoxide
eval "$(zoxide init bash)"


# Steam Tinker Launch
if [ -d "/home/parilia/stl/prefix" ]; then export PATH="$PATH:/home/parilia/stl/prefix"; fi

# Rust
. "$HOME/.cargo/env"

# Starship Prompt
eval "$(starship init bash)"
