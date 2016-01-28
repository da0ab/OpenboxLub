# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# папка со скриптами
PATH=$PATH:~/bin
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# Добавляем историю в файл, а не перезаписываем его.
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# Включаем цвет для терминалов, которые это поддерживают
case "$TERM" in
    screen|xterm-color|rxvt*|urxvt*) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
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

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
  #  eval "`dircolors -b`"
  #  alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
#fi


#if [ -x /usr/bin/grc ]; then

#	alias ls="grc  ls"
#	alias diff="grc --colour=auto diff"
#	alias netstat="grc --colour=auto netstat"
#	alias ping="grc --colour=auto ping"
#	alias gcc="grc --colour=auto gcc"
#	alias traceroute="grc --colour=auto traceroute"
#        alias last="grc --colour=auto last"
#fi


alias ls='ls --color=always --group-directories-firs'



# some more ls aliases
#alias la='ls -A'
#alias l='ls -CF'
alias du='du -h'
alias ll='ls -l'
alias t='date & cal'
alias bin='chmod +x -R ~/bin'
alias hh='halt'
alias pa='ps ax'
alias m='alsamixer'
alias ь='alsamixer'
alias k='kill'
#alias xx='xrdb -merge ~/.Xdefaults'
alias kk='killall -SIGTERM'
alias kkk='kill -s KILL'
alias mm='mocp'
alias sv='sudo gvim'
alias comp='sudo lshw -html > system_info.html'
alias load='wget -r -k -l 7 -p -E -nc '
#git
alias gp='git pull'
alias ga='git add'
alias gc='git commit -m'
alias g8='git clone ssh://go@go.8bit.fm:2022/test/test.git'
alias about='uname -a & lsb_release -a & ifconfig -a'
alias disk='cat /proc/partitions'
alias hosts='sudo gvim  /etc/hosts'
#alias sun='~/prog/sun/sunvox/linux_x86/sunvox'
#alias kp='killall pulseaudio'
alias w7='sudo chmod -R 777 /www/global.local/www'
#alias scrot='scrot  -d 0 'screenshot_%y-%m-%d_%H:%M:%S.png' -e 'mv $f ~/screen/''
alias sz='scrot -s -d 0 'screenshot_%y-%m-%d_%H:%M:%S.png''
alias disc='cat /proc/partitions'

alias name='sh ~/bin/re/blank_rename.sh ;  sh ~/bin/re/translit.sh ; bash ~/bin/re/registr.sh'
alias ff=' grep -rl 'Подробнее' ~/ '
alias du1='du --si --max-depth=1'
alias sm='sudo mc'

alias ss='sudo apt-get install'
alias sf='sudo apt-get source'

alias dp='sudo dpkg -i'
alias nn='sudo apt-get upgrade'
alias nnr='sudo apt-get update'
alias list='sudo gvim /etc/apt/sources.list'


alias apachre='sudo /etc/init.d/apache2 restart'
alias din='sudo mount -t vfat /dev/sdf /mnt/dingoo'
alias udin='sudo umount -a  /mnt/dingoo'
alias n.='nautilus --no-desktop --browser .'

#alias tarr='tar -zxvf'
#fold --width=72 -s 3 > my_formatted_text.txt
#alias wg='cd ~/ddd | wget'
#set -o vi
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
shopt -s cmdhist
export EDITOR=gvim
GTK_IM_MODULE=xim
#\[\e[Аттрибут;ЦветТекста;ЦветФонаm\]выделяемый текст\[\e[0m\]
shopt -s histappend
PROMPT_COMMAND='history -a'
export HISTCONTROL='ignoredups'
export HISTIGNORE='&:ls:[bf]g:exit'
complete -cf sudo
export HISTIGNORE="&:ls:[bf]g:exit: cd \"\`*: PROMPT_COMMAND=?*?"

eval $(lesspipe)


#alias netrestart='sudo /etc/init.d/networking restart'
#alias nitro='nitrogen ~/.config/nitrogen/'
#alias dos2unix='recode dos/CR-LF..l1'
#alias unix2win='recode l1..windows-1250'
#alias www='sudo /opt/lampp/lampp start'







