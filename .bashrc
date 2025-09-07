# USEFUL LINKS
#   https://github.com/mchalupiak/Dotfiles/blob/master/config/.bashrc
#   https://gist.github.com/rchowe/1727301
#   https://www.youtube.com/watch?v=tb8s8AJRZQw

# EXPORT ENVIROMENTAL VARIABLES
export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH
export MANPATH="/usr/share/man:/usr/local/man:/usr/local/local_dfs/man"
EDITOR=nvim
export EDITOR
export HYPRSHOT_DIR=~/Pictures/Screenshots/
export PATH=$PATH:/home/josiah/.spicetify

# HISTORY SETTINGS
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=2000
HISTFILESIZE=4000

shopt -s checkwinsize

force_color_prompt=yes

if [ "$color_prompt" = yes ]; then
  PS1='\[\033[0;32m\]\u\[\033[00m\]\100\[\033[00m\]\h \[\033[0;32m\]\w\[\033[01;00m\]> '
else
  PS1='\[\033[0;32m\]\u\[\033[00m\]\100\[\033[00m\]\h \[\033[0;32m\]\w\[\033[01;00m\]> '
#else
#    PS1='\u\100\h \w> '
fi

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
  . /usr/share/bash-completion/bash_completion

# ENABLE COLOR FOR COMMANDS
# if [ -x /usr/bin/dircolors ]; then
#   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#   alias ls='ls --color=auto'
#   alias dir='dir --color=auto'
#   alias vdir='vdir --color=auto'
#
#   alias grep='grep --color=auto'
#   alias fgrep='fgrep --color=auto'
#   alias egrep='egrep --color=auto'
# fi

# YAZI
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# ALIAS
alias n="nvim"
alias dict='sdcv'
alias hx='helix'
alias xprime='xrandr --output "DP-1" --primary'
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'

# STARSHIP
# eval "$(starship init bash)"

# ZOXIDE
# eval "$(zoxide init bash)"

if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
fi

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
fi
