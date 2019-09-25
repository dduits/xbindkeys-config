#!/bin/bash
#title     		: touchpad-toggle.sh
#description   	: Toggles the touchpad on and off in in Cinnamon.
#author			: dduits (https://github.com/dduits)
#licence		: unlicense, see the LICENSE file for more information.
#version        : 1.0
#usage		 	: touchpad-toggle.sh
#dependency     : Requires: gsettings.

enabled=$(gsettings get org.cinnamon.settings-daemon.peripherals.touchpad touchpad-enabled)

if [ "$enabled" = true ]; then
    gsettings set org.cinnamon.settings-daemon.peripherals.touchpad touchpad-enabled false
    DISPLAY=:0 notify-send --urgency=normal --icon=/usr/share/icons/Mint-Y/panel/24/touchpad-indicator-light-disabled.svg "Touchpad disabled"  
else
    gsettings set org.cinnamon.settings-daemon.peripherals.touchpad touchpad-enabled true
    DISPLAY=:0 notify-send --urgency=normal --icon=/usr/share/icons/Mint-Y/panel/24/touchpad-indicator-light-enabled.svg "Touchpad enabled"  
fi

exit 0