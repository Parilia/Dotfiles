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
# Restart docker apache server
alias parstart="sudo docker container restart parilia"
# RPM Update
alias rpmu="sudo rpm -U"
## dust disk usage ## https://github.com/bootandy/dust
alias du="dust -bRp"
## ark extracting/unpacking. Supports: 7zip, zip, rar, jar, tar, arj and more ## https://apps.kde.org/en-gb/ark/
alias unpack="ark -ba"
### Will create new archive or add to existing, example of pack: pack my-archive.zip photo1.jpg text.txt
alias pack="ark -bt"


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


## Zoxide ## https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init bash)"


# Steam Tinker Launch
if [ -d "/home/parilia/stl/prefix" ]; then export PATH="$PATH:/home/parilia/stl/prefix"; fi

# Rust
. "$HOME/.cargo/env"

## Starship Prompt ## https://github.com/starship/starship
eval "$(starship init bash)"
