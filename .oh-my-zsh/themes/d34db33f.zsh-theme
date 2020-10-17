############################################################
#                         PROMPT                           #
############################################################

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)


# 256 NEW COLORS
CYAN="$FG[039]"
CYAN_GREEN="$FG[036]"
VIOLET="$FG[105]"
WHITE="$FG[255]"
ORANGE="$FG[202]"
DARK_BLUE="$FG[027]"
ROYAL_BLUE="$FG[033]"
LIGHT_GREY="$FG[240]"
BLACK="$FG[232]"
GREEN="$FG[010]"
RED="$FG[001]"
YELLOW="$FG[011]"
MATTE_YELLOW="$FG[003]"
BLUE="$FG[027]"
PURPLE="$FG[013]"
BROWN="$FG[003]"
LIME="$FG[192]"
BOLD=""$'\033[01;39m'""
NORM=""$'\033[00m'""
#257b 1b5b 3338 3b35 3b30 3033 6d25 7d0a
# LS_COLORS
#eval $( dircolors -b $HOME/.dir_colors )

BAR_C=${ROYAL_BLUE}
ROOT_C=${RED}
VCOLOR=${LIGHT_GREY}
USER_C=${CYAN_GREEN}
MACHINE_C=${CYAN_GREEN}
DATE_C=${VIOLET}
GIT_COLOR=${MATTE_YELLOW}



size_without_colors () {
    # returns a string without colors, and with 'X' instead of a special character
    siz=$(echo -n "$1" | sed -r "s/\%\{[\x1B]\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]\%\}//g" | sed -r "s/\%\{.{2}G%\}/X/g")
    return ${#siz}
}

function precmd {
	 local TERMWIDTH
    	 (( TERMWIDTH = ${COLUMNS} + 1 ))
	 #Truncate the path if it's too long.
	 PR_FILLBAR=""
    	 PR_PWDLEN=""
    	 local promptsize=${#${(%):---(%n@%m:%D{%H:%M:%S})---()--}}
    	 local pwdsize=${#${(%):-%~}}
	 GITPROMPT=$(git_super_status)
         unset RPROMPT
         size_without_colors $GITPROMPT
	 gitsize=$?
	 local venv=$(virtualenv_prompt_info)
	 venvsize=$?
	 VPROMPT=$venv
	 if [[ "$promptsize + $pwdsize + $venvsize + $gitsize" -gt $TERMWIDTH ]]; then
    	       ((PR_PWDLEN=$TERMWIDTH - $promptsize))
    	 else
		PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize + ${#venv} + $gitsize)))..${PR_HBAR}.)}"
    	 fi
}


setprompt () {
	  setopt prompt_subst
	  typeset -A altchar
    	  set -A altchar ${(s..)terminfo[acsc]}
    	  PR_SET_CHARSET="%{$terminfo[enacs]%}"
    	  PR_SHIFT_IN="%{$terminfo[smacs]%}"
    	  PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
    	  PR_HBAR=${altchar[q]:--}
    	  PR_ULCORNER=${altchar[l]:--}
    	  PR_LLCORNER=${altchar[m]:--}
    	  PR_LRCORNER=${altchar[j]:--}
    	  PR_URCORNER=${altchar[k]:--}
	  smiley="%(?,%{${GREEN}%}=%)%{${NORM}%},%{${RED}%}=(%{${NORM}%})"
#${PURPLE}%$PR_PWDLEN<...<%.%<<\
	  PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
${BOLD}${BAR_C}$PR_SHIFT_IN$PR_ULCORNER${BAR_C}$PR_HBAR$PR_SHIFT_OUT\
${BOLD}${BAR_C}%(!.[\
${ROOT_C}.${USER_C})% %n${NORM}${WHITE}@${BOLD}${MACHINE_C}%m${NORM}:${DATE_C}%D{%H:%M:%S}\
${BOLD}${BAR_C}]$GITPROMPT${VCOLOR}$VPROMPT${BAR_C}$PR_SHIFT_IN$PR_HBAR${BAR_C}$PR_HBAR${(e)PR_FILLBAR}${BAR_C}$PR_HBAR$PR_SHIFT_OUT(\
${PURPLE}%$PR_PWDLEN<...<%~%<<\
${BAR_C})$PR_SHIFT_IN$PR_HBAR${BAR_C}$PR_URCORNER$PR_SHIFT_OUT${RED}\

${BAR_C}$PR_SHIFT_IN$PR_LLCORNER${BAR_C}$PR_HBAR$PR_SHIFT_OUT(\
${smiley}${BAR_C})$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
${BAR_C}$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT${RED}>>\
${NORM} '

	PS2='${BAR_C}$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
${BAR_C}$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
${GREEN}%_${BAR_C})'
}

setprompt
