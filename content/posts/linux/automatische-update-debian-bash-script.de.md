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
draft: true
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







