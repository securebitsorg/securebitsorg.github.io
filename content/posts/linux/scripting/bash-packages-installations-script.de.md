---
title: "Bash-Script für die automatische Installation von Apps "
date: 2025-08-18T11:11:41.499Z
description: In diesem Tutorial zeige ich, wie ihr mit einem Bash-Script automatisch eure Lieblings-Apps installieren könnt,
draft: true
tags:
    - bash
    - linux
    - tutorials
    - debian
categories:
    - Scripting
    - Tutorials
    - Linux
menu:
    sidebar:
        name: Bash-Script für App-Installation
        identifier: bash-app
        parent: linux-scripting
keywords:
    - bash-scripting debian
---
## Bash-Installations-Script für Standard-Apps unter Debian

In diesem Tutorial möchte ich euch zeigen wie ihr ein Bash-Script erstellt, mit dessen Hilfe, ihr eure Standard-Anwendungen auf neue Debian-Systeme automatisiert installieren lassen könnt.

Wir gehen das Bash-Script Schritt für Schritt zusammen durch, damit ihr es auch nach euren Vorlieben anpassen könnt.

```bash
#!/bin/bash

# Version: 1

# Hinweis:
# Dieses Script ist für Debian-basierende Betriebssysteme gedacht!
# Es ermöglicht die automatisierte Installation von Anwendungen via dem apt-Paketmanager.
# Es ist wichtig das dieses Script als root-user ausgeführt wird!


# Anwendung:
# sudo chmod =x automatic_install_apps.sh
# sudo ./automatic_install_apps.sh oder sudo sh automatic_install-apps.sh

# Note:
# This script is intended for Debian-based operating systems!
# It enables the automated installation of applications via the apt package manager.
# It is important that this script is executed as root user!


# Usage:
# sudo chmod =x automatic_install_apps.sh
# sudo ./automatic_install_apps.sh or sudo sh automatic_install-apps.sh


echo "================================================================="

echo "     Automatisches App-Installation / Automatic App-Installation"

echo "        (Debian/Ubuntu/Mint)"

echo "================================================================="


if ! command -v apt >/dev/null 2>&1; then
  echo "Kein 'apt'-Paketmanager gefunden. Dieses Script funktioniert nur auf Debian-basierten Systemen / No 'apt' package manager found. This script only works on Debian-based systems."
  exit 2
fi

# Auflisten der Anwendungen / List your packages here
PACKAGES=(
    nano
    wget
    htop
    net-tools
    fail2ban
    ufw
    
)

# //// Example - Add the Netbird repository

# # Netbird is a secure, open-source VPN solution.
# # This section installs Netbird and sets it up with a setup key.

# # Make sure to set the setupkey for Netbird in the .env file

# # Example .env file content:
# # setupkey=your_setup_key_here

# Load environment variables from .env file

if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo ".env file not found. Please create a .env file with the required variables."
    exit 1
fi

echo "Install ca-certificats, curl, gnupg, add netbird sources..."
sudo apt update
sudo apt install ca-certificates curl gnupg -y

echo "Adding netbird repository..."
curl -fsSL https://pkgs.netbird.io/install.sh | sh

echo "Install netbird... "
sudo apt update
sudo apt install netbird -y

echo "Set Netbird-Domain: ${netbird_domain} and register"
netbird up --management-url ${netbird_domain} --setup-key ${setupkey}

echo "Enable netbird service..."
sudo systemctl enable netbird
echo "Starting netbird service..."
sudo systemctl start netbird

echo "Netbird installation and setup complete."

echo "Updating package list..."
sudo apt update

echo "Installing packages: ${PACKAGES[*]}"
sudo apt install -y "${PACKAGES[@]}"

echo "All packages installed."

# echo "Cleaning up package cache..."
# sudo apt clean    
# echo "Package cache cleaned."

# Clean up unused packages
echo "Cleaning up ..."
sudo apt autoremove -y
echo "Cleanup complete."
echo "Installation of custom base packages completed successfully."
echo "You can now use the installed packages."

```