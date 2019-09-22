#!/bin/bash
#title     		: workspace-switcher.sh
#description   	: This script provides an easy way switch between 
# 					horizontal workspaces (only tested with the Cinnamon desktop).
#author			: dduits (https://github.com/dduits)
#licence		: unlicense, see the LICENSE file for more information.
#version        : 1.0
#usage		 	: workspace-switcher.sh left
#dependency     : This script requires that wmctrl is installed.
#credits		: Original version of this script by Andy Balaam can be found at https://www.artificialworlds.net/blog/2011/03/04/switching-workspace-in-gnome-via-the-command-line/

# Parameter passed via command line.
CMD="$1"

# Get the number of workspaces.
NUM_WORKSPACES=`wmctrl -d | cut -d " " -f 1 | tail -1`
# Get the index of the current workspace.
CURRENT_WS=`wmctrl -d | grep \* | cut -d " " -f 1`

MOVE_UP="-1"
MOVE_DOWN="+1"

case $CMD in

"right" )
	# Go back to the first workspace if the current workspace
	# is the last one.
	if [[ $CURRENT_WS -eq $NUM_WORKSPACES ]]; then
	{
		NEW_WS=0
	}
	else
	{
		NEW_WS=`echo $CURRENT_WS "+ 1" | bc`
	}; fi
	;;

"left" )
	# Go to the last workspace if the current workspace
	# is the first one.
	if [[ $CURRENT_WS -eq 0 ]]; then
	{
		NEW_WS=$NUM_WORKSPACES
	}
	else
	{
		NEW_WS=`echo $CURRENT_WS "- 1" | bc`
	}; fi
	;;
		
* )
	NEW_WS=$CMD

esac

# Perform workspace switch.
wmctrl -s $NEW_WS

exit 0