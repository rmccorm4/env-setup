# dircolors
if tty -s
    if [[ "$(tput colors)" == "256" ]]; then
        eval "$(dircolors ~/.bash/plugins/dircolors/LS_COLORS)"
    fi
fi
