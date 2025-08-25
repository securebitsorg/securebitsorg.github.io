---
title: "Bash-Script | Automatische Installation von apt-packages "
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
        name: Bash-Installations-Script für APT-Packages
        identifier: bash-app
        parent: linux-scripting
keywords:
    - bash-installations-script
preview: ../../../../assets/images/posts/linux/bash-update-script-install-apt-packagesl.webp
hero: /images/posts/linux/bash-update-script-install-apt-packagesl.webp
---
## Bash-Installations-Script für Standard-Apps unter Debian

In diesem Tutorial möchte ich euch zeigen wie ihr ein Bash-Script erstellt, mit dessen Hilfe, ihr eure Standard-Anwendungen auf neue Debian-Systeme automatisiert installieren lassen könnt.

Wir gehen das Bash-Script Schritt für Schritt zusammen durch, damit ihr es auch nach euren Vorlieben anpassen könnt.

### Warum ein Bash-Script für eine automatisierte Installation?

Das Bash-Installations-Script kann hervorragend dazu verwendet werden, um zum Beispiel immer die gleichen Anwendungen auf mehrere Endgeräte automatisiert installieren zu lassen. Weiterhin gibt es auch die Möglichkeit mit der Automatisierungslösung **Ansible**, das erstellte Bash-installations-Script, für die Verwaltung umfangreicher Deployment-Umgebungen einzusetzen.

## Aufbau des Bash-Installations-Script für den `apt-paketmanager`

Wie auch schon in meinem letzten Tutorial ['Automatische Updates mit einem Bash-Script'](https://secure-bits.org/posts/linux/scripting/automatische-update-debian-bash-script/), baue ich meine Scripts immer zuerst mit einem **Informationsbereich über die Version, Art, Funktionalität und Verwendung** auf, **damit die Verwendung / Einsatzzweck für jeden klar erkennbar** ist.
Diese herangehensweise hat sich für mich in der Praxis immer gut bewährt und daher werde ich das Script auch hier in diesem Tutorial so aufbauen.
<!-- FM:Snippet:Start data:{"id":"Info","fields":[]} -->
{{< alert type="info" >}}
**Optional:**


Weiterhin zeige ich euch auch, wie ihr z.B. Anwendungen installieren könnt, bei der Credentials mit einer `.env`-Datei an die Installations-Script übergeben werden kann, um so z.B. keine Passwörter, Tokens, etc. im Script angeben zu müssen.
{{< /alert >}}
<!-- FM:Snippet:End -->
### Schritt 1 - Anlegen des Bash-Installations-Scripts

Als erstes müssen wir erstmal eine Bash-Script-Datei anlegen, um diese dann mit unseren Anweisungen befüllen zu können.
Dazu gehen wir wie folgt vor:

```sh
# In diesem Beispiel werden wir die Datei im root-Wurzelverzeichnis anlegen

sudo touch ~/bash_apt_installations_script.sh

```
<!-- FM:Snippet:Start data:{"id":"Vertical Space","fields":[]} -->
{{< vs 3>}}
<!-- FM:Snippet:End -->
<!-- FM:Snippet:Start data:{"id":"Info","fields":[]} -->
{{< alert type="info" >}}
In diesem Tutorial nutze ich als Text-Editor im Terminal den `nano-editor`. Dieser ist auf den allermeisten Debian-basierenden Betriebssystemen vorinstalliert und einfach zu handhaben.

Gerne könnt ihr auch**jeden and/images/posts/linux/bash-update-script-install-apt-packagesl.webperen Text-Editor mit Syntax-Highligthing dafür nutzen!**
{{< /alert >}}
<!-- FM:Snippet:End -->

### Schritt 2 - öffnen des Bash-Installations-Scripts und den Infobereich einfügen
Wie weiter oben in diesem Artikel erwähnt, werden wir den Infomartionsbereich sowie die Anweisung für den Interpreter `#!/bin/bash` einfügen.

Dazu öffnen wir mit dem **nano-Editor** unsere erstellte Bash-Script-Datei `bash_apt_installations_script.sh`.

```sh
sudo nano bash_apt_installations_script.sh
```

<!-- FM:Snippet:Start data:{"id":"Vertical Space","fields":[]} -->
{{< vs 3>}}
<!-- FM:Snippet:End -->

**und fügen hier die folgenden Kommentare hinzu:**


<!-- FM:Snippet:Start data:{"id":"Vertical Space","fields":[]} -->
{{< vs 3>}}
<!-- FM:Snippet:End -->

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
# This script is intended for D/images/posts/linux/bash-update-script-install-apt-packagesl.webpebian-based operating systems!
# It enables the automated installation of applications via the apt package manager.
# It is important that this script is executed as root user!


# Usage:
# sudo chmod =x automatic_install_apps.sh
# sudo ./automatic_install_apps.sh or sudo sh automatic_install-apps.sh
```
## Fertiges `apt-packages-Installations-Bash-Script`
Hier findet ihr das ferige Bash-Script, um automatisiert, Applikationen über den `apt-Paketmanager` zu installieren.
<!-- FM:Snippet:Start data:{"id":"Vertical Space","fields":[]} -->
{{< vs 3>}}
<!-- FM:Snippet:End -->
```bash
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
```
<!-- FM:Snippet:Start data:{"id":"Vertical Space","fields":[]} -->
{{< vs 3>}}
<!-- FM:Snippet:End -->

<!-- FM:Snippet:Start data:{"id":"Success","fields":[]} -->
{{< alert type="success" >}}
Optional ist hier auch die Funktion eingefügt, um zunächst ein App-Repository einer Anwendung welche nicht im Standard `apt-Paketmanager` vorhanden ist einzufügen und diese mit Hilfe eines Token (Secret) der in einer angelegten `.env`-Datei hinterlegt ist, zu installieren.
{{< /alert >}}

<!-- FM:Snippet:End -->

<!-- FM:Snippet:Start data:{"id":"Vertical Space","fields":[]} -->
{{< vs 3>}}
<!-- FM:Snippet:End -->

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
# sudo ./automatic_install_apps.sh or sudo sh automatic_install-apps.sh/images/posts/linux/bash-update-script-install-apt-packagesl.webp

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



<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn du Fragen oder Feedback zu diesem Bl/posts/linux/scripting/automatische-update-rhel-bash-script/og oder YouTube-Kanal hast, dann nutze bitte meine Hilfeseite. Dort findest du Fragen und Antworten zu den verschiedenen Beiträgen. Du kannst dort auch gerne deine eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://help.secure-bits.org)
<!-- FM:Snippet:End -->