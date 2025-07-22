---
title: FritzBox DNS Server ändern
hero: /images/posts/fritzbox/Video-FritzBox-Teil-3.png
descripton: FritzBox DNS Server ändern | In diesem Video zeige ich euch, wie ihr den öffentlichen DNS-Server einer Fritzbox ändern könnt.
menu:
  sidebar:
    name: Fritzbox den öffentlichen DNS-Server / Resolver ändern
    identifier: fritzbox-dns-resolver
    parent: fritzbox
date: 2022-06-20
categories: 
  - "Netzwerk"
  - "Security"
  - "Tutorials"
  - "Video"
tags: 
  - "firewall"
  - "fritzbox"
  - "netzwerk"
  - "security"
  - "tutorials"
  - "video"
---

## Video-Tutorial - Schütze deine Privatsphäre mit der FritzBox

In diesem Video "**FritzBox DNS Server ändern**" zeige ich, wie ihr durch die Verwendung von datenschutzkonformen öffentlichen DNS-Server, das Tracken eurer Internetnutzung durch euren Internetprovider verhindern könnt.

{{< youtube Q2b0VrDqluY >}} 

Gerne könnt ihr meinen YouTube-Kanal auch gleich Abonnieren und so verpasst ihr keine neuen Inhalte mehr.

### Liste der verwendeten DNS-Server im Video

Hier findet ihr die Übersicht der von mir verwendeten DNS-Server, dessen Betreiber sich dem Datenschutz seiner Nutzer verschrieben haben.

**Ich würde für mich persönlich aus sicherheitstechnischen Gründen einen DNS-Server mit DoT (DNS-over-TLS) vorziehen.**

#### digitale-gesellschaft.ch

```sh
IP-Adresse IPv4: 185.95.218.42
```

```sh
IP-Adresse IPv6: 2a05:fc84::42
```

```sh
DNS-Resolver DoT: dns.digitale-gesellschaft.ch
```

#### Freifunk München

```sh
IP-Adresse IPv4: 5.1.66.255
```

```sh
IP-Adresse IPv6: 2001:678:e68:f000::
```

```sh
DNS-Resolver DoT:   dot.ffmuc.net
```

### DNS-Leak Test

Um nach der Konfiguration eurer FritzBox die DNS-Konfiguration auf einen DNS-Leak zu überprüfen, könnt ihr einfach den DNS-Leak-Test von Perfect Privacy nutzen.

[http://dns-leak.com/](http://dns-leak.com/)



