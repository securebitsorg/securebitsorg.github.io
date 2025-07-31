---
title: Windows Product Key aktivieren
description: Erfahren Sie, wie Sie Ihren Windows Product Key ganz einfach aktivieren und Ihre Produktivität mit diesen einfachen Schritten steigern können.
date: 2017-01-22
preview: ../../../assets/images/posts/windows/Windows Product Key.jpg
draft: false
tags:
  - cmd
  - powershell
  - windows
  - tutorials
categories:
  - Tutorials
  - “Windows”
hero: /images/posts/windows/Windows Product Key.jpg
menu:
  sidebar:
    name: Windows Product Key aktivieren
    identifier: windows-key
    parent: windows
keywords:
  - windows product key
slug: windows-product-key-aktivieren
---
> ### Andere Windows Versionen
> 
> Natürlich könnt ihr auf diese Weise auch bei jeder anderen Windows Version den Product Key ändern beziehungsweise aktivieren.  
Für die Aktivierung müsst ihr stattdessen natürlich euren Product Key dafür nutzen! Die im Artikel gezeigten Product Keys sind nur für die Verwendung der Windows Insider Preview geeignet!

## Windows Product Key aktivieren

Bei einem Inplace-Upgrade von Windows 10 Enterprise kann es vorkommen, dass Sie nach dem Upgrade aufgefordert werden, Windows neu zu aktivieren. Bei der erneuten Durchführung der Aktivierung wird diese mit einen Fehlercode beendet.  
Die folgende Anleitung soll euch zeigen wie ihr den Produkt Key ändern und dann eure Windows 10 Insider Preview oder auch jede andere Version von Windows aktivieren könnt.

## Windows Product Key auslesen

Den Produkt Key kannst du ganz einfach über die Kommandozeile (CMD) auslesen. Hierfür startest du die Kommandozeile oder die PowerShell wie weiter unten in diesem Artikel beschrieben mit Administrator-Rechte und gibst dann den folgenden Befehl ein.

```msdos
wmic path softwarelicensingservice get OA3xOriginalProductKey
```

Im Kommandozeilen-Fenster kannst du dann unter der ausgabe "OA3xOriginalProductKey" den hinterlegten 25-stelligen Produkt Key ansehen.


## Windows Product Key ändern

Für die Änderung des Produkt-Keys startest du das Kommandozeilentool (CMD) mit Administrationsrechten. Dies kannst du tun, in dem du in das Suchfeld den Befehl ‚CMD‘ eingibst und mit der rechten Maustaste das Kontextmenü öffnest und "Als Administrator ausführen" auswählst.

![cmd_aufrufen](/images/posts/windows/cmd_aufrufen.jpg)


Nach dem Öffnen der Kommandozeile gibst du den folgenden Befehl und den Produkt Key ein:

### Product Key Enterprise Version

```msdos
Slmgr.vbs /ipk PBHCJ-Q2NYD-2PX34-T2TD6-233PK (Enterprise-Version)
Slmgr.vbs /ipk "Euren Product Key" (von eurer Windows-Version)
```](https://secure-bits.org/wp-content/uploads/2017/07/Befehl_Key_aendern.jpg)

### Product Key Pro Version

```msdos
Slmgr.vbs /ipk NKJFK-GPHP7-G8C3J-P6JXR-HQRJR (Pro-Version)
Slmgr.vbs /ipk "Euren Product Key" (von eurer Windows-Version)
```
---
![windows product key aendern](/images/posts/windows/Befehl_Key_aendern.jpg)

---
Nun sollte Windows den Product Key auf den von dir eingegebenen Product Key aktualisiert haben.

## Windows Product Key aktivieren

Nach dem Tausch des Produkt Key muss dieser noch aktiviert werden. Diese Aktivierung erreichst du, in dem du im Eingabefenster des CMD den folgenden Befehl eingibst:

```msdos
slmgr.vbs /ato
```

---
![Windows Product Key aktivieren](/images/posts/windows/Befehl_Aktivierung.jpg)

---

Nach der Eingabe des oben genannten Befehls, wird nach kurzer Zeit Windows aktiviert und nun kannst du durch die Eingabe des Befehls ‚Exit‘ die Kommandokonsole verlassen.