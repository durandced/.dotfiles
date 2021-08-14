# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
COMPLETION_WAITING_DOTS="true"
BAR_COLOR=039
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    alias-finder		# List and find aliases
    cargo			    # Rust build tool
    command-not-found	# List package to install to get this command
    common-aliases		# Classic aliases
    copybuffer			# Ctrl+o copies the current command line to the clipboard
    copydir			    # typing copydir copies the current folder to the clipboard
    copyfile			# copyfile <filename> copies the contents of the file to the clipboard
    dircycle			# Ctrl + Shift + Left / Right cycles through popd/pushd 
    docker			    # autocompletion for docker
    docker-compose		# aliases for docker-compose
    # emacs			    # aliases for emacsclient
    extract			    # wrapper for all file extractions
    fd				    # autocompletion for fd
    fzf				    # fuzzy auto-completion
    gh				    # autocompletion for github cli
    git				    # git aliases and autocompletion
    git-auto-fetch		# git-auto-fetch to disable/enable auto fetching in git folder
    git-prompt			# displays git prompt in shell
    jsontools			# json command line tools
    mosh			    # autocompletion for mosh
    nmap			    # aliases for classic nmap commands
    pep8			    # autocompletion for pep8
    # per-directory-history	# Ctrl+G to switch history. To check if compatible with fzf
    pip				    # completion for pip + aliases
    pipenv			    # completion and aliases for pipenv
    # pyenv			    # loads pyenv if found
    pylint			    # completion and aliases for pylinbt
    python			    # aliases for python
    # redis-cli		    # completion for redis
    repo			    # completion and aliases for repo
    ripgrep             # completion for rg
    rsync               # aliases for rsync
    rust                # completion for rustc compiler
    rustup              # completion for rustup installer
    screen              # sets title and hardstatus for screen
    ssh-agent           # starts ssh-agent
    systemadmin         # aliases and functions 
    systemd             # aliases for systemd
    taskwarrior         # completion for taskwarrior
    thefuck             # Esc-Esc corrects previous command
    tmux                # aliases for tmux
    tmuxinator          # completion for tmuxinator
    ubuntu			    # Might want to change that in some cases
    ufw                 # completion for ufw
    virtualenv          # displays virtualenv in prompt
    vscode              # aliases for vscode
    wd                  # warp directory
    web-search          # search shit directly from command line
    zsh-autosuggestions
)

############################################################
#                 PLUGIN-BASED ALIASES                     #
############################################################

ZSH_ALIAS_FINDER_AUTOMATIC=true
alias a='alias-finder -l'

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa id_ledger

bindkey '^ ' autosuggest-accept

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

alias spectrum_ls='x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done;'

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
