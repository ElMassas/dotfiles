#!/bin/bash

set -x

sudo defaults write /Library/Objective-See/LuLu/preferences passiveMode -int 0
sudo defaults write /Library/Objective-See/LuLu/preferences allowApple -int 0
sudo defaults write /Library/Objective-See/LuLu/preferences allowDNS -int 1
sudo defaults write /Library/Objective-See/LuLu/preferences allowInstalled -int 0
sudo defaults write /Library/Objective-See/LuLu/preferences noIconMode -int 0
