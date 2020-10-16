## Created by Cedric Durand
## Login   <durand_c@epita.fr>

export OLDPATH=$PATH
export DEFPATH=~/bin:/sbin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/cdurand/.fzf/bin:/snap/bin/
#export PATH=~/bin:/sbin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
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
export NO_AT_BRIDGE=1 # remove GTK fucking warnings
export BAT_PAGER="less -RF"

xset b off &> /dev/null
xset r rate 300 100 &> /dev/null
umask 022

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
LIGHT_GREY="%{$FG[240]%}"
# LS_COLORS

eval $( dircolors -b $HOME/.dir_colors )
BAR_C=${CYAN}
ROOT_C=${RED}
VCOLOR=${LIGHT_GREY}
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


# 16.2.1 Directories # http://zsh.sourceforge.net/Intro/intro_6.html
setopt autocd # no need to type cd before a folder in current location
setopt auto_pushd # push cwd in a stack for cd - <TAB>
setopt pushd_ignore_dups #ignore duplicates in the stack
setopt pushdminus # last working dir is cd -1
setopt chaselinks # resolve symbolic before pushing in stack

# 16.2.2 Completion http://zsh.sourceforge.net/Doc/Release/Options.html#Completion-2
setopt auto_menu # <tab> <tab> = menu
setopt always_to_end # move cursor to end of word after completion
setopt complete_in_word # complete word regardless of cursor position
setopt list_types # show file type in completion menu
setopt hash_list_all # avoid spells errors
unsetopt list_ambiguous # don't autocomplete if ambiguous

# 16.2.3 Expansion and Globing
setopt extendedglob # support extended globbing

# 16.2.4 History
setopt hist_ignore_dups # don't add a command already in hfile
setopt hist_ignore_all_dups # but instead move it down
setopt append_history # append commands in h_file instead of replacing
setopt extended_history # timestamp the command
setopt hist_verify # don't execute history search, expand it only
setopt share_history # zleset-local-history

# 16.2.6 Input / Output
setopt correct # try to correct bad typed commands
setopt printexitvalue # print non-zero exit values
#unsetopt rm_star_silent

# 16.4.1 Options
setopt No_Beep # remove that f*ing beep


unsetopt GLOBAL_RCS

bindkey '^[[1;5A' history-search-backward # Ctrl-Up search what's typed before
bindkey '^[[1;5B' history-search-forward # Cycle back on history search
bindkey '^[[1;5C' emacs-forward-word # Ctrl-Right moves to next delimiter
bindkey '^[[1;5D' emacs-backward-word # Ctrl-Left moves to previous delimiter
bindkey '^[[3;5~' kill-word # Ctrl-Suppr Cut forward to next delimiter
bindkey '^H' backward-delete-word # Ctrl-Backspaces does Ctrl-W, Cut backward to next delimiter
# Ctrl-Y Pastes what's been cut
# Alt-Y Cycles through the cut buffer

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

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
#zstyle ':completion:*:options' list-colors '=^(-- *)=34'
zstyle ':completion:*:options' list-colors ${(s.:.)LS_COLORS}
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
#                         ALIASES                          #
############################################################
alias c='clear'
alias ls='ls -bh -CF --color=always'
alias la='ls -lah'
alias ll='ls -lh'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias mv='mv -i'
alias mm='make -j8'
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
alias cat='bat'
alias lg='lazygit'
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
elif [[ "$unamestr" == *'Archlinux'* ]]; then
    alias i='sudo pacman -S'
    alias is='sudo pacman-Ss'
    alias iu='sudo pacman -U'
    alias iui='sudo pacman -Syu'
fi

setprompt

############################################################
#                     LAUNCHING ZSH                        #
############################################################
#clear

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PATH="/home/cdurand/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/cdurand/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/cdurand/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/cdurand/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/cdurand/perl5"; export PERL_MM_OPT;
