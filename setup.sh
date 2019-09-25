#!/bin/bash
#title     		: setup.sh
#description   	: This script sets up a xbindkeys configuration file by appending a
#                   set of bindings to the ~/.xbindkeysrc file.
#author			: dduits (https://github.com/dduits)
#licence		: unlicense, see the LICENSE file for more information.
#version        : 1.0
#usage		 	: setup.sh

clear

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Select mouse to setup (enter number):"
echo "0. None "
echo "1. G305"
echo "2. MX Master S2"

read -p "> " mouseInput

if [[ $mouseInput = "0" || ! -n ${mouseInput} ]]
then
    echo "Skipping mouse setup."
elif [ $mouseInput = "1" ]
then
    echo "Setting up bindings for G305..."

    echo >> ~/.xbindkeysrc
    cat $DIR/config/xbindkeys-logitech-g305 >> ~/.xbindkeysrc

    mkdir -p ~/script
    cp $DIR/src/workspace-switcher.sh ~/script
    cp $DIR/src/mouse-navigation.sh ~/script
elif [ $mouseInput = "2" ]
then
    echo "Setting up bindings for MX Master S2..."

    echo >> ~/.xbindkeysrc
    cat $DIR/config/xbindkeys-logitech-mx-master-s2 >> ~/.xbindkeysrc

    mkdir -p ~/script
    cp $DIR/src/workspace-switcher.sh ~/script
    cp $DIR/src/mouse-navigation.sh ~/script
else
    echo "Invalid mouse choice."
    exit 128
fi
echo "Mouse setup done."
echo

echo "Select a keyboard to setup (enter number):"
echo "0. None (Default)"
echo "1. Ducky One Two"
echo "2. Razer BlackWidow Ultimate"
echo "3. Laptop"

read -p "> " keyboardInput

if [[ $keyboardInput = "0" || ! -n ${keyboardInput} ]]
then
    echo "Skipping keyboard setup."
elif [ $keyboardInput = "1" ]
then
    echo "Setting up bindings for Ducky One Two..."
    echo >> ~/.xbindkeysrc
    cat $DIR/config/xbindkeys-ducky-one-two >> ~/.xbindkeysrc
elif [ $keyboardInput = "2" ]
then
    echo "Setting up bindings for Razer BlackWiddow Ultimate..."
    echo >> ~/.xbindkeysrc
    cat $DIR/config/xbindkeys-razer-blackwidow >> ~/.xbindkeysrc
elif [ $keyboardInput = "3" ]
then
    echo "Setting up bindings for Laptop..."

    mkdir -p ~/script
    cp $DIR/src/touchpad-toggle.sh ~/script

    echo >> ~/.xbindkeysrc
    cat $DIR/config/xbindkeys-laptop >> ~/.xbindkeysrc
else
    echo "Invalid keyboard choice."
    exit 128
fi
echo "Keyboard setup done."
echo

echo "Resetting xbindkeys"
killall xbindkeys
sleep 1
xbindkeys -f ~/.xbindkeysrc
echo "Reset done."

exit 0