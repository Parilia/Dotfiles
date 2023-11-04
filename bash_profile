# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# Aliases
# alias alias_name="command_to_run"
alias cat="bat"
alias :q="exit"
alias :x="clear"

#Rust
. "$HOME/.cargo/env"
