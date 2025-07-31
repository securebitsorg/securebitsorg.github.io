---
title: ipconfig-befehl
description: In diesem Tutorial zeicge ich euch, wie ihr den ipconfig Befehl nutzen könnt. 
hero: /images/posts/windows/ipconfig_all.png
date: 2025-07-23T07:50:18.409Z
menu:
  sidebar:
    name: Der ipconfig-Befehl in der Übersicht
    identifier: ipconfig
    parent: windows
draft: false
tags:
  - cmd
  - netzwerk
  - powershell
  - windows
  - tutorials
categories:
  - Windows
  - Tutorial
  - Netzwerk
preview: ../../../assets/images/posts/windows/ipconfig_all.png
keywords:
  - ipconfig
---
Eine Übersicht aller CMD Befehle findet ihr in** [**_diesem Artikel_**](https://secure-bits.org/cmd-befehle-unter-windows-im-ueberblick/)**.**

## ipconfig Befehle im Überblick

Wer oft Veränderungen an der IP-Adresse oder an der DNS-Auflösung vornimmt, weil zum Beispiel mehrere DNS-Server genutzt werden, der kennt das Problem, dass das Konfigurieren der Netzwerkadapter über die normalen Boardmittel (Gui) nicht gerade komfortabel ist. Hierfür bittet sich die Steuerung per Kommandozeile (CMD oder Powershell) an. Welche Befehle unter anderem der Befehl **ipconfig** hier für die einzelnen Aktionen zur Veränderung der Einstellungen der Netzwerkadapter vorhanden sind, soll diese Übersicht zeigen.  
In dieser Übersicht wird die Eingabeaufforderung **CMD** genutzt. Diese Eingabeaufforderung wird durch das Eintippen von ‚cmd‘ im Suchfeld von Windows aufgerufen. Das Suchfeld kann am schnellsten durch die Tatenkombination **Windows-Taste + R** aufgerufen werden.

### Ipconfig /all

Um einen Überblick zu erhalten welche physikalischen Adressen die genutzten IP-Adressen, welcher DHCP Server sowie welcher DNS Server für die einzelnen Netzwerkadapter genutzt wird, können mit dem Befehl **ipconfig /all** angezeigt werden.

![ipconfig_all](/images/posts/windows/ipconfig_all.png)

### Ipconfig /flushdns

Mit diesem Befehl kann der DNS-Auflösungscache geleert werden. Dies Funktion ist nützlich, wenn es zum Beispiel Probleme mit der DNS-Auflösung gibt weil die Einstellungen des DNS-Server geändert wurden und so mit Hilfe von diesem Befehl, eine neue Abfrage der DNS-Server-Einstellungen in die Wege leitet.

![ipconfig_flushdns](/images/posts/windows/ipconfig_flushdns.png)


### Ipconfig /renew

Der Befehl **ipconfig /renew** wird für IPv4-Adressbereiche sowie der Befehl **ipconfig /renew6** für IPv6-Adressbereiche benutzt, dass die IP-Adresse für die Netzwerkadapter, die über das Protokoll TCP/IP angebunden sind, neu angefordert werden.

![ipconfig_renew](/images/posts/windows/ipconfig_renew.png)

<figure>

<figcaption>

ipconfig /help
### Ipconfig /release

Um vorhandene IP-Adressen der Netzwerkadapter freizugeben, wird dieser Befehl für IPv4-Adressbereiche oder **ipconfig /release** für IPv6 genutzt. Um dann eine neue IP-Adresse via DHCP zu bekommen, nutzt ihr den vorherigen Befehl <**ipconfig /renew**\>.

![ipconfig_release](/images/posts/windows/ipconfig_release.png)


### Ipconfig /displaydns

Um sich den Inhalt des DNS-Auflösungscache anzuzeigen, wird dieser Befehl genutzt.

![ipconfig_displaydns (Ausschnitt aus dem Ausgabefenster)](/images/posts/windows/ipconfig_displaydns.png)


### Adressierung von Netzwerkadapter

Es gibt für die meisten ipconfig-Befehle auch die Möglichkeiten, die einzelnen Netzwerkadapter direkt zu Adressieren. Hierfür wird dem Grundbefehl der Name des Netzwerkadapters hinter dem eigentlichen ipconfig-Befehl angehangen (Beispiel: `ipconfig /renew Name\_Netzwerkadapter`). Bei mehreren Netzwerkadaptern können diese auch durch den Zusatz `\*Net\` (führt den Befehl bei allen Netzwerkadaptern die ‚Net‘ im Namen haben aus) oder `Ne\*` (führt den Befehl bei allen Netzwerkadaptern die mit ‚Ne‘ im Namen beginnen aus) eingegrenzt werden.

Eine Übersicht über alle Varianten die mit dem Befehl ipconfig zur Verfügung stehen werden mit den Befehlen **ipconfig /help** oder **ipconfig /?** aufgelistet.

![ipconfig_help](/images/posts/windows/ipconfig_help.png)

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->
