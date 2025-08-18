---
title: Windows PowerShell installieren
date: 2019-11-07
categories:
  - Tutorials
  - Windows
tags:
  - tutorials
  - windows
  - powershell
  - cmd
description: Windows Powershell installieren unter Windows, macOS und Linux
preview: ../../../assets/images/posts/windows/Windows-PowerShell-Batch.jpg
menu:
  sidebar:
    name: Windows Powershell unter Linux und Windows installieren
    identifier: powershell-linux
    parent: windows
keywords:
  - powershell
hero: /images/posts/windows/Windows-PowerShell-Batch.jpg
---

In diesem Artikel möchte ich euch das neue (so neu ist es nun auch nicht) Kommandozeilen-Tool Windows PowerShell ein bisschen näherbringen und euch die Unterschiede zur klassischen Kommandozeile CMD aufzeigen. Warum zur Administration die PowerShell das Tool eurer Wahl sein sollte, erfahrt ihr in diesem Beitrag. 

Was es mit dem klassischen Kommandozeilen-Interpreter CMD auf sich hat, dass erfahrt ihr in diesem Artikel: [**CMD-Befehle im Überblick**](https://secure-bits.org/posts/windows/cmd-befehle-im-ueberblick/)

## Windows PowerShell installieren - Ein mächtiges Tool

Die **Windows PowerShell** ist ein Framework, welches für Administratoren und Power-User ein unerlässliches Tool zur Automatisierung und Verwaltung von plattformübergreifenden Systemen darstellt. Dieses Framework besteht aus einem Kommandozeileninterpreter sowie einer Scriptsprache.

Diese Windows-Befehlszeilenshell setzt auf der .NET Framework Common Language Runtime (CLR) und auf .NET Framework auf und nutzt das Konzept eines Cmdlets („Command-let“ ausgesprochen).

Diese einzelnen Cmdlets (zum Beispiel für Azure-Dienste und Office 365) können miteinander kombiniert werden und sind hierdurch sehr leistungsfähig, um komplexe Aufgaben auszuführen zu können.

### Windows PowerShell Versionen

Windows PowerShell gibt es in zwei verschiedenen Versionen. Die erste Version PowerShell „Legacy“ basiert auf dem aktuellen .Net-Framework und ist aktuell in der Build-Version 5.1 mit vollem Befehlssatz erhältlich.

Die zweite Version wird als PowerShell „Core“ bezeichnet und ist plattformunabhängig und basiert auf .Net-Core und hat aber einen eingeschränkten Befehlssatz. Hier ist die aktuelle Build-Version 6.1 (zum Zeitpunkt von diesem Beitrag) erhältlich.

### Unterschied Windows PowerShell und CMD

Der Unterschied, der gleich auffällt, wenn die beiden Eingabeaufforderungen gestartet werden, ist die unterschiedliche Farbe im Hintergrund. Hier hat die PowerShell-Eingabeaufforderung einen blauen Hintergrund und die gute alte CMD-Kommandozeile einen schwarzen Hintergrund. So weiß man gleich bei der Nutzung beider, in welcher Kommandozeile man sich aktuell befindet. 


![CMD-Batch](/images/posts/windows/CMD-Batch.jpg)
  
CMD-Batch
  
![Windows-PowerShell-](/images/posts/windows/Windows-PowerShell-Batch.jpg)
  
Windows-PowerShell-Batch
  

### Warum eine neue Kommandozeile?

Die PowerShell wird in Zukunft die Kommandozeile CMD ersetzen da diese auch über einen größeren Funktionsumfang verfügt beziehungsweise um diesen erweitert werden kann (Cmdlets). 

Die PowerShell ist generell zur Administration von Systemen unerlässlich, da gewisse Einstellungen generell nur über die Nutzung der Shell zu realisieren sind. So zum Beispiel bei der Administration von größeren Office 365 Bereitstellungen (Anlegen von Nutzern über CSV, etc.). 

Anders wie die meisten Befehlszeilen Shells, die Text akzeptieren und zurückgeben, akzeptiert die Windows PowerShell .NET-Framework-Objekte und setzt hier auf das .NET-Framework Common Language Runtime (CLR) sowie auf das .NET-Framework auf. Diese Änderung hat zufolge, dass für diesen Einsatz ein neues Befehlszeilentool nötig wurde und so entstand dann die Windows PowerShell. 

Durch die Kombination der Cmdlets hat diese Shell einen sehr mächtigen Funktionsumfang und kann durch die Nutzung der Windows PowerShell-Version Core auch systemübergreifend genutzt werden, um zum Beispiel auch Linux zu bedienen. 


## CMD-Befehle in der Übersicht

In diesem Beitrag beschäftige ich mich mit dem Kommandozeilen-Tool "CMD" und stelle hier eine Übersicht der meistgenutzten und wichtigsten Befehle für die Konsole zur Verfügung. Natürlich auch als PDF-Download für euch zum herunterladen.  
Einfach mal reinschauen...

[Beitrag lesen](/posts/windows/cmd-befehle-im-ueberblick/)

* * *

## Installieren der Windows PowerShell

Auf den meisten Betriebssystemen unter Windows (ab Windows 7 SP1 und Windows Server 2008 R2 SP1) ist eine Version der Windows PowerShell schon vorhanden, diese wird auch per Windows-Update aktualisiert oder es kann manuell ein Update per Kommandozeile angestoßen werden (wie das funktioniert, findest du weiter unten in diesem Beitrag).

### Aufrufen der Windows PowerShell

Das Aufrufen der PowerShell ist in allen Versionen der Windows-Desktop-Variante einfach. Hier müsst ihr nur auf das Windows-Logo oder Lupen-Symbol auf eurem Desktop klicken und im Suchfeld “PowerShell” eingeben.

Um den Windows-Script-Editor “PowerShell ISE" aufrufen zu können, müsst ihr ebenfalls auf das Windows-Logo oder Lupen-Symbol klicken und im Suchfeld “ISE” eingeben. 

### Aufrufen der Windows PowerShell unter Windows Server und Windows Server Core

In der Server-Core Variante gibt ihr einfach nach der Anmeldung am Server in das Eingabefenster “powershell” ein und bestätigt mit der Taste Eingabe / Return / Enter. Um das Konsolenfenster zu schließen, gibt ihr “exit” ein. 

## Installation Windows PowerShell Core unter Windows

Wichtig!    
Windows PowerShell installieren - Folgende Vorrausetzungen müssen vor der Installation erfüllt sein.   
Auf allen Systemen vor Windows 10 muss die Universal C-Runtime installiert sein. Diese kann über das Update oder direkt per Download installiert werden.   
Bei Systemen wie Windows 7 und Windows Server 2008 R2 (welches hoffentlich nicht mehr genutzt wird, da Supportende), installiert ihr Windows Management Framework (WMF) 4.0 oder höher.   
Eine Übersicht der WMF findet ihr hier: [WMF-Übersicht](https://docs.microsoft.com/de-de/powershell/wmf/overview)

### Installation via MSI-Paket

Die folgende Installation funktioniert für Client-Systeme ab Windows 7 SP1 und Windows Server 2008 R2 SP1. 

Das aktuelle PowerShell-MSI-Paket könnt ihr unter [**GitHub hier**](https://github.com/PowerShell/PowerShell/releases) herunterladen. Wenn ihr die Seite aufgerufen habt, dann wählt ihr den Abschnitt “Assets” aus und ladet euch das MSI-Paket herunter. Die MSI-Datei erkennt ihr unter der folgenden Bezeichnung: 

```powershell
PowerShell-<version>-win-<os-arch>.msi 
```

Die Installation von diesem Paket könnt ihr nach dem Download mit einem Doppelklick starten. 

Die PowerShell könnt ihr dann wie weiter oben beschrieben starten. 


### Windows PowerShell installieren über die Befehlszeile

Natürlich könnt ihr die Installation auch per Befehlszeile vornehmen. So könnt ihr die Installation ohne Benutzerinteraktion vornehmen. Die Befehlszeile, die ihr für eine mit allen aktivierten Installationsoptionen nutzen müsst, ist die folgende: 

```powershell
msiexec.exe /package PowerShell-<version>-win-<os-arch>.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 
```

Eine vollständige Liste der Befehlszeilenoptionen für „Msiexec.exe“ finden ihr unter [**Befehlszeilenoptionen**](https://docs.microsoft.com/de-de/windows/desktop/Msi/command-line-options). 

## Installieren von Windows PowerShell Core unter Linux

Wie Anfangs schon erwähnt, kann die PowerShell C## Video-Tutorial zu PowerShell auf Udemy

Ich kann euch wärmstens den Kurs von Tom Wechsler auf der Udemy-Plattform empfehlen. Das soll jetzt keine Werbung für Affiliate-Links sein, aber die Kurse von ihm sind echt super.  
Tipp! Öfter mal dort reinschauen, da es bei Udemy oft Rabatt-Aktionen gibt und ihr euch so einen Kurs für ein paar Euro schnappen könnt.

[Zum Video-Tutorial](https://secure-bits.org/ssgo)ore-Version mit eingeschränkten Funktionsumfang auch unter Linux genutzt werden. Daher darf hier eine Installationsanleitung natürlich nicht fehlen.  

In diesem Beispiel werde ich euch zeigen, wie ihr die Core-Version unter den drei folgenden Linux-Systemen installieren könnt: 

**Ubuntu 18.04 oder neuer, Debain 9 oder neuer und Kali Linux** 

Info:  
Es werden auch noch eine Menge anderer Distributionen unterstützt, aber hier jede einzelne Installationsanweisung aufzuführen, wäre zu viel des Guten.   
Ihr findet Hilfe zu den anderen Plattformen hier auf [dieser Seite von Microsoft.](https://docs.microsoft.com/de-de/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-6) 

### Windows PowerShell installieren - Installation unter Ubuntu 18.04 oder höher

Die Installation der PowerShell Core-Applikation erfolgt via Paketrepositorys und ist auch die bevorzugte Methode. Hierzu öffnet ihr als SuperUser ein Terminal-Instanz und dann läuft die Installation wie folgt ab: 

Den Anfang machen der Download und die Installation der Microsoft GPG-Keys 

```shell
# Download the Microsoft repository GPG keys 

wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb 

# Register the Microsoft repository GPG keys 

sudo dpkg -i packages-microsoft-prod.deb 
```

Nun folgt die eigentliche Installation... 

```shell
# Update the list of products 

sudo apt-get update 

# Enable the "universe" repositories 

sudo add-apt-repository universe 

# Install PowerShell 

sudo apt-get install -y powershell 
```

Nachdem du das Paket installiert hast, führe bitte “pwsh” über das Terminal aus. 

### Deinstallation unter Ubuntu 18.04 oder höher

Zur Deinstallation der PowerShell Core unter Ubuntu 18.04 gibt ihr die folgende Anweisung in das Terminal-Fenster ein:

```shell
sudo apt-get remove powershell
```

### Installation unter Debian 10 oder höher

Genau wie unter Ubuntu öffnet ihr als Superuser eine Terminal-Instanz und führt die Installation durch die Eingabe der folgenden Anweisungen aus:

```shell
# Install system components
sudo apt-get update
sudo apt-get install -y curl gnupg apt-transport-https

# Import the public repository GPG keys
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list'

# Update the list of products
sudo apt-get update

# Install PowerShell
sudo apt-get install -y powershell

# Start PowerShell
pwsh
```

Nach Abschluss der Installation führt ihr die PowerShell durch die Eingabe des Befehls "pwsh" aus.

### Deinstallation unter Debian 10 oder höher

Zur Deinstallation der PowerShell Core unter Debian 9 gibt ihr die folgende Anweisung in das Terminal-Fenster ein:

```shell
sudo apt-get remove powershell
```

### Installation unter Kali Linux

Zu guter letzt noch die Installation unter Kali Linux.

Ihr startet wieder eine Terminal-Instanz als SuperUser und gibt die folgenden Anweisungen ein:

```shell
# Download & Install prerequisites
wget http://ftp.us.debian.org/debian/pool/main/i/icu/libicu57_57.1-6+deb9u2_amd64.deb
dpkg -i libicu57_57.1-6+deb9u2_amd64.deb
apt-get update && apt-get install -y curl gnupg apt-transport-https

# Add Microsoft public repository key to APT
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

# Add Microsoft package repository to the source list
echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" | tee /etc/apt/sources.list.d/powershell.list

# Install PowerShell package
apt-get update && apt-get install -y powershell

# Start PowerShell
pwsh
```

### Deinstallation unter Kali

Zur Deinstallation der PowerShell Core unter Kali Linux gibt ihr die folgende Anweisung in das Terminal-Fenster ein:

```shell
# Uninstall PowerShell package
apt-get remove -y powershell
```

## Windows PowerShell installieren - Installation PowerShell Core unter macOS

Die Installation der Core-Version unter macOS ist natürlich auch möglich, aber bedarf ein wenig Vorbereitung und ist erst ab der macOS-Version 10.12 möglich. 

### Vorbereitung zur Installation der Core-Version unter macOS

Um die Installation unter macOS vornehmen zu können, ist es notwendig, vorab den Packet-Manager Homebrew auf dem System zu installieren, wenn dieser nicht auf eurem System installiert ist. Um herauszufinden ob sich der Paket-Manager auf eurem System befindet, könnt ihr dieses ganz einfach durch die Eingabe des Befehls “brew” in eurem Terminal-Fenster erledigen. Wird dieser Befehl nicht gefunden, so müsst ihr zuerst diesen Paket-Manager installieren. 

#### Paket-Manager Homebrew installieren (optional, wenn nicht vorhanden)

Die Installation von Homebrew ist recht simpel. Ihr müsst nur die folgende Anweisung in euer Terminal-Fenster eingeben und dann den Anweisungen folgen.

Nähere Informationen findet ihr auf der [**Seite von Homebrew**](https://brew.sh/index_de). 

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Nun kann die Installation auf macOS beginnen

Nach der erfolgreichen Installation von Homebrew auf euren Mac, können wir nun mit der Installation von Windows PowerShell Core beginnen. Hierfür gibt ihr in euer Terminal-Fenster die folgenden Anweisungen ein: 

```shell
brew cask install powershell
```

Ist die Installation durchgelaufen, solltet ihr jetzt die Installation auf Funktion testen. Daher startet die Windows PowerShell Core Installation durch den Befehl "pwsh".

Wollt ihr auf eine neuere Version umsteigen, dann könnt ihr das durch Eingabe der folgenden Anweisung durchführen:

```shell
brew update
brew cask upgrade powershell
```

### Abhängigkeiten für die PowerShell Installation installieren

Zum Abschluss müssen noch alle Abhängigkeiten die für die PowerShell-Installation notwendig sind, aktualisiert werden.

#### XCode-Befehslzeilentools

Zuerst beginnen wir damit, dass wir die XCode-Befehslzeilentools auf euer System installieren.

```shell
xcode-select --install
```

#### OpenSSL installieren

Danach kommt die Installation von OpenSSL dran. Das machen wir wieder über Brew

```shell
brew install openssl
```

Damit sind wir mit der Installation unter macOS durch und haben auch alle Abhängigkeiten hergestellt.

Möchtet ihr die PowerShell Core Installation wieder deinstallieren, dann geht wie folgt vor.

### Deinstallation PowerShell Core unter macOS

Zur Deinstallation gibt ihr die folgende Anweisung in Brew ein:

```shell
brew cask uninstall powershell
```

Damit ist PowerShell Core von eurem System verschwunden. Mit dem Befehl "sudo rm" könnt ihr dann noch die Pfade deinstallieren.

Die Pfade findet ihr beziehungsweise sind hier:

- `$PSHOME` ist `/usr/local/microsoft/powershell/6.2.0/`.
- Benutzerprofile werden über `~/.config/powershell/profile.ps1` gelesen.
- Standardprofile werden über `$PSHOME/profile.ps1` gelesen.
- Benutzermodule werden über `~/.local/share/powershell/Modules` gelesen.
- Freigegebene Module werden über `/usr/local/share/powershell/Modules` gelesen.
- Standardmodule werden über `$PSHOME/Modules` gelesen.
- Der Verlauf von „PSReadline“ wird in `~/.local/share/powershell/PSReadLine/ConsoleHost_history.txt` aufgezeichnet.

 ## Resümee

Hoffe der Beitrag kann euch bei eurem Vorhaben gut unterstützen!



<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://help.secure-bits.org/)
<!-- FM:Snippet:End -->