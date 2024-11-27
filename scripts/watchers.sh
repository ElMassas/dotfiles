#!/bin/bash

set -ex

BLOCKBLOCK_API_URL="https://api.github.com/repos/objective-see/BlockBlock/releases/latest"
LULU_API_URL="https://api.github.com/repos/objective-see/LuLu/releases/latest"

download_lulu_release() {
    # Get the download URL for the latest release
    LATEST_DMG_URL=$(curl -sL "$LULU_API_URL" | grep -Eo '"browser_download_url":\s*"([^"]+\.dmg)"' | sed -E 's/.*"([^"]+\.dmg)".*/\1/')

    if [[ -z "$LATEST_DMG_URL" ]]; then
        echo "Error: Could not find the latest release."
        exit 1
    fi

    echo "Latest URL: $LATEST_DMG_URL"
    DMG_FILE=$(basename "$LATEST_DMG_URL")

    # Download the file
    curl -L -o "$DMG_FILE" "$LATEST_DMG_URL"
    if [[ -f "$DMG_FILE" ]]; then
        echo "Download completed: $DMG_FILE"
        open "$DMG_FILE"
        rm "$DMG_FILE"
    else
        echo "Error: Download failed."
        exit 1
    fi
}

download_blockblock_release() {
    # Get the download URL for the latest release
    LATEST_ZIP_URL=$(curl -sL "$LULU_API_URL" | grep -Eo '"browser_download_url":\s*"([^"]+\.zip)"' | sed -E 's/.*"([^"]+\.dmg)".*/\1/')

    if [[ -z "$LATEST_DMG_URL" ]]; then
        echo "Error: Could not find the latest release."
        exit 1
    fi

    echo "Latest URL: $LATEST_ZIP_URL"
    ZIP_FILE=$(basename "$LATEST_ZIP_URL")

    # Download the file
    curl -L -o "$ZIP_FILE" "$LATEST_ZIP_URL"
    if [[ -f "$ZIP_FILE" ]]; then
        echo "Download completed: $ZIP_FILE"
        unzip "$ZIP_FILE"
        open 'BlockBlock Installer.app'
        rm "$ZIP_FILE" "./BlockBlock Installer.app"
    else
        echo "Error: Download failed."
        exit 1
    fi
}


download_lulu_release
download_blockblock_release

sudo defaults write /Library/Objective-See/LuLu/preferences passiveMode -int 0
sudo defaults write /Library/Objective-See/LuLu/preferences allowApple -int 0
sudo defaults write /Library/Objective-See/LuLu/preferences allowDNS -int 1
sudo defaults write /Library/Objective-See/LuLu/preferences allowInstalled -int 0
sudo defaults write /Library/Objective-See/LuLu/preferences noIconMode -int 0
