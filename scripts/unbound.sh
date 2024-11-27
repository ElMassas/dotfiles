#!/bin/bash

set -xe

# Variables
HOMEBREW_PATH="/opt/homebrew"
UNBOUND_CONF_DIR="$HOMEBREW_PREFIX/etc/unbound"
UNBOUND_PLIST="/Library/LaunchDaemons/nl.nlnetlabs.unbound.plist"
DNSMASQ_CONF_DIR="$HOMEBREW_PREFIX/etc/dnsmasq"
DNSMASQ_PLIST="/Library/LaunchDaemons/homebrew.dnsmasq.plist"
LOG_DIR="/var/log"
UNBOUND_LOG_DIR="/var/unbound"
USER_ID="555"
GROUP_ID="555"

install_dependencies() {
    echo "Installing dependencies..."
    brew install libevent openssl unbound dnsmasq || echo "Dependencies already installed."
}

configure_unbound() {
    echo "Configuring Unbound..."
    sudo cp ~/.config/unbound/unbound.conf "$UNBOUND_CONF_DIR/unbound.conf"
    sudo chown -R unbound:unbound "$UNBOUND_CONF_DIR"
    sudo chmod 644 "$UNBOUND_CONF_DIR/unbound.conf"

    sudo tee "$UNBOUND_PLIST" > /dev/null << EOF
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
        <string>$HOMEBREW_PREFIX/sbin/unbound</string>
        <string>-c</string>
	      <string>$UNBOUND_CONF_DIR/unbound.conf</string>
    </array>
    <key>UserName</key>
    <string>root</string>
    <key>StandardErrorPath</key>
    <string>/var/log/unbound.log</string>
    <key>StandardOutPath</key>
    <string>/var/log/unbound.log</string>
    </dict>
</plist>
EOF

    sudo chmod 644 "$UNBOUND_PLIST"
    sudo mkdir -p "$UNBOUND_LOG_DIR"
    sudo chown -R unbound:unbound "$UNBOUND_LOG_DIR"
}

create_unbound_user() {
    echo "Creating Unbound user and group..."
    sudo dscl . -create /Users/unbound || echo "User already exists."
    sudo dscl . -create /Users/unbound UserShell /usr/bin/false
    sudo dscl . -create /Users/unbound NFSHomeDirectory /var/empty
    sudo dscl . -create /Users/unbound UniqueID "$USER_ID"
    sudo dscl . -create /Users/unbound PrimaryGroupID "$GROUP_ID"
    sudo dscl . -create /Groups/unbound || echo "Group already exists."
    sudo dscl . -create /Groups/unbound PrimaryGroupID "$GROUP_ID"
    sudo dscl . -append /Groups/unbound GroupMembership unbound
}

configure_dnsmasq() {
    echo "Configuring dnsmasq..."
    sudo tee "$DNSMASQ_PLIST" > /dev/null << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>homebrew.dnsmasq</string>
    <key>ProgramArguments</key>
    <array>
        <string>$HOMEBREW_PREFIX/sbin/dnsmasq</string>
        <string>--keep-in-foreground</string>
        <string>--conf-file</string>
        <string>$DNSMASQ_CONF_DIR/dnsmasq.conf</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardErrorPath</key>
    <string>$LOG_DIR/dnsmasq.err</string>
    <key>StandardOutPath</key>
    <string>$LOG_DIR/dnsmasq.log</string>
</dict>
</plist>
EOF

    sudo chmod 644 "$DNSMASQ_PLIST"
    sudo touch "$LOG_DIR/dnsmasq.log" "$LOG_DIR/dnsmasq.err"
    sudo chmod 644 "$LOG_DIR/dnsmasq.log" "$LOG_DIR/dnsmasq.err"
}

load_services() {
    echo "Loading services..."
    sudo launchctl load "$DNSMASQ_PLIST"
    sudo launchctl load "$UNBOUND_PLIST"
}

# Main Script Execution
install_dependencies
create_unbound_user
configure_unbound
configure_dnsmasq
load_services

echo "Setup complete. Test your configuration at: https://dnsviz.net/ or https://dnssec-debugger.verisignlabs.com/"
