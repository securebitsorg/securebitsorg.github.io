---
title: Automatische Updates von Debian mit einem Bash-Script
description: Automatisierte Updates auf einem debian-basierenden OS mit einem Bash-Script
date: 2025-08-15T08:57:42.002Z
tags:
  - bash
  - linux
  - debian
categories:
  - Linux
  - Tutorials
menu:
  sidebar:
    name: Bash-Script für automatische Updates unter Debian
    identifier: debian-update
    parent: linux
keywords:
  - debian update script
draft: false
---
## Updates auf debian-basierenden Systemen automatisieren mit einem Bash-Script

In diesem kleinen Tutorial möchte ich zeigen, wie ihr mit Hilfe eines Bash-Script, debian-basierende Server-Systeme automatisch aktualisieren lassen könnt.

## Warum ein Bash-Script nutzen

Ich denke jeder Administrator weiß die Vorzüge der Verwendung von Scripte zur Automatierung von immer wiederkehrenden Aufgaben zu schätzen und kann so seine produktive Arbeit effizienter gestalten.

Daher habe ich mir gedacht, dass ich euch in diesem Tutorial das Bash-Scripting ein wenig näher bringe und euch anhand eines Beispiels, dass Scripting in der Shell zeige.
Als Beispiel schreibe ich ein Script mit dessen Hilfe, Updates von debian-basierenden Betriebssystemen, vollkommen automatisiert ablaufen.

## Erstellung des Bash-Scripts für automatische Updates

<!-- FM:Snippet:Start data:{"id":"Warning","fields":[]} -->
{{< alert type="warning" >}}
**Warnung**

Bitte Bash-Scripte immer erst auf **Test-Systeme** vorab Testen und dann auf Produktiv-Systemen ausrollen!!!
{{< /alert >}}
<!-- FM:Snippet:End -->

## Zum Aufbau von diesem Beispiel-Script
Zunächst werde ich in diesem Beispiel-Script euch die **einzelnen Befehls-Abschnitte** des Bash-Scripts nacheinander deren Bedeutung und Funktionsweise erklären und weiter unten in diesem Artikel findet ihr dann das fertige Update-Script zur eurer freien Verfügung.
<!-- FM:Snippet:Start data:{"id":"Info","fields":[]} -->
{{< alert type="info" >}}
In meinem GitHub-Repository findet ihr noch viele praktische Scripte für die Bash oder das Scripting mit Phyton.

[**--> Hier geht es zum Repository**](https://github.com/securebitsorg/community-templates)

{{< /alert >}}
<!-- FM:Snippet:End -->

#### Was braucht ihr für die Erstellung eines Bash-Scripts?!
Für das Erstellen eines Bash-Scripts braucht es eigentlich nur einen einfachen Text-Editor. 
Besser jedoch ist es, wenn ihr einen Editor nutzt, der auch das Syntax-Highlighting der Bash-Scripting beherrscht. So ist einfacher, die richtige Formatierung für das Script einzuhalten und sorgt auch für eine bessere Übersicht.

##### Hier eine kleine Auswahl an Editoren unter Linux:
- KWrite
- VSCode
- nano
- VIM
- NEOvim
- Kate


### Erstellung der Bash-Script-Datei
Bevor mit dem Erstellen des Bash-Scripts für unser Update-Script anfangen können, brauchen wir zunächst eine Script-Datei. 
Um diese zu Bash-Script-Datei zu erstellen, erstellt ihr eine neue Datei mit der Endung **`.sh`** mit dem **nano-Editor** oder dem Editor eurer Wahl.

**In diesem Beispiel erstellen wir das Script im Wurzelverzeichnis des `root-users`**

>
> #### Installieren des **nano-Editor**
> 
> Unter debain-basierenden Distros ist der **nano-Editor** in den meisten Fällen schon vorinstalliert. Sollte das nicht der Fall sein (z.B. bei Ubuntu minimal-Server-Installation), könnt ihr einfach die Installation mit diesen Befehl nachholen.
>
>```sh
># Installation des nano-Editor
>
>sudo apt update
>
>sudo apt install nano
>```

In diesem Beispiel nutze ich einfachshalber den `nano-editor` im Terminal, da dieser einfach zu Bedienen ist und auch für alle Distros (meines Wissens) verfügbar ist.

```sh
# Solltet ihr als nicht root-user angemeldet sein, könnt ihr euch mit dem folgenden Befehl als root-user anmelden

sudo -s

# Erstellen der Script-Datei im root-Verzeichnis
touch ~/simple_update_debian_script.sh

# Bearbeiten der Script-Datei 
nano ~/simple_update_debian_script.sh
```
Im nun offnen Editor-Fenster der Datei `simple_update_debian_script.sh`, gibt ihr in der ersten Zeile, das folgende ein:

`/bin/bash`

> Mit dieser ersten Zeile `/bin/bash` weisen wir aus, das es sich hier um ein Bash-Script handelt und so weiß das Betriebssystem, mit welchem Interpreter (Shell) unser Script ausgeführt werden soll.

### Bash-Script-Beschreibung einfügen





## Fertiges Debian-Update Bash-Script

```bash
#!/bin/bash

# Hinweis:
# Dieses Script ist für Debian-basierte Systeme gedacht.
# Es aktualisiert das System und entfernt nicht mehr benötigte Pakete.
# Es überprüft, ob ein Neustart des Systems erforderlich ist und startet es gegebenenfalls SOFORT neu.
# Es ist wichtig, dass das Script als root ausgeführt wird.

# Anwendung:
# sudo chmod +x simple_update_debian_script.sh
# sudo ./simple_update_debian_script.sh

# Info:
# This script is intended for Debian-based systems.
# It updates the system and removes unused packages.
# It checks if a system restart is required and restarts the system if necessary.
# It is important that the script is run as root.

# Using:
# sudo chmod +x simple_update_debian_script.sh
# sudo ./simple_update_debian_script.sh



# Automatisches Update-Script für Debian-basierte Systeme / Automatic update script for Debian-based systems

echo "================================================================="
echo "     Automatisches System-Update / Automatic system update"
echo "        (Debian/Ubuntu/Mint)"
echo "================================================================="

# Prüfen, ob root-Rechte vorhanden sind / Check if root privileges are present
if [ "$EUID" -ne 0 ]; then
  echo "Bitte führen Sie dieses Script als root aus (sudo) / Please run this script as root (sudo)."
  exit 1
fi

# Prüfen, ob apt verfügbar ist / Check if apt is available
if ! command -v apt >/dev/null 2>&1; then
  echo "Kein 'apt'-Paketmanager gefunden. Dieses Script funktioniert nur auf Debian-basierten Systemen / No 'apt' package manager found. This script only works on Debian-based systems."
  exit 2
fi

# Paketquellen aktualisieren / Update package sources
echo "Aktualisiere Paketquellen / Update package sources"
apt update -y

# Upgrades installieren / Install available updates
echo "Installiere verfügbare Updates / Install available updates"
apt upgrade -y

# Optionale Komplett-Aktualisierung (inklusiver Entfernungen/Neuinstallationen) / Optional full upgrade (including removals/reinstallations)
echo "Führe vollständige Aktualisierung durch / Run full upgrade"
apt full-upgrade -y

# Nicht mehr benötigte Pakete entfernen / Remove unused packages
echo "Entferne nicht mehr benötigte Pakete / Remove unused packages"
apt autoremove -y


# Paketdatenbank bereinigen / Clean up cached package data
echo "Bereinige zwischengespeicherte Paketdaten / Clean up cached package data"
apt clean

echo "================================================================="
echo "      System-Update abgeschlossen / System update completed"
echo "================================================================="

# Überprüfen ob ein Neustart des Systems erforderlich ist / Check if a system restart is required
if [ -f /var/run/reboot-required ]; then
  echo "Ein Neustart des Systems ist erforderlich. Das System wird jetzt neu gestartet / A system restart is required. The system will now restart."
  reboot
fi

# Ende des Scripts / End of script

```

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://help.secure-bits.org)
<!-- FM:Snippet:End -->



