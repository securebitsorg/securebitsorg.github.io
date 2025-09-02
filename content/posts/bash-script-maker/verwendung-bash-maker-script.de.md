---
title: Verwendung Bash-Script-Maker
description: Bedienung und Funktion der App Bash-Script-Maker
preview: ../../../assets/images/bash-maker/Bash-Script-Maker.webp
tags:
    - bash
    - bash-script-maker
    - linux
  
categories:
    - Bash-Script-Maker
    - Linux
    - Scripting
hero: /images/bash-maker/Bash-Script-Maker.webp
menu:
    sidebar:
        name: Bedienung der App Bash-Script-Maker
        weight: 300
        identifier: bedienung-maker
        parent: maker
keywords:
    - Bedienung Bash-Script-Maker
---
## Verwendung

### Programm starten
```bash
# Bash-Script-Maker starten

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
