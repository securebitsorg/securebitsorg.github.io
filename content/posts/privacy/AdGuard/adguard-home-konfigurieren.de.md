---
title: AdGuardHome-Setup - Basis-Konfiguration
descripton: AdGuardHome-Setup | AdGuardHome richtig konfigurieren und einrichten um dein Netzwerk zu schützen.
hero: /images/posts/adguard/Thumbnail.png
date: 2022-09-19
menu:
  sidebar:
    name: AdGuardHome-Setup – Basis-Konfiguration
    identifier: adguard-config
    parent: adguard
categories: 
  - Linux
  - Netzwerk
  - Security
  - Tutorials
  - Video
tags: 
  - adguard
  - linux
  - netzwerk
  - security
  - tutorials
  - video
---
## AdGuardHome-Setup - Konfigurieren um dein Netzwerk vor Werbung und Trackern zu schützen

Im heutigen Tutorial '**AdGuard konfigurieren**' möchte ich euch zeigen, wir ihr nach der Installation von AdGuard ([hier zur Anleitung](https://secure-bits.org/adguard-raspberry-pi-installation-2022/)), die **AdGuard Basis-Konfiguration** auf euren Raspberry Pi durchführen könnt.

In diesem Tutorial-Video zeige ich euch, wie ihr die folgenden Einstellungen vornehmen könnt.

- DNS konfigurieren
    

- Sperrlisten anlegen
    

- Netzwerkweite Sperrung von Applikationen (Soziale Netzwerke und andere Dienste)
    

- Protokolle verstehen
    

- Und vieles mehr
    

### Video-Tutorial - AdGuardHome-Setup konfigurieren | Basis-Konfiguration

**Hier könnt ihr euch das Video-Tutorial auf meinem YouTube-Kanal anschauen.**

**Hierzu einfach auf das untere Bild klicken.**

{{< youtube M-O00xQ23mk >}}

### Alternative zu 'AdGuard Raspberry Pi Installation' gesucht?

Dann schaut euch doch meine Schritt für Schritt-Anleitung an, wie ihr den DNS-Server **Pi-hole** auf einen Raspberry PI installieren könnt.

Zum Tutorial

## Schritt für Schritt | AdGuard Raspberry Pi Installieren

### Installation AdGuard auf einen Raspberry Pi

Hier findet ihr eine Schritt- für Schritt-Anleitung für die Installation von AdGuard Home auf einen Raspberry Pi.

Zum Tutorial

## Zusammenfassung - AdGuard Raspberry Pi Installation

Mit dieser AdGuard Basis-Konfiguration ist euer AdGuard-DNS-Server für das Erste konfiguriert.

Weitere Konfigurationen wie DNS over https uns so weiter, werde ich euch in separaten Videos / Beiträgen zeigen.

## Blacklist-Empfehlungen - AdGuard Raspberry Pi Installation

Mit den vorgestellten Blacklists habe ich bisher sehr gute Erfahrungen gemacht und möchte diese daher gerne weiterempfehlen.

### Blacklist SteveBlack

Diese Liste ist sehr umfassend und hat zurzeit circa 150000 Einträge enthalten.

Kategorien:

- Porn

- Adware

- Malware

- Fakenews

- Gambling (verdächtige Hosts)

- Social+

[https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts](https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts)

### Blacklist adaway.org

Werbeblocker

[https://adaway.org/hosts.txt](https://adaway.org/hosts.txt)

### Blacklist SmartTV-Tracking

Name ist Programm

[https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt](https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt)

### Blacklist EasyPrivacy

Tracking und Telemetrie

[https://v.firebog.net/hosts/Easyprivacy.txt](https://v.firebog.net/hosts/Easyprivacy.txt)
# Hardware-Empfehlungen - AdGuard Raspberry Pi Installation

**Raspberry Pi 4 Bundle**

**SD-Card-Reader**

**SD-Karte**
### Blacklist EasyList

Werbeblocker

[https://v.firebog.net/hosts/Easylist.txt](https://v.firebog.net/hosts/Easylist.txt)

### Blacklist Telemetrie Microsoft / Windows

Vermeidung Telemetrie Erfassung von Microsoft-Produkte

[https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt](https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt)

### Weiterführende Links zum Thema

**Raspberry Pi OS Imager**

[https://downloads.raspberrypi.org/imager/imager\_latest.exe](https://downloads.raspberrypi.org/imager/imager_latest.exe)

## Vertrauenswürdige DNS-Server - AdGuard Raspberry Pi Installation

Hier eine Auflistung von datenschutzkonformen DNS-Server-Provider, die kein Logging betreiben und zensurfrei sind.

**Ich würde für mich persönlich aus sicherheitstechnischen Gründen einen DNS-Server mit DoT (DNS-over-TLS) vorziehen.**

_Danke an [privacy-handbuch.de](https://www.privacy-handbuch.de/) für die Auflistung der DNS-Server._

### Freifunk München (normales DNS, DNS-over-TLS und DNS-over-HTTPS)

```sh
IPv4: 5.1.66.255
IPv6: 2001:678:e68:f000::
Servername: dot.ffmuc.net
IPv4: 185.150.99.255
IPv6: 2001:678:ed0:f000::
Servername: dot.ffmuc.net
```

### Digitale Gesellschaft (CH) (DNS-over-TLS und DNS-over-HTTPS!)

```sh
IPv4: 185.95.218.42
IPv6: 2a05:fc84::42
Servername: dns.digitale-gesellschaft.ch
IPv4: 185.95.218.43
IPv6: 2a05:fc84::43
Servername: dns.digitale-gesellschaft.ch
```

### Censurfridns Denmark (aka. UncensoredDNS)
# Hardware-Empfehlungen - AdGuard Raspberry Pi Installation

**Raspberry Pi 4 Bundle**

**SD-Card-Reader**

**SD-Karte**
```sh
IPv4: 91.239.100.100
IPv6: 2001:67c:28a4::
IPv4: 89.233.43.71
IPv6: 2a01:3a0:53:53::
(mit DNS-over-TLS)
```

