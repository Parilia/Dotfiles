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

## LSD ## https://github.com/lsd-rs/lsd
alias ls="lsd -a"
alias ll="lsd -lah"

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

# Steam Tinker Launch
if [ -d "/home/parilia/stl/prefix" ]; then export PATH="$PATH:/home/parilia/stl/prefix"; fi

# Rust
. "$HOME/.cargo/env"

# Starship Prompt
eval "$(starship init bash)"
