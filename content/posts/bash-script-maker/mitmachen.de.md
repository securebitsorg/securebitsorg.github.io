---
title: Mitmachen bei der Entwicklung
description: Mitwirken oder Übersetzen bei der App Bash-Script-Maker
date: 2025-09-02T05:50:29.842Z
preview: ../../../assets/images/bash-maker/Bash-Script-Maker.webp
hero: /images/bash-maker/Bash-Script-Maker.webp
categories:
    - Linux
    - Bash-Script-Maker
    - Scripting
tags:
    - bash
    - bash-script-maker
    - linux
menu:
    sidebar:
        name: "Programmieren oder Übersetzen "
        identifier: program-maker
        parent: maker
keywords:
    - development bash-script-maker
---
## Mitentwickeln bei der Bash-Script-Maker App

Danke, dass du zu Bash-Script-Maker beitragen möchtest! Wir freuen uns über alle Beiträge, die unser Projekt verbessern.

### Technische Details

- **GUI-Framework**: Tkinter
- **Syntax-Highlighting**: Regex-basierte Mustererkennung
- **Dateiformat**: Reine Bash-Scripts (.sh)
- **Encoding**: UTF-8
- **Plattform**: Linux (aufgrund Zenity-Abhängigkeit)

### CI/CD Pipeline

Dieses Projekt verwendet GitHub Actions für kontinuierliche Integration und Bereitstellung.

## Schnellstart für Contributors:
1. Fork das Repository
2. `git clone https://github.com/securebitsorg/bash-script-maker.git`
3. `cd bash-script-maker && ./install.sh`
4. `pip install -e ".[dev]"`
5. `pre-commit install`
6. Entwickeln und testen
7. `./init_github.sh` (für automatischen Push)
8. Pull Request erstellen


## Entwicklungsumgebung einrichten

### Voraussetzungen
- Python 3.6+
- Git
- Linux-System (für Tkinter und Zenity)

### Einrichtung
1. Fork das Repository
2. Klonen Sie Ihren Fork:
   ```bash
   git clone https://github.com/securebitsorg/bash-script-maker.git
   cd bash-script-maker
   ```

3. Installieren Sie Abhängigkeiten:
   ```bash
   pip install -e ".[dev]"
   ```

4. Installieren Sie Pre-commit Hooks:
   ```bash
   pip install pre-commit
   pre-commit install
   ```

## Entwicklungsworkflow

### 1. Branch erstellen
```bash
git checkout -b feature/your-feature-name
# oder
git checkout -b fix/issue-number
```

### 2. Code schreiben
- Folge dem bestehenden Code-Stil
- Schreibe aussagekräftige Commit-Nachrichten
- Teste deine Änderungen

### 3. Pre-commit Checks
```bash
pre-commit run --all-files
```

### 4. Tests ausführen
```bash
tox
# oder spezifische Tests
tox -e py39,lint,type
```

### 5. Pull Request erstellen
- Pushen deinen Branch
- Erstelle einen Pull Request auf GitHub
- Beschreibe deine Änderungen detailliert

## Code-Standards

### Python
- Verwende **Black** für die Code-Formatierung
- Folge PEP 8
- Verwende Type Hints wo möglich
- Schreibe Docstrings für alle öffentlichen Funktionen

### Git Commits
- Verwende prägnante, beschreibende Commit-Nachrichten
- Beginne mit einem Verb (Add, Fix, Update, Remove)
- Referenziere Issues mit `#issue-number`

Beispiele:
```
feat: add autocomplete for bash commands
fix: resolve tab indentation bug in editor
docs: update installation instructions
```

### Branch-Namen
- Features: `feature/feature-name`
- Bugfixes: `fix/issue-number`
- Hotfixes: `hotfix/issue-number`
- Dokumentation: `docs/topic`

## Testen

### Unit Tests
```bash
pytest
```

### Integration Tests
```bash
python -c "import bash_script_maker; import syntax_highlighter"
```

### Linting und Type Checking
```bash
flake8 bash_script_maker.py syntax_highlighter.py
mypy bash_script_maker.py syntax_highlighter.py
black --check bash_script_maker.py syntax_highlighter.py
```

## Dokumentation

### Code-Dokumentation
- Verwende Docstrings im Google-Style
- Dokumentiere alle Parameter, Rückgabewerte und Ausnahmen
- Halte Kommentare auf Englisch

### Projekt-Dokumentation
- Aktualisiere die README.md bei neuen Features
- Füge Änderungen zu CHANGELOG.md hinzu
- Aktualisiere diese CONTRIBUTING.md bei Bedarf

## Releases

Releases werden automatisch über GitHub Actions erstellt:

### Patch Release (z.B. 1.0.1)
```bash
git tag v1.0.1
git push origin v1.0.1
```

### Minor Release (z.B. 1.1.0)
```bash
git tag v1.1.0
git push origin v1.1.0
```

### Major Release (z.B. 2.0.0)
```bash
git tag v2.0.0
git push origin v2.0.0
```


## Übersetzungen beisteuern

Wir freuen uns über Hilfe bei der Übersetzung des Bash-Script-Makers in neue Sprachen!

**So fügst du eine neue Sprache hinzu:**

1.  **Sprach-Code finden:** Finde den zweibuchstabigen ISO 639-1 Code für deine Sprache (z.B. `fr` für Französisch).

2.  **Verzeichnis erstellen:** Erstelle ein neues Verzeichnis unter `locales/`. Für Französisch wäre das `locales/fr/LC_MESSAGES/`.

3.  **Übersetzungsdatei erstellen:**
    *   Kopiere die deutsche Vorlagendatei: `cp locales/de/LC_MESSAGES/base.po locales/fr/LC_MESSAGES/base.po`
    *   Öffne die neue `.po`-Datei mit einem Texteditor oder einem speziellen Tool wie [Poedit](https://poedit.net/).

4.  **Texte übersetzen:**
    *   Gehe die Datei durch und übersetze alle Texte, die in `msgid "..."` stehen.
    *   Trage deine Übersetzung in das `msgstr "..."`-Feld direkt darunter ein.
    *   **Wichtig:** Lasse die Platzhalter wie `{}` unverändert.

    **Beispiel:**
    ```po
    msgid "Datei"
    msgstr "File"

    msgid "Script gespeichert: {}"
    msgstr "Script saved: {}"
    ```

5.  **Übersetzung kompilieren:**
    *   Damit das Programm deine Übersetzung nutzen kann, muss sie kompiliert werden. Führe dazu einfach das mitgelieferte Skript aus:
    ```bash
    python compile_translations.py
    ```
    *   Dieses Skript benötigt eventuell die `polib`-Bibliothek. Falls nicht vorhanden, installiere sie mit: `pip install polib`.

6.  **Sprache im Menü hinzufügen:**
    *   Öffne die Datei `bash_script_maker.py`.
    *   Suche nach `language_menu`.
    *   Füge einen neuen Eintrag für deine Sprache hinzu, ähnlich wie die bereits vorhandenen für Deutsch und Englisch.

7.  **Pull Request erstellen:** Erstelle einen Pull Request mit deinen Änderungen, damit wir die neue Sprache in das Projekt aufnehmen können.

Vielen Dank für deine Hilfe!

### Repository zu GitHub pushen:
```bash
# Automatisch (empfohlen)
./init_github.sh

# Oder manuell
git add .
git commit -m "Your commit message"
git push
```

## Sicherheit

- Melde Sicherheitslücken nicht öffentlich!!!
- Kontaktiere die Maintainers direkt
- Verwende keine unsicheren Abhängigkeiten
- Führe einen Security-Scans durch: `bandit -r .`
bash-script-maker
Durch das Beitragen zu diesem Projekt stimmst du zu, dass deine Beiträge unter der MIT-Lizenz stehen.

## Fragen?

Bei Fragen:
- Öffnen einen [GitHub Issue](https://github.com/securebitsorg/bash-script-maker/issues)
- Schreibe in [GitHub Discussions](https://github.com/securebitsorg/bash-script-maker/discussions)
- Kontaktiere die Maintainers

Vielen Dank für deinen Beitrag! 🚀
