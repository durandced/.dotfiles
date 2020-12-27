# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
COMPLETION_WAITING_DOTS="true"
BAR_COLOR=039
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
# User configuration
#export OLDPATH=$PATH
#export PATH=~/bin:/sbin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME.fzf/bin:/snap/bin/
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
plugins=(git command-not-found copybuffer copydir copyfile
         git-prompt
         docker docker-compose
         python virtualenv pyenv pylint
         asdf direnv
         common-aliases ubuntu
         cp fd
         cargo # Rust
#         emacs

        )

source $ZSH/oh-my-zsh.sh

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
eval $( dircolors -b $HOME/.dir_colors )

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
#                        FUNCTIONS                         #
############################################################

function e
{
    emacs $1 &
}

function m
{
    mount ${@:1} | column -t
}

function s
{
  grep --color=auto -RIni "$@" . 2> /dev/null
}

function se
{
    sudo ${EDITOR} $1 &
}

function ownit
{
    sudo chown -R $USER:$USER $1 && sudo chmod -R 755 $1
}

function dtn
{
    dmesg | tail -n $1
}

alias spectrum_ls='x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done;'


############################################################
#                         ALIASES                          #
############################################################
alias b='bat -p'
alias df='df -h'
alias dt='dmesg | tail -n 10'
alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'
alias nowdate='date +"%d-%m-%Y - %T"'
alias lg='lazygit'

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
