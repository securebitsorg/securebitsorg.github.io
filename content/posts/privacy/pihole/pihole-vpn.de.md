---
title: Pihole VPN jetzt mit Wireguard im Jahr 2024 nutzen
date: 2024-02-27
hero: /images/posts/pihole/pihole-raspberry-vpn.png
menu:
  sidebar:
    name: Pi-hole mit WireGuard und piVPN
    identifier: pihole-vpn
    parent: pihole
categories:
  - Linux
  - Netzwerk
  - Security
  - Tutorials
  - Video
tags:
  - linux
  - pi-hole
  - security
  - tutorials
  - video
description: Pihole VPN jetzt mit Wireguard nutzen | In diesem Tutorial zeige ich euch, wie ihr Pihole mit Hilfe von VPN auch von Unterwegs aus nutzen könnt
keywords:
  - pihole vpn
---

## Pihole VPN - Keine Werbung auf dem Smartphone

In diesem Tutorial '**pihole VPN mit Wireguard**' möchte ich euch gerne zeigen, wie ihr via die Applikation '**PiVPN**', euren **Pihole** auf dem **Smartphone, Tablet oder Laptop** und somit die Vorteile von Pihole , nämlich ohne lästige Werbung zu surfen, von **unterwegs** aus auch nutzen könnt.

Wie das alles funktioniert, zeige ich euch in meinem Video auf meinem YouTube-Kanal!

Inhaltsverzeichnis

- [Pihole VPN - Keine Werbung auf dem Smartphone](#pihole-vpn---keine-werbung-auf-dem-smartphone)
  - [Voraussetzungen für dieses Tutorial](#voraussetzungen-für-dieses-tutorial)
  - [Hinweis](#hinweis)
- [Video-Tutorial zum Thema 'pihole VPN mit Wireguard'.](#video-tutorial-zum-thema-pihole-vpn-mit-wireguard)
- [Befehle zum Einrichten von Pi-hole, PiVPN und WireGuard](#befehle-zum-einrichten-von-pi-hole-pivpn-und-wireguard)
  - [Bitte beachten!](#bitte-beachten)
  - [Pihole VPN - Installation der UFW-Firewall](#pihole-vpn---installation-der-ufw-firewall)
  - [Pihole VPN - Installation und Einrichtung von PiVPN auf dem Raspberry Pi](#pihole-vpn---installation-und-einrichtung-von-pivpn-auf-dem-raspberry-pi)
    - [PiVPN WireGuard - Befehlsliste](#pivpn-wireguard---befehlsliste)
  - [Zusätzliche Informationen zum Thema 'Pi-hole VPN'](#zusätzliche-informationen-zum-thema-pi-hole-vpn)

### Voraussetzungen für dieses Tutorial

Damit ihr bei der Einrichtung eines VPN-Servers zusammen mit Pi-hole ein leichtes Spiel habt, muss euer Setup die folgenden Voraussetzungen erfüllen.

### Hinweis

**Solltet ihr diese Voraussetzungen nicht erfüllen, dann könnt ihr hier die einzelnen Voraussetzungen nachbauen:**

[Pi-hole installieren](https://secure-bits.org/pi-hole-auf-einen-raspberry-pi-installieren/ "Pihole installieren auf einem Raspberry Pi")

[Pi-hole und Fritzbox](https://secure-bits.org/fritzbox-pi-hole-fritzbox-konfigurieren/ "Fritzbox für Pihole konfigurieren")

DynDNS mit DuckDNS

Optional würde ich euch empfehlen, den SSH-Zugang

[SSH-Zugang absichern](https://secure-bits.org/tutorial-linux-ssh-absichern-hardening-in-2024/ "SSH-Zugang absichern")

- **Fertige und lauffähige Pi-Hole Instanz auf einem Raspberry Pi oder ähnlich (VM, Banana Pi,...).**

- **Der Pi-hole ist als interner DNS-Server bei eurer Fritzbox eingerichtet**

- **Ihr habt eine DynDNS-Adresse in eurer Fritzbox eingerichtet (z.B. DuckDNS)**

Optional:

- **SSH-Zugang absichern**

## Video-Tutorial zum Thema 'pihole VPN mit Wireguard'.

{{< youtube 4N0fkV7nS6k >}}

## Befehle zum Einrichten von Pi-hole, PiVPN und WireGuard

Alle Befehle die ich im Video zur Installation von **PiVPN** sowie zur Konfiguration von **Pi-hole** und **WireGuard** nutze, habe ich euch hier in einer chronologischen Reihenfolge aufgeführt.

### Bitte beachten!

In diesem Blog-Post sind nur die Befehle zur Installation und Einrichtung von PiVPN zusammengefasst mit Pi-hole zusammengefasst. **Die einzelnen Einrichtungsschritte seht ihr im Video!**

### Pihole VPN - Installation der UFW-Firewall

Zu Absicherung des Raspberry Pi mit Pi-hole und PiVPN, wird die UFW-Firewall auf dem System installiert sowie konfiguriert.

```bash
# Installation UFW-Firewall

sudo apt install ufw

# Konfiguration der UFW-Firewall

sudo ufw allow 80,53,67/tcp 

# Den SSH-Zugang nur von eurem internen Netzwerkbereich erlauben. Wichtig!!! Den IP-Adressbereich (im Beispiel hier 192.168.178.0/24) eurem Netzwerkbereich ggf. anpassen

sudo allow from 192.168.178.0/24 to any port 22/tcp<figcaption>

sudo ufw allow 53,67,58120/udp # 51820 ist der Port für WireGua<figcaption>

# Bei Nutzung von IPv6

sudo ufw allow 546:547/udp

# Aktivierung der Firewall
# Bitte beachten, dass der richtige Port für SSH oben in den Regeln hinterlegt ist! Ansonsten sperrt ihr euch via SSH aus!

sudo ufw enable 

```

### Pihole VPN - Installation und Einrichtung von PiVPN auf dem Raspberry Pi

Hier die Befehle zur Installation von PiVPN auf dem Raspberry Pi.

```bash
# Befehl zur Installation von PiVPN

sudo curl -L https://install.pivpn.io | bash

```

#### PiVPN WireGuard - Befehlsliste

Hier die Liste alle Befehle für die Konfiguration von WireGuard unter PiVPN sowie das PiVPN-Paket selbst.

```bash
# Liste aller Befehle für PiVPN WireGuard

pivpn -a   -> Client erstellen

pivpn -c   -> Liste aller verbundenen Clients 

pivpn -d   -> Starten einer Debugging-Sitzung für die Fehlersuche

pivpn -l   -> Liste aller konfigurierten Clients

pivpn -qr  -> Anzeigen eines QR-Codes für die Konfiguration eines mobilen Clients (z.B. Handy, Tablet mit der WireGuard-App)

pivpn -r   -> Einen Client löschen

pivpn -h   -> Zeigt den Hilfe-Dialog an

pivpn -u   -> Deinstallieren von PiVPN

pivpn -up  -> PiVPN aktualisieren

pivpn -bk  -> Erstellen einer Sicherung der VPN-Konfigurationen und Nutzerprofile

```

### Zusätzliche Informationen zum Thema 'Pi-hole VPN'

Für weitere Informationen zu diesem Thema, habe ich hier einige Links zusammengestellt:

**Alles über WireGuard:**

[https://www.wireguard.com/](https://www.wireguard.com/)

**Alles über PiVPN:**

[https://docs.pivpn.io/](https://docs.pivpn.io/)

[https://github.com/pivpn/pivpn](https://github.com/pivpn/pivpn)
