---
title: MAC Adresse - Was ist das?
date: 2019-02-15
categories:
  - Netzwerk
  - Tutorials
tags:
  - firewall
  - netzwerk
  - security
  - tutorials
description: Was ist eine MAC-Adresse und wofür wird diese verwendet?
preview: ../../../assets/images/posts/it-security/mac_adressen.jpg
hero: /images/posts/it-security/mac_adressen.jpg
menu:
  sidebar:
    name: Was ist eine MAC-Adresse und wofür wird diese verwendet?
    identifier: mac
    parent: security
keywords:
  - mac adresse
---

## MAC Adressen 

Was ist eine **MAC Adresse** und wofür wird diese gebraucht? Diese Fragen und weitere Begriffe und Funktion rund um das Thema MAC Adressen möchte ich gerne in diesem Artikel erklären. 

## Was ist eine MAC Adresse? 

Zur Identifikation eines netzwerkfähigen Geräts (Host) im Netzwerk dient die **MAC Adresse**. Diese Adresse ist in eigentlich einmalig (dazu später mehr) und stellt die eindeutige Adressierbarkeit eines Geräts sicher.  

## Aufbau

Diese Adresse besteht aus einer 48-Bit langen Adresse und sollte weltweit einmalig sein. Diese Adresse wird im OSI-Modell der Sicherungsschicht 2 (Data-Link-Layer) zugeordnet um eine Adressierung im Netzwerk zu gewährleisten.  

Dargestellt wird die Adresse in der Regel in der hexadezimalen Schreibweise (siehe Bild “Aufbau einer MAC-Adresse") und wird in Bytes getrennt durch einen Doppelpunkt oder Bindestrich dargestellt. Diese Schreibweise / Darstellungsweise nennt man das _kanonisches Format_ und wird in der Regel auch zur Darstellung verwendet.


![MAC-Address Aufbau](/images/posts/it-security/Unbenanntes-Diagramm.jpg)


Aufbau einer MAC Adresse



Die ersten 24 Bit sind fest den verschiedenen Herstellern (Herstellerkennung) zugeordnet und werden von der IEEE (Institute of Electrical and Electronics Engineers) vergeben. Diese Herstellerkennung wird auch Organizationally Unique Identifier (OUI) genannt und kann Online in einer Hersteller-Datenbank abgerufen werden. 

Die hinteren 24 Bit wird als Organizationally Unique Address (OUA) bezeichnet und können vom Hersteller frei, aber nur einmalig für die Geräteklasse vergeben werden. 

## Broadcast Adresse

Als Broadcast Adresse wird eine Pseudo-Adresse bezeichnet, wo alle 48 Bits auf "1" geschaltet sind,

**Broadcast Cast MAC-Adresse:**

```sh
ff-ff-ff-ff-ff-ff und in Bit-Form 11111111 11111111 11111111 11111111 11111111 11111111	
```

und im LAN an alle Geräte verschickt wird, aber nicht in andere LAN´s gesendet werden kann.

### Link zur Hersteller Datenbank von der IEEE: 

[https://regauth.standards.ieee.org/standards-ra-web/pub/view.html#registries](https://regauth.standards.ieee.org/standards-ra-web/pub/view.html#registries)

## Eigene MAC-Adresse anzeigen 

Um die Adresse von eurem Gerät anzuzeigen gibt es ja nach Betriebssystem verschiedene Befehle die ihr in der Kommandozeile (CMD, Powershell, Shell) eingeben könnt. Die Befehle zur Anzeige der Adresse lauten für die einzelnen Systeme wie folgt: 

### Windows physikalische Adresse

Zuerst mit der Tastenkombination Windows-Taste+R die Kommandozeile (CMD) öffnen und dann den folgenden Befehl eingeben:

```msdos
ipconfig /all
```



### Eigene Adresse unter FreeBSD anzeigen

```sh
ipconfig -a
```

### Eigene Adresse unter Linux anzeigen

```sh
ip a

ip link show <Gerät>
```

Wichtig ist generell, dass man natürlich auch das richtige Netzwerkgerät ausliest, da die Rechner meistens mehrere Netzwerkadapter besitzen (z.B. WLAN).

Solltet ihr die IP-Adresse trotz der oberen Befehle nicht auslesen können, dann nutzt ein Crossover-Kabel das ihr mit einem Rechner verbindet. Somit sind dann beide Geräte im gleichen Netzwerksegment und nutzt dann die folgenden Befehle:

#### Windows

```msdos
arp -a
```

#### FreeBSD

```sh
arp -a
```

#### Linux

```sh
arp -a
ip neigh
```


## Ändern einer MAC-Adresse 

Das ändern der Adresse kann in manchen Situationen sinnvoll sein. Wenn du zum Beispiel ein Hochverfügbarkeitsszenario nutzen möchtest, dann kann das ändern der Adresse sehr sinnvoll sein. Sollte in einem Redundanz-Verbund ein Server ausfallen, so kann durch das Ändern der MAC-Adresse auf dem Ersatzserver, ein umständliches umkonfigurieren des Systems dadurch erspart bleiben. Genauso kannst du auch andere Ersatzgeräte im Netzwerk so umstellen.

### Die folgenden Befehle kannst du hierfür nutzen

#### Windows

```msdos
Registery-Eintrag ändern oder auch falls angeboten in der Systemsteuerung
```

#### Linux

```sh
ifconfig <Device> hw ether <MAC-Adresse neu>
```

#### FreeBSD

```sh
ifconfig <Device> link <MAC-Adresse neu>
```

## ARP-Spoofing (böswilliges ändern) 

Zu guter Letzt gehe ich hier noch auf das böswillige ändern einer MAC-Adresse ein. Diese Methode wird bei Man-in-the-Middle Attacken genutzt.

Hier wird auch die Adresse im ARP-Cache gesetzt und so eine manipulierte ARP-Nachricht von Host A an Host B verschickt. Diesem Host B wird somit die Adresse des Angriffs-Device untergejubelt, wobei dieser wiederum alle zukünftigen Pakete an den Angreifer-Gerät sendet und nicht vorgesehen an Host A.

Solch ein kompromittierten ARP-Cache ist gut dadurch erkennbar, dass alle IP-Adressen auf eine MAC-Adresse zeigen. Ein Beispiel siehst du im nächsten Abschnitt.

### Beispiel für ein ARP-Spoofing im ARP-Cache> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen.  Sie können dort auch gerne Ihre eigene Frage stellen.


```sh
RE1:~# arp -a
? (192.168.1.10) auf 00:2c:33:2f:7e:88 [ether] auf eth0
? (192.168.1.11) auf 00:2c:33:2f:7e:88 [ether] auf eth0
? (192.168.1.12) auf 00:2c:33:2f:7e:88 [ether] auf eth0
? (192.168.1.13) auf 00:2c:33:2f:7e:88 [ether] auf eth0
```

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->
