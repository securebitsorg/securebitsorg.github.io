---
title: Installation Bash-Script-Maker
description: Erfahre hier, wie du die App Bash-Script-Maker einfach auf deinem System installieren kannst.
date: 2025-09-01T07:23:46.519Z
draft: false
tags:
    - bash
    - bash-script-maker
    - linux
categories:
    - Scripting
    - Bash-Script-Maker
    - Linux
menu:
    sidebar:
        name: Installation des Bash-Script-Maker
        weight: 200
        identifier: install-Maker
        parent: maker
keywords:
    - installation bash-script-maker
preview: ../../../assets/images/bash-maker/Bash-Script-Maker.webp
hero: /images/bash-maker/Bash-Script-Maker.webp
---
## Installation von Bash-Script-Maker unter Linux
Hier habt ihr mehrere Möglichkeiten, **Bash-Script-Maker** unter Linux zu installieren.

### Installations-Optionen unter Linux
### Voraussetzungen
- Python 3.8 oder höher
- Git (bei der empfohlenen Methode)
- Tkinter (GUI-Bibliothek)
- Zenity (für Dialog-Funktionen)
- Linux-Distribution mit apt, dnf, pacman oder ähnlichem Paketmanager

### Automatische Installation

**Empfohlene Methode (automatische Erkennung Betriebssystem):**

```bash
git clone https://github.com/securebitsorg/bash-script-maker.git
cd bash-script-maker
./install.sh
```

**Spezifisch für Distributionen:**

Für Ubuntu/Debian-basierte Systeme:
```bash
./install_apt.sh
```

Für Fedora/RHEL/CentOS-basierte Systeme:
```bash
./install_dnf.sh
```

### Manuelle Installation

Wenn die automatischen Scripts nicht funktionieren, installiere die Pakete bitte manuell:

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install python3 python3-tk python3-pip zenity xterm
```

**Fedora/RHEL/CentOS:**
```bash
sudo dnf install python3 python3-tkinter python3-pip zenity xterm
```

**Arch Linux:**
```bash
sudo pacman -S python python-tk python-pip zenity xterm
```
<!-- FM:Snippet:Start data:{"id":"Vertical Space","fields":[]} -->
{{< vs 2>}}
<!-- FM:Snippet:End -->

> **Andere Distributionen:**
> 
> Siehe `packages.txt` im Repository für detaillierte Paketlisten.

### Python-Abhängigkeiten
```bash
pip install -r requirements.txt
```
### Überprüfung der Installation

Nach der Installation kannst du testen, ob alles korrekt funktioniert:
```bash
./test_installation.sh
./tools/test_dependencies.py
```

Diese Scripts überprüfen alle Abhängigkeiten und geben detaillierte Informationen über eventuelle Probleme.

### Verfügbare Scripts

Das Projekt enthält folgende Installations- und Hilfsscripts:

- `install.sh` - **Universelles Installationsscript** (empfohlen)
- `install_apt.sh` - Spezifisch für Ubuntu/Debian
- `install_dnf.sh` - Spezifisch für Fedora/RHEL/CentOS
- `test_installation.sh` - Überprüft die Installation
- `tools/test_dependencies.py` - Detaillierte Dependency-Tests
- `tests/test_basic.py` - Pytest-Tests für grundlegende Funktionalität
- `start.sh` - Startet das Programm mit Abhängigkeitsprüfung

Alle Scripts sind ausführbar und können direkt aufgerufen werden.

## Bash-Script-Maker starten
**Starten von Bash-Script-Maker**

Zum Starten von **Bash-Script-Maker** wechselt ihr in das Verzeichnis, wo der Bash-Script-Maker installiert wurde.
Dann könnt ihr das Programm mit dem folgenden Befehl starten:

```sh
# Bash-Script-Maker starten

python bash_script_maker.py
```

<!-- FM:Snippet:Start data:{"id":"Vertical Space","fields":[]} -->
{{< vs 3>}}
<!-- FM:Snippet:End -->
**Viel Spaß beim Scripting!**
