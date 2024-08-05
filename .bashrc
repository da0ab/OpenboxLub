
# папка со скриптами
PATH=$PATH:~/bin

# Добавляем историю в файл, а не перезаписываем его.
shopt -s histappend

# Включаем цвет для терминалов, которые это поддерживают
case "$TERM" in
    screen|xterm-color|rxvt*|urxvt*) color_prompt=yes;;
esac

# ALIASES
#alias la='ls -A'
#alias l='ls -CF'

alias about='uname -a & lsb_release -a & ifconfig -a'
alias comp='sudo lshw -html > system_info.html'
alias hh='halt'
alias pa='ps ax'

alias mm='mocp'
alias sv='sudo gvim'

alias k='kill'
alias kk='killall -SIGTERM'
alias kkk='kill -s KILL'

alias about='uname -a & lsb_release -a & ifconfig -a'
alias ls='ls --color=always --group-directories-firs'
alias ll='ls -l'
alias ppp='python3'
alias sm='sudo mc'
alias load='wget -r -k -l 7 -p -E -nc '

alias ss='sudo apt-get install'
alias sf='sudo apt-get source'
alias nnr='sudo apt-get update'

#alias scrot='scrot  -d 0 'screenshot_%y-%m-%d_%H:%M:%S.png' -e 'mv $f ~/screen/''
alias sz='scrot -s -d 0 'screenshot_%y-%m-%d_%H:%M:%S.png''

alias dp='sudo dpkg -i'
alias nn='sudo apt-get upgrade'
#alias list='sudo gvim /etc/apt/sources.list'

alias t='date & cal'

alias bin='chmod +x -R ~/bin'
alias m='alsamixer'
alias ь='alsamixer'


#git
alias gp='git pull'
alias ga='git add'
alias gc='git commit -m'

alias du='du -h'
alias du1='du --si --max-depth=1'

alias apachre='sudo /etc/init.d/apache2 restart'
alias hosts='sudo gvim  /etc/hosts'
#alias din='sudo mount -t vfat /dev/sdf /mnt/dingoo'
#alias udin='sudo umount -a  /mnt/dingoo'
#alias ff=' grep -rl 'Подробнее' ~/ '

#--------------------------------------------


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi
# Если включен цвет - устанавливаем цвета в приглашении.
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Устанавливаем для xterm заголовок user@host:dir
case "$TERM" in
xterm*|rxvt*|urxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac



# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
shopt -s cmdhist
export EDITOR=vim
GTK_IM_MODULE=xim
#\[\e[Аттрибут;ЦветТекста;ЦветФонаm\]выделяемый текст\[\e[0m\]
shopt -s histappend
PROMPT_COMMAND='history -a'
export HISTCONTROL='ignoredups'
export HISTIGNORE='&:ls:[bf]g:exit'
complete -cf sudo
export HISTIGNORE="&:ls:[bf]g:exit: cd \"\`*: PROMPT_COMMAND=?*?"

eval $(lesspipe)


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
