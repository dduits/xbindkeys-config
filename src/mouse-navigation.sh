#!/bin/bash
#title     		: mouse-navigation.sh
#description   	: This script is meant to provide a per application bases way to use
#                   the forward and backward buttons on a mouse.
#author			: dduits (https://github.com/dduits)
#licence		: unlicense, see the LICENSE file for more information.
#version        : 1.0
#usage		 	: mouse-navigation.sh forward
#dependency     : Requires: xdotool, xprop, Firefox, jetbrains-studio.

# Parameter passed via command line.
CMD="$1"

# Get the current window that is in focus.
W=`xdotool getactivewindow`                                                     
S1=`xprop -id ${W} |awk '/WM_CLASS/{print $4}'`  

firefox='"Firefox"'
jetbrains='"jetbrains-studio"'

case $CMD in

"forward" )

    if [ $S1 = $firefox ]; then
        # Cycle tab forward in Firefox.
        xdotool key --clearmodifiers ctrl+Tab
    elif [ $S1 = $jetbrains ]; then
        # Cycle tab forward in for example Android Studio.
        xdotool key --clearmodifiers Alt+Right
    fi
    ;;

"backward" )

    if [ $S1 = $firefox ]; then
        xdotool key --clearmodifiers ctrl+shift+Tab
    elif [ $S1 = $jetbrains ]; then
        xdotool key --clearmodifiers Alt+Left
    fi
    ;;
* )

esac

exit 0