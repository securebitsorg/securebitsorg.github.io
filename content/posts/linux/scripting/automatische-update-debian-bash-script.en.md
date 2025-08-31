---
title: Automatische Updates von Debian mit einem Bash-Script
description: Automatisierte Updates auf einem debian-basierenden OS mit einem Bash-Script
date: 2025-08-15T08:57:42.002Z
tags:
  - bash
  - debian
  - linux
categories:
  - Linux
  - Tutorials
menu:
  sidebar:
    name: Bash-Script für automatische Updates unter Debian
    identifier: debian-update
    parent: linux
keywords:
  - bash-update-script
draft: true
preview: ../../../../assets/images/posts/linux/bash-update-script-debian.webp
hero: /images/posts/linux/bash-update-script-debian.webp
---
## Updates auf debian-basierenden Systemen automatisieren mit einem Bash-Script

In diesem kleinen Tutorial möchte ich zeigen, wie ihr mit Hilfe eines Bash-Script, debian-basierende Server-Systeme automatisch aktualisieren lassen könnt.

## Warum ein Bash-Script nutzen

Ich denke jeder Administrator wei(z.B. bei Ubuntu minimal-Server-Installation)r bringe und euch anhand eines Beispiels, dass Scripting in der Shell zeige.
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
(z.B. bei Ubuntu minimal-Server-Installation)

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
### Schritt 1 - Erstellung einer Bash-Script-Datei
In diesem Beispiel nutze ich einfachshalber den `nano-editor` im Terminal, da dieser einfach zu Bedienen ist und auch für alle Distros (meines Wissens) verfügbar ist.

```sh
# Solltet ihr als nicht root-user angemeldet sein, könnt ihr euch mit dem folgenden Befehl als root-user anmelden

sudo -s
(z.B. bei Ubuntu minimal-Server-Installation)
# Erstellen der Script-Datei im root-Verzeichnis
touch ~/simple_update_debian_script.sh

# Bearbeiten der Script-Datei 
nano ~/simple_update_debian_script.sh
```
Im nun offnen Editor-Fenster der Datei `simple_update_debian_script.sh`, gibt ihr in der ersten Zeile, das folgende ein:

`#!/bin/bash`

> Mit dieser ersten Zeile `#!/bin/bash` weisen wir aus, das es sich hier um ein Bash-Script handelt und so weiß das Betriebssystem, mit welchem Interpreter (Shell) unser Script ausgeführt werden soll.

### Schritt 2 - Bash-Script Kommentare und Anweisungen einfügen
#### Warum Kommentare und Anweisungen erstellen?
Generell sollte man sich von Anfang angewöhnen, die erstellten Bash-Scripte gut zu Dokumentieren.

Erstens hilft es einem Selbst, wenn man eine Vielzahl an Bash-Scripte in seinem Werkzeugkasten hat, um sich auch später noch daran erinnern zu können, welche Funktionalität mit dem Script bereitgestellt wird.

Zweitens ist natürlich von Vorteil, dass auch Andere mit dem Bash-Script etwas anfangen können, wenn ihr eure Scripte zum Beispiel intern oder auf GitHub etc. mit anderen Usern teilt.
#### Einfügen von Kommentare oder Anweisungen
Ich für meinen Teil schreibe am Anfang meiner Scripte immer erst die Versionsnummer (für den Versionsverlauf), eine Beschreibung wofür dieses Script gedacht ist und Anweisungen für die Nutzung des Scripts.

Den einzelnen auszuführenden Befehle im Bash-Script, füge ich auch noch eine kurze Beschriftung sowie Funktionsart hinzu, wenn ich diese mit Dritten teile.

**Im folgendem sieht das dann so aus:**

```bash
#!/bin/bash

# Version: 1.0

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
```

### Schritt 3 - `echo` Ausgabe im Terminalfenster
Um dem Anwender des Bash-Scripts eine Rückmeldung zu geben, was gerade bei der Ausführung des Scripts ausgeführt wird, gibt es den Befehl `echo` für den Ausdruck im Terminal.

In unserem Beispiel-Script nutzen wir den Befehl `echo` zum ersten Mal, um dem Anwender eine Nachricht im Terminal zu übergeben, welche darüber informiert, was nun durch dieses Script auf dem System durchgeführt wird.

```bash
echo "================================================================="
echo "     Automatisches System-Update / Automatic system update"
echo "        (Debian/Ubuntu/Mint)"
echo "================================================================="
```
### Schritt 4 - Bash-Anweisung `if, then, fi` (root-Berechtigung überprüfen)
Unsere erste Anweisung die wir in unser Bash-Update-Script einfügen werden, ist die Überprüfung, ob wir die `root - Rechte` haben, um die Befehle auf dem System ausführen zu können.

```bash
# Prüfen, ob root-Rechte vorhanden sind / Check if root privileges are present
if [ "$EUID" -ne 0 ]; then
  echo "Bitte führen Sie dieses Script als root aus (sudo) / Please run this script as root (sudo)."
  exit 1
fi
```
Hierzu bedienen wir uns der `if, then, fi` -Anweisung. 
Im Klarnamen heißt das, **'wenn (`if`)' "nicht gleich Benutzer-ID + 0 `[ "$EUID" -ne 0 ];` ist (root-User)", 'dann (`then`)' gebe eine Ausgabe im Terminal (`echo`) ab "Bitte führen Sie dieses Script als root aus (sudo) / Please run this script as root (sudo)." und beende das Script (`exit 1` (steht für "Script wurde mit Fehler oder besonderem Status beendet")). Der Befehl `fi` beendet die Anweisung. 

### Schritt 5 - Bash-Anweisung (Überprüfung Paketmanager)
In diesem Schritt werden wir eine weitere Systemprüfung durchführen, um zu Überprüfen, ob der Paketmanager `apt` auf dem System vorhanden ist.

```bash
# Prüfen, ob apt verfügbar ist / Check if apt is available
if ! command -v apt >/dev/null 2>&1; then
  echo "Kein 'apt'-Paketmanager gefunden. Dieses Script funktioniert nur auf Debian-basierten Systemen / No 'apt' package manager found. This script only works on Debian-based systems."
  exit 2
fi
```


<!-- FM:Snippet:Start data:{"id":"Info","fields":[]} -->
{{< alert type="info" >}}
```bash 
if ! command -v apt >/dev/null 2>&1;
``` 
Damit wird überprüft, ob das Kommando apt im System verfügbar ist.
{{< /alert >}}
<!-- FM:Snippet:End -->

### Schritt 4 - Bash-Anweisung (Paketquellen aktualisieren)
In diesem Schritt geben wir zunächst die Ausgabe (`echo`) in das Terminal, dass die Paketquellen aktualisiert werden.
Dann wird der Befehl `apt update -y` ausgeführt um die angekündigte Aktualisierung der Paketquellen durchzuführen.

```bash
# Paketquellen aktualisieren / Update package sources
echo "Aktualisiere Paketquellen / Update package sources"
apt update -y
```
### Schritt 5 - Bash-Anweisung (Debian-System aktualisieren)
Nun wieder die `echo`-Anweisung, um die folgende Ausgabe im Terminal anzuzeigen: "Installiere verfügbare Updates / Install available updates" und gefolgt von dem Terminal-Befehl `apt upgrade -y`, um das Debian-System zu aktualisieren.

```bash
# Upgrades installieren / Install available updates
echo "Installiere verfügbare Updates / Install available updates"
apt upgrade -y
```
### Schritt 6 - Bash-Anweisung (Abhängigkeiten aktualisieren)
Um auch Abhängigkeiten bei dem Upgrade-Prozess aufzulösen, zum Beispiel Sprung auf eine neue Version, führen auch den folgenden Terminal-Befehl in unserem Bash-Update-Script aus.

```bash
# Optionale Komplett-Aktualisierung (inklusiver Entfernungen/Neuinstallationen) / Optional full upgrade (including removals/reinstallations)
echo "Führe vollständige Aktualisierung durch / Run full upgrade"
apt full-upgrade -y
```
### Schritt 7 - Bash-Anweisung (unnötige apt-Pakete entfernen)
Als nächstes werden wir noch eine Anweisung einbauen, um unnötige / nicht mehr benötigte `apt`-Pakete automatisch zu löschen.

```bash
# Nicht mehr benötigte Pakete entfernen / Remove unused packages
echo "Entferne nicht mehr benötigte Pakete / Remove unused packages"
apt autoremove -y
```

### Schritt 8 - Bash-Anweisung (apt-cache leeren)
Zu guter Letzt werden wir noch eine letzte Anweisung für den Update-Prozess einfügen, um den Cache des Paketmanager zu leeren.

```bash
# Paketdatenbank bereinigen / Clean up cached package data
echo "Bereinige zwischengespeicherte Paketdaten / Clean up cached package data"
apt clean
```

### Schritt 9 - Bash-Anweisung (echo-Ausgabe Update-Prozess abgeschlossen)
Da der Update-Prozess nach den letzten Anweisungen fertiggestellt ist, geben wir noch eine Mitteilung an den User im Terminal, dass der Update-Prozess zu Ende ist.

```bash
echo "================================================================="
echo "      System-Update abgeschlossen / System update completed"
echo "================================================================="
```

### Schritt 10 - Bash-Anweisung (Erforderliches Reboot überprüfen)
Da zum Beispiel einige Aktualisierungen (z.B. Änderung am Kernel) einen Neustart des Betriebssystem benötigen, werden wir noch eine letzte Anweisung hinzufügen, um dieses zu überprüfen und gegebenfalls einen Neustart auslösen.

```bash
# Überprüfen ob ein Neustart des Systems erforderlich ist / Check if a system restart is required
if [ -f /var/run/reboot-required ]; then
  echo "Ein Neustart des Systems ist erforderlich. Das System wird jetzt neu gestartet / A system restart is required. The system will now restart."
  reboot
fi
```

#### Bash-Update-Script abspeichern
> Nach einer letzten Überprüfung von unserem Script müssen wir dieses natürlich nach abspeichern!

## Fertiges Debian-Update Bash-Script
Hier nun das fertige Bash-Script um automatisiert Update-Routinen auf Debian-Systemen durchlaufen zu lassen.

Diese könnt ihr dann wie cronjob automatisiert auf den Linux-Systemen laufen lassen.

<!-- FM:Snippet:Start data:{"id":"Success","fields":[]} -->
{{< alert type="success" >}}
Gerade wenn ihr eine Vielzahl an Linux-Server zum Beispiel auf einen Proxmox VE-Server laufen habt, erleichtern euch solche Bash-Scripte enorm die Arbeit.
{{< /alert >}}

<!-- FM:Snippet:End -->## Schritt 11 - Bash-Update-Script ausführbar machen
Damit wir das Bash-Update-Script auch nutzen / ausführen können, muss das Script noch mit dem entsprechenden Rechten versehen werden.

```sh
sudo chmod +x simple_update_debian_script.sh
```


```bash
#!/bin/bash

# Version: 1.0

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

### Schritt 11 - Bash-Update-Script ausführbar machen
Damit wir das Bash-Update-Script auch nutzen / ausführen können, muss das Script noch mit dem entsprechenden Rechten versehen werden.

**Script-Rechte anpassen**

```sh
# Sript-Rechte anpassen

sudo chmod +x simple_update_debian_script.sh

```

**Bash-Update-Script ausführen**

```sh
# Möglichkeit 1: Ausführen des Bash-Scripts

sudo sh simple_update_debian_script.sh

# Möglichkeit 2: Ausführung des Scripts

sudo ./simple_update_debian_script.sh

```

---
<!-- FM:Snippet:Start data:{"id":"Vertical Space","fields":[]} -->
{{< vs 3>}}
<!-- FM:Snippet:End -->

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->


> ## Bücher zum Thema Bash (Shell)-Scripting
> ---
> **Zwei wirklich gut Bücher zum Thema Shell-Scripting kann ich euch hier empfehlen und besitze diese beiden Bücher auch selbst.**
> 
> Das sind beides super Nachschlage- / Übungs-Bücher und ihr bekommt für **5€ Aufpreis**, dass passende **E-Book dazu** (*nur bei der Bestellung direkt beim Rheinwerk-Verlag*)!
>
> 
>> *Hinweis: Beide Links sind Affiliate-Links, kostet aber für euch keinen 'Cent' mehr und ihr unterstützt automatisch diesen Blog.* 

{{< vs 3>}}

{{< split 6 6 >}}


**Scripting | Das Praxisbuch für Administratoren und DevOps-Teams**

![Scripting](/images/affiliate/Scripting.webp)

[Hier anschauen beim Rheinwerk-Verlag](https://www.rheinwerk-verlag.de/shell-programmierung-das-umfassende-handbuch/?GPP=securebits)

**Aus dem Inhalt:**


   - Bash, ZSH und die Linux-Toolbox
   - PowerShell und CmdLets
   - Python und Pip
   - SSH, VSCode, Git, Curl: Werkzeugenkasten für moderne Scripts
   - Scripts automatisch ausführen: Cron und Task Scheduler
   - Backups automatisieren
   - Bilder verarbeiten
   - Monitoring: Logging-Dateien auswerten
   - Web-Scraping und -Mining
   - Scripting in der AWS-Cloud
   - Scripte in Docker-Containern

---
**Shell-Programmierung | Das umfassende Handbuch**

![Shell-Programmierung](/images/affiliate/Shell-Programmierung.webp)

[Hier anschauen beim Rheinwerk-Verlag](https://www.rheinwerk-verlag.de/scripting-das-praxisbuch-fuer-administratoren-und-devops-teams/?GPP=securebits)



**Aus dem Inhalt:**

  -  Einführung in die Shells
  -  Variablen, Parameter und Argumente
  -  Kontrollstrukturen, Funktionen und Signale
  -  Ein/Ausgabe im Terminal
  -  Fehlersuche und Debugging
  -  Reguläre Ausdrücke und grep
  -  Der Stream-Editor sed
  -  Programmieren mit awk
  -  GUIs mit zenity
  -  Shell-Befehle im Überblick
  -  Scripts u. a. für die Systemadministration, Backup

{{< /split >}}

---
{{< vs 3>}}

## Fazit zum Bash-Scripting
Wer effizient mehrere Linux-Server zu administrieren hat, kommt an Bash- / oder Python-Scripting meiner Meinung nicht vorbei.

Natürlich gibt es zum Beispiel auch mächtige Tools wie [**Ansible**](https://docs.ansible.com/ansible/latest/index.html) für die Automatisierung von Deployment, Wartung, etc., aber ist das Lernen einer Script-Sprache in meinen Augen der beste Anfang.

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://forum.secure-bits.org)
<!-- FM:Snippet:End -->



