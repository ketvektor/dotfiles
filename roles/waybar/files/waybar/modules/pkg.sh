#!/bin/bash

pacman_check() {
    pac=$(checkupdates 2>/dev/null | wc -l)
    aur=$(trizen -Qua 2>/dev/null | wc -l)
    
    if [[ $pac -eq "0" ]] && [[ $aur -eq "0" ]] || [[ ! $pac =~ [0-9]+ ]] || [[ ! $aur =~ [0-9]+ ]]
    then
        exit 0
    fi
    
    if checkupdates | grep '^linux\ '
    then
        echo "$pac <span foreground='#ff5c57'></span> $aur"
    else
        #echo "$pac %{F#5b5b5b}%{F-} $aur"
        echo "$pac <span foreground='#929292'></span> $aur"
    fi
}

xbps_check(){
    pkg=$(xbps-install -nu)
    pkg_count=$(wc -l <<< "$pkg")

    if [[ $pkg -eq "0" ]] || [[ ! $pkg =~ [0-9]+ ]]
    then
        exit 0
    fi
    text="<span foreground='#929292'></span> $pkg_count"
    tooltip=$(awk '{print $1}' <<< "$pkg")
    printf {"text": "$text", "tooltip": "$tooltip"}
}

if grep -i "arch" /etc/os-release &>/dev/null
then
    pacman_check
elif grep -i "void" /etc/os-release &>/dev/null
then
    xbps_check
fi
