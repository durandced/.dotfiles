## Created by Cedric Durand
## Login   <durand_c@epita.fr>

export PATH="${HOME}/bin:/sbin/:$PATH"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
############################################################
#                        HISTORY                           #
############################################################
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

############################################################
#                      MISC / PERSO                        #
############################################################
export EDITOR='emacs' # ftw
export LOGCHECK='60' # check new user logs every 60 seconds
export MAILCHECK=0
export PAGER='most'
export WATCH='all'
export SHELL='/bin/zsh'
export TERM='xterm-256color'
export SVN_EDITOR='emacs -nw'
export NO_AT_BRDIGE=1 # remove GTK fucking warnings

xset b off &> /dev/null
xset r rate 300 100 &> /dev/null
umask 022

############################################################
#                        COMPLETION                        #
############################################################
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format "%B---- %d%b ----=34"
zstyle ':completion:*:descriptions'format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
zstyle ':completion:*:messages' format '%B%U---- %d%u%b'
zstyle ':completion:*:warnings' format "%B$fg[red]%}---- no match for: $fg[white]%d%b"
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*:options' list-colors '=^(-- *)=34'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:approximate:*' max-errors 2
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:processes-names' command 'ps -e -o comm='
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
zstyle :compinstall filename '~/.zshrc'
fpath=(~/bin $fpath)
autoload -U compinit
compinit -u -i

############################################################
#                        COULEURS                          #
############################################################
BLACK="%{"$'\033[01;30m'"%}"
GREEN="%{"$'\033[01;32m'"%}"
RED="%{"$'\033[01;31m'"%}"
YELLOW="%{"$'\033[01;33m'"%}"
BLUE="%{"$'\033[01;34m'"%}"
PURPLE="%{"$'\033[01;35m'"%}"
BROWN="%{"$'\033[00;33m'"%}"
CYAN="%{"$'\033[00;36m'"%}"
BOLD="%{"$'\033[01;39m'"%}"
NORM="%{"$'\033[00m'"%}"

### Spectrum ###
typeset -AHg FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="[38;5;${color}m"
    BG[$color]="[48;5;${color}m"
done

# Run this command to view all available colors.
alias spectrum_ls='x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done;'

# 256 NEW COLORS
CYAN="%{$FG[039]%}"
CYAN_GREEN="%{$FG[036]%}"
VIOLET="%{$FG[105]%}"
WHITE="%{$FG[255]%}"
ORANGE="%{$FG[202]%}"
DARK_BLUE="%{$FG[027]%}"
ROYAL_BLUE="%{$FG[033]%}"
# LS_COLORS

eval $( dircolors -b $HOME/.dir_colors )
BAR_C=${CYAN}
ROOT_C=${RED}
USER_C=${CYAN_GREEN}
MACHINE_C=${CYAN_GREEN}
DATE_C=${VIOLET}


source ~/.zsh_functions

############################################################
#                      ZSH OPTIONS                         #
############################################################
autoload run-help
autoload -U colors
autoload -U zmv
colors

# 16.4.1 Options
setopt No_Beep

# 16.2.1 Directories
setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt chaselinks

# 16.2.2 Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
setopt list_types
setopt hash_list_all
unsetopt list_ambiguous

# 16.2.3 Expansion and Globing
setopt extendedglob

# 16.2.4 History
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt append_history
setopt extended_history
setopt hist_verify
setopt share_history # zleset-local-history

# 16.2.6 Input / Output
setopt correct
setopt printexitvalue
#unsetopt rm_star_silent


unsetopt GLOBAL_RCS

bindkey '^[[1;5A' history-search-backward
bindkey '^[[1;5B' history-search-forward
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
bindkey '^[[3;5~' kill-word

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

############################################################
#                         ALIASES                          #
############################################################
alias c='clear'
alias ls='ls -bh -CF --color=auto'
alias la='ls -lah'
alias ll='ls -lh'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias sed='sed -E'
alias fsed='sed -E -f'
alias mv='mv -i'
alias g='gcc -W -Wall -ansi -Werror -pedantic -g -ggdb -o'
alias mm='make clean;cls;make'
alias mmm='mm debug'
alias mc='make clean'
alias mcc='make cleanall'
alias x='$LTERM &'
alias t='tar -xf'
alias tv='tar -xvf'
alias du='du -h'
alias df='df -h'
alias dt='dmesg | tail -n 10'
alias 007='kill -9 -1'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ff='firefox &'
alias gpp='g++42 -Wall -Wextra -Werror -pedantic -pedantic-errors -std=c++98'
alias th='thunderbird &'

alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'
alias nowdate='date +"%d-%m-%Y - %T"'
# Forcer ouverture par extension fichier
alias -s pdf=xpdf
alias -s c=e
alias -s h=e
# Work in Goinfre
#alias work='workdir=`mktemp -d /goinfre/durand_c-XXXXXX`; chmod 700 $workdir; cd $workdir; set_color -o red; echo "-Welcome to the Goinfre-"; set_color normal; pwd'
#alias tigrou='workdir=`mktemp -d /goinfre/durand_c-XXXXXX`; chmod 700 $workdir; set_color -o red; echo "-Welcome to the Goinfre, Get ready to work that Fuckin Tiger Project-"; set_color normal; pwd ;  cd ~/ing1/tiger/tc1/campan_t ; svn up ; cp -r ../ $workdir ; cd $workdir/campan_t ; export CONFIG_SITE=~/config.site ; ./bootstrap && ./configure && gmake'
#alias save='savedir=`basename $(pwd)`; mkdir ~/$savedir; cp -R * ~/$savedir/;set_color -o red; echo "-Folder saved-";set_color normal;'

### OS Specifics
unamestr=`uname -a`
if [[ "$unamestr" == *'Ubuntu'* ||  "$unamestr" == *'Debian'* ]]; then
    alias i='sudo apt-get install'
    alias is='sudo apt-cache search'
    alias iu='sudo apt-get update'
    alias iui='sudo apt-get update && sudo apt-get upgrade'
elif [[ "$unamestr" == *'Fedora'* ]]; then
    alias i='sudo yum install'
    alias is='sudo yum search'
    alias iu='sudo yum update'
    alias iui='sudo yum upgrade'
elif [[ "$unamestr" == *'Archlinux'* || "$unamestr" == *'MANJARO'* ]]; then
    alias i='sudo pacman -S'
    alias is='sudo pacman -Ss'
    alias iu='sudo pacman -U'
    alias iui='sudo pacman -Syu'
fi

setprompt

############################################################
#                     LAUNCHING ZSH                        #
############################################################
#clear
