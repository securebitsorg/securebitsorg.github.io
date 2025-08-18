---
title: Jetzt einfach Windows Passwort ändern
date: 2021-01-08
categories:
  - Tutorials
  - Windows
tags:
  - cmd
  - software
  - tutorials
  - windows
  - powershell
description: In diesem Tutorial zeige ich, wie ihr einfach über die Kommandozeile, das Windows Passwort ändert.
preview: ../../../assets/images/posts/windows/passwort-aendern-windows-10.jpg
hero: images/posts/windows/passwort-aendern-windows-10.jpg
menu:
  sidebar:
    identifier: windows-passwort
    parent: windows
    name: Windows Passwort einfach über das Terminal ändern
keywords:
  - windows passwort
---

## Passwort ändern unter Windows 

Heute möchte ich euch in diesem Artikel “Windows Passwort ändern” zeigen wie ihr euer Passwort in den Windows 10-Systemeinstellungen, sowie das Ganze auch über die Kommandozeile CMD oder PowerShell ändern könnt. Diese Möglichkeit ist gerade für Administratoren eine schnelle Art und Weise, um schnell und unkompliziert. die Passwörter von Nutzern auf einem Windows-Computer oder auch über eine Domäne hinweg, zu ändern.

## Möglichkeit 1 – Windows Passwort ändern (Firmenrechner in einer Domäne)

Für alle die einen Windows Firmen-Rechner besitzen der Teil einer Domäne ist, kann die Änderung des Passworts wie folgt durchgeführt werden. 

Drückt hierzu einfach die folgende Tastenkombination: 

**STRG + ALT + ENTF**

## Möglichkeit 2 – Passwort ändern in den Windows-Einstellungen

Im Allgemeinen könnt ihr euer Passwort natürlich ganz einfach über die Systemeinstellungen ändern. 

Hierfür klickt ihr auf eurem Desktop auf das Windows-Symbol in der linken unteren Ecke. Im Start-Menü klickt ihr auf das **Zahnradsymbol** und nun öffnet sich das Fenster der Systemeinstellungen von Windows.

### Beispiel unter Windows 10

![Passwort-aendern-Windows-Bild-1](images/posts/windows/Passwort-aendern-Windows-10-Bild-1.jpg)   

---
![Passwort-aendern-Windows-Bild-2](/images/posts/windows/Passwort-aendern-Windows-10-Bild-2.jpg)

---

![Passwort-aendern-Windows-Bild-3](/images/posts/windows/Passwort-aendern-Windows-10-Bild-3.jpg)

---

![Passwort-aendern-Windows-Bild-4](/images/posts/windows/Passwort-aendern-Windows-10-Bild-4.jpg)

---

In diesem Fenster klickt ihr auf die Auswahl **Konten**, geht dann auf den Menüpunkt **Anmeldeoptionen -> Kennwort” und klickt hier auf Ändern**. Sollte euer PC Mitglied einer Domäne sein, so werdet ihr darauf hingewiesen, dass ihr die Tastenkombination STRG + ALT + Entf drücken sollt, um euer Kennwort zu ändern. So wie unter Möglichkeit 1 beschrieben.

## Windows Passwort ändern über CMD oder Powershell (Kommandozeile)

Ihr könnt ebenso einfach euer Passwort über die Kommandozeile CMD, Powershell oder Microsoft Terminal ändern.

### Wie die Kommandozeile unter Windows öffnen?

Um die Kommandozeile zu öffnen gibt es mehrere Möglichkeiten.

### Möglichkeit 1:

Eingabe von „CMD.exe“ im Suchfeld in der Taskleiste

![CMD über das Windows Suchfeld aufrufen](/images/posts/windows/Windows-10-Passwort-aendern-CMD.jpg)

### Möglichkeit 2:

**Windows-Taste + R** betätigen und im Ausführen-Fenster „CMD“ eingeben.

![CMD über das Ausführen-Fenster aufrufen](/images/posts/windows/Windows-10-Passwort-aendern-Windows-R.jpg)

### Windows Passwort über CMD ändern für Nutzer ohne Domäne

Konntet ihr die Kommandozeile erfolgreich öffnen, so könnt ihr nun damit beginnen, euer Windows Passwort per Kommandozeile zu ändern.

Hierzu braucht ihr nur den folgenden Befehl in die Befehlszeile einzugeben, damit könnt ihr dann das Passwort ändern und das neue Passwort wird bei der Eingabe in das CMD versteckt.

```powershell
net user Name *
```

Natürlich könnt ihr auch gleich ein Passwort vergeben ohne dieses versteckt einzugeben.

```powershell
net user Name NeuesPasswort
```

### Windows Passwort über CMD ändern für Nutzer mit Domäne

Um das Passwort für einen Nutzer in einer Domäne ändern zu können könnt ihr den folgenden Befehl in die Kommandozeile eingeben. Hierbei ist zu beachten, dass hierbei meist eine Ausführung der Kommandozeile CMD mit Administrationsberechtigung durchgeführt werden muss.

```powershell
net user Name NeuesPasswort /Domäne
```

## Weitere Befehle für die Windows Kommandozeile CMD

Da viele durchzuführende Arbeiten sich per Kommandozeile schneller beziehungsweise nur über diese durchführen lassen, habe ich euch in dem Beitrag [**Mehr als 50 CMD-Befehle für Windows im Überblick**](/posts/windows/cmd-befehle-im-ueberblick/), viele nützliche Befehle für das CMD zusammengestellt und diese auch für euch zum Download angeboten.

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://help.secure-bits.org/)
<!-- FM:Snippet:End -->
