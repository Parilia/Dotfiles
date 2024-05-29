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

# Allow comments in cli
setopt interactivecomments

# Aliases
alias cat="bat"
alias q="exit"
alias x="clear"
alias fm="vifm"
alias so="source"
alias soz="source ~/.zshrc"
alias v="nvim"
# Even lazier lazygit # https://github.com/jesseduffield/lazygit
alias lg="lazygit"

# LSD # https://github.com/lsd-rs/lsd
alias ls="lsd -a"
alias ll="lsd -lah"
alias tree="lsd --tree"

## Force Neofetch to Display Shell as zsh
alias neofetch="env SHELL=zsh neofetch"

# Quick access to the .zshrc, .bashrc, .vimrc and init.lua
alias zshrc='${=EDITOR} ~/.zshrc' 
alias bashrc='${=EDITOR} ~/.bashrc' 
alias vimrc='${=EDITOR} ~/.vimrc' 
alias init='${=EDITOR} ~/.config/nvim/init.lua' 
alias oldinit='${=EDITOR} ~/.config/onvim/init.lua' 

alias wiki='nvim -c VimwikiIndex'
alias vim='vimx'
# ark extracting/unpacking. Supports: 7zip, zip, rar, jar, tar, arj and more ## https://apps.kde.org/en-gb/ark/
alias unpack="ark -ba"
# Will create new archive or add to existing, example of pack: pack my-archive.zip photo1.jpg text.txt
alias pack="ark -bt"

# Extract an exe
alias unpack-exe="innoextract"

# List active dnf repos
alias dnfrepos="grep -E '^\[.*]' /etc/yum.repos.d/*"
# dnf search showing all versions
alias vsearch="dnf search --showduplicates"
# RPM Update
alias rpmu="sudo rpm -U --force"

# Kitty Update # https://github.com/kovidgoyal/kitty
alias kittyupdate="curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
# Image Viewing in Kitty
alias icat="kitten icat"

# Restart docker apache server
alias parstart="sudo docker container restart parilia"
# dust disk usage # https://github.com/bootandy/dust
alias du="dust -bRp"
# fast
alias fast="fast --single-line -u"
# jerry
alias ani="jerry"

# mkcd - mkdir & cd combo
function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

# Rename all files in CWD .extension - ie html > md
function rename-ext {
for file in *.$1
do
  mv "$file" "${file%.$1}.$2"
done
}

# mcmeta maker
alias mcmeta="vim pack.mcmeta -c wq"

# "proton" tricks
function pt() { WINEPREFIX="$@" winetricks; }

# Vivid Colour Theme # https://github.com/ryanccn/vivid-zsh
vivid_theme="gruvbox-dark-hard"
source ~/.zsh/vivid-zsh/vivid-zsh.zsh


# nvim switcher
 alias nv="NVIM_APPNAME=onvim nvim"

 nvims() {
   items=("default" "old_nvim")
   config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
   if [[ -z $config ]]; then
     echo "Nothing selected"
     return 0
   elif [[ $config == "default" ]]; then
     config=""
   fi
   NVIM_APPNAME=$config nvim $@
 }


# Zoxide # https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

## z ls - zl does ls when jumping to directory
function zl() { z "$@" && ls; }

## z clear - returns home and clears terminal
function zx() { z && clear; }

export PATH=$HOME/bin:/usr/local/bin:$PATH
path+=('/home/.local/bin')


# Rust
. "$HOME/.cargo/env"
path+=('~/.cargo/bin')

# Power level 10k # https://github.com/romkatv/powerlevel10k
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Golang
path+=('/home/parilia/go/bin')

# Spicetify # https://github.com/spicetify
path+=('/home/parilia/.spicetify')

function spicetify-update() {
	spicetify update;
	spicetify restore backup apply;
	sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify;
	sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps;
	spicetify apply;
}


