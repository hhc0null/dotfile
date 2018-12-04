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
export LANG=en_US.UTF-8
export EDITOR="vim"
export PYTHONSTARTUP=~/.pythonrc
export PATH=$PATH:$HOME/bin

## autoload
autoload -U compinit
compinit

# functions
function cd() {builtin cd $@ && ls -v -F --color=auto}


# alias
alias ls='ls -v -F --color=auto'
alias rot13='tr A-Za-z N-ZA-Mn-za-m'
alias hd='hexdump -C'
alias socat='socat2'

## rbenv
#eval "$(rbenv init -)"

# selection of history
function peco-history-selection() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-history-selection
bindkey -M vicmd "^R" peco-history-selection

# debug
function select_pid() {
    initial_query=$( [[ -n "${1}" ]] && print "${1}" || print "")
    pid=$(ps aux | peco --query "${initial_query}" | awk '{print $2}' )
    print -n ${pid}
}

function att() {
    module_name=$( [[ -n "${1}" ]] && print "${1}" || print "")
    gdb -q -p $(select_pid "${module_name}")
}
