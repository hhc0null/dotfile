#
# Begin ~/.zshrc
#


# Prompt
RPROMPT='%S[%~]%s %B[%h]%b'
PROMPT="%S(%T)%s %n@%B%m%b%# "

# files
## history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

#etc
## directory stack
setopt autopushd
## keybind(like the vim)
bindkey -v
ulimit -c 1000000

## exports
export LANG=C
export EDITOR="vim"
export PYTHONSTARTUP=~/.pythonrc
export PATH=$PATH

## autoload
autoload -U compinit
compinit

# functions
function cd() {builtin cd $@ && ls -v -F --color=auto}


# alias
alias ls='ls -v -F --color=auto'
alias rot13='tr A-Za-z N-ZA-Mn-za-m'
