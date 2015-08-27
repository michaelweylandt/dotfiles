## Making less a bit nicer
alias more='less'
export PAGER='less -s'

## Aliases
alias ls='ls --color=auto -FhxlvA'
alias la='ls -a'
alias rm='rm -i'
alias path='echo -e ${PATH//:/\\n}'
alias du='du -h'
alias df='df -Th'
alias ipynb='ipython notebook --pylab=inline --port=5555 --ip=* --pprint --pylab --no-browser'
alias R='R --quiet --no-save --no-restore'

alias e='emacsclient -t --alternate-editor=emacs'
export EDITOR='emacsclient --alternate-editor=emacs'
export VISUAL='emacsclient --alternate-editor=emacs'

export PYTHONSTARTUP=$HOME/.pythonrc
export PS1='\t \[\e[0;31m\]\u\[\e[0m\]\[\e[1;31m\]@\[\e[0m\]\[\e[0;31m\]\H\[\e[0m\] \w \n $ '

xmodmap ~/.xmodmap 2>/dev/null

export GREP_OPTIONS="--exclude-dir='.git' -I --color=auto --exclude=*pyc"

umask 0077
