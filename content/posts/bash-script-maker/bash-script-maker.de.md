---
title: Bash-Script-Maker
menu:
    sidebar:
        name: Die App Bash-Script-Maker
        identifier: bash-script-maker
        weight: 100
        parent: maker
tags:
    - bash
    - linux
    - bash-script-maker
categories:
    - Scripting
    - Bash-Script-Maker
    - Linux
date: 2025-09-01T06:53:00.108Z
description: Bash-Scripts per Drag and Drop mit dem Bash-Script-Maker erstellen.
preview: ../../../assets/images/bash-maker/Bash-Script-Maker.webp
hero: /images/bash-maker/Bash-Script-Maker.webp
draft: false
---
## Bash-Scripte erstellen leicht gemacht!
Gerade Nutzer die mit dem Erstellen / Schreiben von Bash-Scripts noch nicht so vertraut sind, stellt der Anfang des Bash-Scripte-Schreibens und dessen Formartierung, eine große Hürde da.
Daher kam mir die Idee, einen "Drag and Drop" Script-Editor zu entwickeln und diesen Interessierten zur Verfügung zu stellen!

Hier ist nun der von mir programmierte **Bash-Script-Maker** auf GitHub und den einschlägigen Paket-Manager, als Open Source-Version erschienen und wird weiterhin von mir mit neuen Funktionen ausgestattet.
<!-- FM:Snippet:Start data:{"id":"Vertical Space","fields":[]} -->
{{< vs 3>}}
<!-- FM:Snippet:End -->

![Bash-Script-Maker](/images/bash-maker/Bash-Script-Maker.webp)


## Features
### Hauptfunktionen

- Visuelle Script-Erstellung: Einfache Erstellung von Bash-Scripts durch Drag-and-Drop von Befehlsbausteinen
- Intelligente Tab-Unterstützung: Automatische Einrückung mit 4 Leerzeichen (Bash-Standard)
- Autovervollständigung: Kontextabhängige Vorschläge für Befehle, Variablen und Pfade
- Syntax-Highlighting: Automatische Hervorhebung von Bash-Syntaxelementen
- Zenity-Integration: Einfache Integration von Zenity-Dialogen für interaktive Scripts
- Live-Editor: Echtzeit-Syntaxhervorhebung während der Eingabe
- Automatische Formatierung: Smarte Einrückung basierend auf Bash-Strukturen
- Script-Ausführung: Direktes Testen der erstellten Scripts

### Verfügbare Befehlsbausteine
#### Grundlagen

- Shebang-Zeile
- Echo-Befehle
- Eingabe lesen
- Bedingte Anweisungen (if/then/else)
- Schleifen (for/while)
- Case-Anweisungen
- Funktionsdefinitionen

#### Zenity-Dialoge

- Info-Dialoge
- Fehler-Dialoge
- Warnungs-Dialoge
- Frage-Dialoge
- Eingabedialoge
- Dateiauswahl
- Fortschrittsbalken
- Listen-Dialoge

#### Systembefehle

- Dateioperationen (ls, cd, mkdir, rm, cp, mv)
- Berechtigungen (chmod)
- Prozessverwaltung (ps, kill)
- Textverarbeitung (grep, sed, awk)

#### Variablen und Operatoren

- Variablenzuweisung
- String-Operationen
- Array-Operationen
- Vergleichsoperatoren
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
