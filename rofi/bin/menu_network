#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/network.rasi"

## Get info
IFACE="$(nmcli | grep -i interface | awk '/interface/ {print $2}')"
# LIP="$(nmcli | grep -i server | awk '/server/ {print $2}')"
# PIP="$(dig +short myip.opendns.com @resolver1.opendns.com )"
STATUS="$(nmcli radio wifi)"

active=""
urgent=""

if (ping -c 1 archlinux.org || ping -c 1 google.com || ping -c 1 bitbucket.org || ping -c 1 github.com || ping -c 1 sourceforge.net) &>/dev/null; then
	if [[ $STATUS == *"enable"* ]]; then
        if [[ $IFACE == w* ]]; then
            connected=""
        else
            connected="睊"
        fi
	active="-a 0"
    SSID="﬉ $(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)"
    PIP="$(ip route get 1.2.3.4 | awk '{print $7}')"
	fi
else
    urgent="-u 0"
    SSID="Disconnected"
    PIP="Not Available"
    connected="睊"
fi

## Icons
bmon=""
launch_cli=""
launch=""

options="$connected\n$launch"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "$SSID  :  $PIP" -dmenu $active $urgent -selected-row 1)"
case $chosen in
    $connected)
		if [[ $STATUS == *"enable"* ]]; then
			nmcli radio wifi off
		else
			nmcli radio wifi on
		fi 
        ;;
    # $bmon)
        # termite -e bmon
        # ;;
    # $launch_cli)
        # termite -e nmtui
        # ;;
    $launch)
        nm-connection-editor
        ;;
esac

