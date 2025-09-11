---
title: Automatic updates of Debian with a Bash script
description: Automated updates on a Debian-based OS with a Bash script
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
    name: Bash script for automatic updates under Debiann
    identifier: debian-update
    parent: linux
keywords:
  - bash-update-script
draft: true
preview: ../../../../assets/images/posts/linux/bash-update-script-debian.webp
hero: /images/posts/linux/bash-update-script-debian.webp
---
## Automating updates on Debian-based systems with a Bash script

In this short tutorial, I would like to show you how you can use a Bash script to automatically update Debian-based server systems.

## Why use a Bash script?

I think every administrator knows (e.g., with Ubuntu minimal server installation) and I will show you how to script in the shell using an example.
As an example, I will write a script that allows updates of Debian-based operating systems to run completely automatically.

## Creating the Bash script for automatic updates

<!-- FM:Snippet:Start data:{“id”:‘Warning’,“fields”:[]} -->
{{< alert type="warning" >}}
**Warning**

Please always test Bash scripts on **test systems** first and then roll them out on production systems!!!
{{< /alert >}}
<!-- FM:Snippet:End -->

## About the structure of this example script
First, I will explain the meaning and functionality of the **individual command sections** of the Bash script one after the other in this example script. Further down in this article, you will find the finished update script, which you are free to use.
<!-- FM:Snippet:Start data:{“id”:‘Info’,“fields”:[]} -->
{{< alert type="info" >}}
In my GitHub repository, you will find many more practical scripts for Bash or scripting with Python.

[**--> Click here for the repository**](https://github.com/securebitsorg/community-templates)

{{< /alert >}}
<!-- FM:Snippet:End -->

#### What do you need to create a Bash script?
All you really need to create a Bash script is a simple text editor. 
However, it's better to use an editor that also supports syntax highlighting for Bash scripting. This makes it easier to maintain the correct formatting for the script and also provides a better overview.

##### Here is a small selection of editors for Linux:
- KWrite
- VSCode
- nano
- VIM
- NEOvim
- Kate
(e.g., for Ubuntu minimal server installation)

### Creating the Bash script file
Before we can start creating the Bash script for our update script, we first need a script file. 
To create this Bash script file, create a new file with the extension **`.sh`** using the **nano editor** or the editor of your choice.

**In this example, we will create the script in the root directory of the `root user`**

>
> #### Installing the **nano editor**
> 
> On Debian-based distros, the **nano editor** is usually pre-installed. If this is not the case (e.g., with a minimal Ubuntu server installation), you can simply install it with this command.
>
>```sh
># Installing the nano editor
>
>sudo apt update
>
>sudo apt install nano
>```
Step 1 - Creating a Bash script file
In this example, for simplicity's sake, I am using the `nano editor` in the terminal, as it is easy to use and available for all distros (to my knowledge).

```sh
# If you are not logged in as a root user, you can log in as a root user with the following command

sudo -s
(e.g., for Ubuntu minimal server installation)
# Create the script file in the root directory
touch ~/simple_update_debian_script.sh

# Edit the script file 
nano ~/simple_update_debian_script.sh
```
In the editor window that is now open for the file `simple_update_debian_script.sh`, enter the following in the first line:

`#!/bin/bash`

> With this first line `#!/bin/bash`, we indicate that this is a Bash script, so the operating system knows which interpreter (shell) to use to execute our script.

### Step 2 - Insert Bash script comments and instructions
#### Why create comments and instructions?
In general, you should get into the habit of documenting the Bash scripts you create from the outset.

Firstly, if you have a large number of Bash scripts in your toolbox, it helps you to remember later on what functionality the script provides.

Secondly, it is of course advantageous that others can also use the Bash script if you share your scripts internally or on GitHub, etc. with other users.
#### Inserting comments or instructions
For my part, I always start my scripts by writing the version number (for the version history), a description of what the script is for, and instructions for using the script.

I also add a short label and function type to the individual commands to be executed in the Bash script when I share them with third parties.

**This is what it looks like:**

```bash
#!/bin/bash

# Version: 1.0

# Note:
# This script is intended for Debian-based systems.
# It updates the system and removes packages that are no longer needed.
# It checks whether a system restart is necessary and restarts it IMMEDIATELY if necessary.
# It is important that the script is run as root.

# Using:
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



# Automatic update script for Debian-based systems
```

Step 3 - `echo` output in the terminal window
To give the user of the Bash script feedback on what is currently being executed when running the script, there is the `echo` command for printing to the terminal.

In our example script, we use the `echo` command for the first time to send the user a message in the terminal informing them what is now being performed on the system by this script.

```bash
echo “=================================================================”
echo “     Automatic system update”
echo “        (Debian/Ubuntu/Mint)”
echo “=================================================================”
```
### Step 4 - Bash statement `if, then, fi` (check root privileges)
The first statement we will add to our Bash update script is to check whether we have `root privileges` to execute the commands on the system.

```bash
# Check if root privileges are present
if [ “$EUID” -ne 0 ]; then
  echo “Please run this script as root (sudo).”
  exit 1
fi
```
To do this, we use the `if, then, fi` statement. 
In plain language, this means **‘if (`if`)’ “not equal to user ID + 0 `[ ”$EUID“ -ne 0 ];` (root user)”, ‘then (`then`)’ output “Please run this script as root (sudo)” in the terminal (`echo`) and terminate the script (`exit 1` (stands for “Script terminated with error or special status”)). The command `fi` terminates the statement. 

### Step 5 - Bash statement (check package manager)
In this step, we will perform another system check to verify that the package manager `apt` is present on the system.

```bash
# Check if apt is available
if ! command -v apt >/dev/null 2>&1; then
  echo "No ‘apt’ package manager found. This script only works on Debian-based systems."
  exit 2
fi
```


<!-- FM:Snippet:Start data:{“id”:‘Info’,“fields”:[]} -->
{{< alert type="info" >}}
```bash 
if ! command -v apt >/dev/null 2>&1;
``` 
This checks whether the apt command is available in the system.
{{< /alert >}}
<!-- FM:Snippet:End -->

### Step 4 - Bash command (update package sources)
In this step, we first enter the output (`echo`) into the terminal that the package sources are being updated.
Then the command `apt update -y` is executed to perform the announced update of the package sources.

```bash
# Update package sources
echo “Update package sources”
apt update -y
```
### Step 5 - Bash command (update Debian system)
Now use the `echo` command again to display the following output in the terminal: “Install available updates” followed by the terminal command `apt upgrade -y` to update the Debian system.

```bash
# Install upgrades / Install available updates
echo “Install available updates”
apt upgrade -y
```
### Step 6 - Bash command (update dependencies)
To also resolve dependencies during the upgrade process, for example, when jumping to a new version, also execute the following terminal command in our Bash update script.

```bash
# Optional full upgrade (including removals/reinstallations)
echo “Run full upgrade”
apt full-upgrade -y
```
### Step 7 - Bash command (remove unnecessary apt packages)
Next, we will add a command to automatically delete unnecessary/unused `apt` packages.

```bash
# Remove unused packages
echo “Remove unused packages”
apt autoremove -y
```

### Step 8 - Bash command (clear apt-cache)
Last but not least, we will add one final command to the update process to clear the package manager's cache.

```bash
# Clean up cached package data
echo “Clean up cached package data”
apt clean
```

### Step 9 - Bash command (echo output update process complete)
Since the update process is complete after the last commands, we will display a message to the user in the terminal that the update process is finished.

```bash
echo “=================================================================”
echo “      System update completed”
echo “=================================================================”
```

Step 10 - Bash command (check if a reboot is required)
Since some updates (e.g., changes to the kernel) require a reboot of the operating system, we will add one last command to check for this and trigger a reboot if necessary.

```bash
# Check if a system restart is required
if [ -f /var/run/reboot-required ]; then
  echo “A system restart is required. The system will now restart.”
  reboot
fi
```

#### Save the Bash update script
> After a final check of our script, we must of course save it!

## Finished Debian update Bash script
Here is the finished Bash script for automatically running update routines on Debian systems.

You can then run this automatically as a cron job on Linux systems.

<!-- FM:Snippet:Start data:{“id”:‘Success’,“fields”:[]} -->
{{< alert type="success" >}}
Especially if you have a large number of Linux servers running on a Proxmox VE server, for example, such Bash scripts make your work much easier.
{{< /alert >}}

<!-- FM:Snippet:End -->## Step 11 - Make the Bash update script executable
In order to use/execute the Bash update script, the script must be given the appropriate permissions.

```sh
sudo chmod +x simple_update_debian_script.sh
```


```bash
#!/bin/bash

# Version: 1.0

# Note:
# This script is intended for Debian-based systems.
# It updates the system and removes packages that are no longer needed.
# It checks whether a system restart is necessary and restarts it IMMEDIATELY if necessary.
# It is important that the script is executed as root.

# Application:
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



# Automatic update script for Debian-based systems

echo “=================================================================”
echo “     Automatic system update”
echo “        (Debian/Ubuntu/Mint)”
echo “=================================================================”

# Check if root privileges are present
if [ “$EUID” -ne 0 ]; then
  echo “Please run this script as root (sudo).”
  exit 1
fi

# Check if apt is available
if ! command -v apt >/dev/null 2>&1; then
  echo “No ‘apt’ package manager found. This script only works on Debian-based systems.”
  exit 2
fi

# Update package sources
echo “Update package sources”
apt update -y

# Install available updates
echo “Install available updates”
apt upgrade -y

# Optional full upgrade (including removals/reinstallations)
echo “Run full upgrade”
apt full-upgrade -y

# Remove unused packages
echo “Remove unused packages”
apt autoremove -y


# Clean up package database ## Usage

### Start program
```bash
# Start Bash Script Maker

python bash_script_maker.py
```

### Script erstellen
1. Wähle die gewünschten Befehlsbausteine aus der linken Palette
2. Klicke auf einen Baustein, um ihn in den Editor einzufügen
3. Bearbeite die Parameter nach Bedarf
4. Speicher das Script
5. Teste das erstellte Script mit der Ausführen-Funktion

### Vorhandenes Script bearbeiten
1. Klicke auf den Button 'Öffnen'
2. Im Dialogfenster die Shell-Script-Datei auswählen
3. Mit einem Klick auf 'Öffnen' bestätigen
4. Das geöffnete Shell-Script wird im Script-Editor angezeigt

### Tastenkombinationen
- `Ctrl+N`: Neues Script
- `Ctrl+O`: Script öffnen
- `Ctrl+S`: Script speichern
- `Ctrl+Shift+S`: Script speichern unter
- `Ctrl+Q`: Programm beenden
- `F5`: Script ausführen
- `Ctrl+Z`: Rückgängig
- `Ctrl+Y`: Wiederholen

### Editor-Tastenkombinationen
- `Tab`: Einrücken (aktuelle Zeile oder Auswahl)
- `Shift+Tab`: Ausrücken (aktuelle Zeile oder Auswahl)
- `Ctrl+A`: Alles auswählen
- `Ctrl+D`: Zeile duplizieren
- `Ctrl+/`: Kommentar umschalten
- `Ctrl+Space`: Autovervollständigung anzeigen
- `Ctrl+Tab`: Alternative für Autovervollständigung
- `Enter`: Automatische Einrückung in neuen Zeilen
- `Backspace`: Intelligente Ausrückung bei Tab-Stops
- `Escape`: Vorschlagsliste schließen

### Automatische Formatierung
Der Editor erkennt automatisch Bash-Strukturen und passt die Einrückung an:
- Nach `if`, `then`, `else`, `for`, `while`, `case`, `function` wird eingerückt
- Nach `fi`, `done`, `esac` wird ausgerückt
- Einrückung mit 4 Leerzeichen (Bash-Standard)

### Autovervollständigung
Die intelligente Autovervollständigung bietet kontextabhängige Vorschläge:

#### Unterstützte Vorschlagstypen
- **Bash-Befehle**: ls, cp, mv, grep, sed, awk, find, etc.
- **Bash-Schlüsselwörter**: if, then, else, fi, for, while, function, etc.
- **Variablen**: $HOME, $PATH, $PWD, $USER, benutzerdefinierte Variablen
- **Datei- und Pfadvervollständigung**: Automatische Vervollständigung von Pfaden
- **Befehlsoptionen**: Häufig verwendete Optionen für bekannte Befehle

#### Navigation in Vorschlägen
- `↑/↓`: Zwischen Vorschlägen navigieren
- `Enter/Tab`: Vorschlag übernehmen
- `Escape`: Vorschlagsliste schließen
- `Mausrad`: Durch Liste scrollen

#### Kontextabhängige Vorschläge
- **Am Zeilenanfang**: Alle verfügbaren Befehle und Schlüsselwörter
- **Bei $**: Variablen-Vorschläge
- **Bei Pfaden**: Datei- und Verzeichnisvervollständigung
- **Nach bekannten Befehlen**: Relevante Optionen

## Feedback
---
### Vorschlag für eine neue / fehlende Funktion?!
Fehlt euch eine Funktion, dann habt ihr die Möglichkeit, eure Wünsche als [**Feature-Request auf GitHub**](https://github.com/securebitsorg/Bash-Script-Maker/issues) vorzuschlagen.

### Einen Fehler entdeckt?!
Habt ihr einen Fehler entdeckt, dann könnt ihr auch diesen auf [**GitHub posten**](https://github.com/securebitsorg/Bash-Script-Maker/issues).

### Sicherheitsprobleme entdeckt?!
<!-- FM:Snippet:Start data:{"id":"Danger","fields":[]} -->
{{< alert type="danger" >}}

Solltet ihr Hinweise auf Bugs haben die die Sicherheit der App betreffen, dann könnt ihr [--> hier auf GitHub mir die Informationen zukommen lassen.](https://github.com/securebitsorg/Bash-Script-Maker/security/advisories)
{{< /alert >}}

<!-- FM:Snippet:End -->
 cached package data
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



