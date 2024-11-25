#!/bin/bash

set -x

# make sure depedencies are installed
brew install libevent openssl unbound dnsmasq

# Create unbound service && configure
sudo touch /Library/LaunchDaemons/nl.nlnetlabs.unbound.plist
sudo cp ~/.config/unbound/unbound.conf /opt/homebrew/etc/unbound/unbound.conf
sudo chown unbound:unbound /opt/homebrew/etc/unbound/unbound.conf
sudo chmod 644 /opt/homebrew/etc/unbound/unbound.conf


sudo tee /Library/LaunchDaemons/nl.nlnetlabs.unbound.plist << 'EOF' > /dev/null
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
    <key>Label</key>
    <string>nl.nlnetlabs.unbound</string>
    <key>KeepAlive</key>
    <true/>
    <key>RunAtLoad</key>
    <true/>
    <key>ProgramArguments</key>
    <array>
        <string>//opt/homebrew/opt/unbound</string>
        <string>-c</string>
        <string>/opt/homebrew/etc/unbound//unbound.conf</string>
    </array>
    <key>UserName</key>
    <string>root</string>
    <key>StandardErrorPath</key>
    <string>/dev/null</string>
    <key>StandardOutPath</key>
    <string>/dev/null</string>
    </dict>
</plist>
EOF



# Create unbound user
sudo dscl . -create /Users/unbound
sudo dscl . -create /Users/unbound UserShell /usr/bin/false
sudo dscl . -create /Users/unbound NFSHomeDirectory /var/empty
sudo dscl . -create /Users/unbound UniqueID "555"
sudo dscl . -create /Users/unbound PrimaryGroupID 555
sudo dscl . -create /Groups/unbound
sudo dscl . -create /Groups/unbound PrimaryGroupID 555
sudo dscl . -append /Groups/unbound GroupMembership unbound

# Update permissions for unbound user
sudo chown -R unbound:unbound /opt/homebrew/etc/unbound
sudo mkdir -p /var/unbound
sudo chown -R unbound:unbound /var/unbound
sudo chmod 644 /Library/LaunchDaemons/nl.nlnetlabs.unbound.plist
sudo chown unbound:unbound /opt/homebrew/etc/unbound/unbound_control.*



# dnsmasq
sudo touch /Library/LaunchDaemons/homebrew.dnsmasq.plist

sudo tee /Library/LaunchDaemons/homebrew.dnsmasq.plist << 'EOF' > /dev/null
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>homebrew.dnsmasq</string>
    <key>ProgramArguments</key>
    <array>
        <string>/opt/homebrew/sbin/dnsmasq</string>
        <string>--keep-in-foreground</string>
        <string>--conf-file</string>
        <string>~/.config/dnsmasq/dnsmasq.conf</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardErrorPath</key>
    <string>/var/log/dnsmasq.err</string>
    <key>StandardOutPath</key>
    <string>/var/log/dnsmasq.log</string>
</dict>
</plist>
EOF

sudo chmod 644 /Library/LaunchDaemons/homebrew.dnsmasq.plist
sudo touch /var/log/dnsmasq.log /var/log/dnsmasq.err
sudo chmod 644 /var/log/dnsmasq.log /var/log/dnsmasq.err

sudo launchctl load /Library/LaunchDaemons/homebrew.dnsmasq.plist
sudo launchctl load /Library/LaunchDaemons/nl.nlnetlabs.unbound.plist

# To test if this unbound config is working properly you can visit:
# https://dnsviz.net/
# https://dnssec-debugger.verisignlabs.com/
