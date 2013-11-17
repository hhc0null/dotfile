#
# Begin ~/.zshrc
#


# Prompt
RPROMPT='%S[%~]%s %B[%h]%b'
PROMPT="%S(%T)%s %n@%B%m%b%# "

# files
## history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

#etc
## keybind(like the vim)
bindkey -v
ulimit -c 1000000

## exports
export LANG=C
export COMFILE=$HOME/.comfile
export EDITOR="vim"
export C_HEAD_DIR=$HOME/codes/c/headers
export IDAPRO=$HOME/cmd/IDA_Free
export LPE=$HOME/cmd/LPE_1.4
export ODBG=$HOME/cmd/odbg110
export TMPY=$HOME/.template.py
export BLUE=/usr/lib/blue


## autoload
autoload -U compinit
compinit

# functions
##cd hoge -> ls -a ./
function cd() {builtin cd $@ && ls -v -F --color=auto}

## google-search
function gs() {
  local str opt
  if [ $# != 0 ]; then
    for i in $*; do
      str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'`
    opt='search?num=50&hl=ja&lr=lang_ja'
    opt="${opt}&q=${str}"
  fi
  w3m -cookie http://www.google.co.jp/$opt
}

## w3m
function www() {
  w3m -cookie http://www.google.com/
}

## backlight
function blight() {
  cat /sys/class/backlight/acpi_video0/actual_brightness
}

# alias
alias dartium='$HOME/decompressed/dartium/dartium-lucid64-inc-4759.4759/chromium'
alias wine='LANG=ja_JP.utf8 wine'
alias skype='QT_IM_MODULE=ibus skype'
alias stegsolve='java -jar ~/ctf/tools/Stegsolve.jar'
alias ls='ls -v -F --color=auto'
