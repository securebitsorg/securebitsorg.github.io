---
hero: /images/posts/linux/traceroute.png
preview: ../../../assets/images/posts/linux/traceroute.png
title: Der traceroute-Befehl unter Linux
description: "Der traceroute-Befehl unter Linux: Umfassende Anleitung mit Beispielen"
menu:
    sidebar:
        name: Der traceroute-Befehl unter Linux mit Umfassende Anleitung mit Beispielen
        identifier: traceroute
        parent: linux-befehle
date: 2025-07-30T09:18:12.930Z
lastmode: 2025-07-30T09:18:16.581Z
keywords:
    - traceroute
    - traceroute befehl
tags:
    - linux
    - netzwerk
    - tutorials
categories:
    - Linux
    - Tutorials
    - Netzwerk
---
## Der traceroute-Befehl unter Linux mit Umfassende Anleitung mit Beispielen

Der `traceroute`-Befehl ist ein unverzichtbares Netzwerk-Diagnosetool für IT-Sicherheitsmanager und Systemadministratoren. Er ermöglicht die Verfolgung des Weges, den Datenpakete von Ihrem System zu einem Ziel im Netzwerk nehmen, und hilft dabei, Netzwerkprobleme zu identifizieren und zu beheben.
Daher möchte ich euch in diesem Artikel die Funktionalität von **traceroute** ein wenig näher bringen.

## Was ist traceroute?

**traceroute** ist ein Kommandozeilen-Tool, das den Transportweg von IP-Datenpaketen zwischen dem lokalen Rechner und einer ausgewählten Gegenstelle ermittelt. Dabei wird die Antwortzeit der durchlaufenen Router gemessen, was bei der Identifizierung von Verzögerungen und Netzwerkproblemen hilft.

## Funktionsweise von traceroute

Das Tool nutzt das **Time-to-Live (TTL)**-Feld in IP-Paketen auf clevere Weise:

1. **Erste Sonde**: traceroute sendet ein Paket mit TTL=1 zum Ziel.
2. **Router-Antwort**: Der erste Router reduziert TTL auf 0 und sendet eine "Time Exceeded"-Nachricht zurück.
3. **Identifikation**: traceroute notiert die IP-Adresse dieses Routers.
4. **Wiederholung**: Der TTL-Wert wird um 1 erhöht und der Vorgang wiederholt sich.
5. **Zielerreichung**: Dies geschieht solange, bis das Ziel erreicht oder das Maximum von 30 Hops erreicht wird.

Standardmäßig sendet traceroute **drei Sondenpakete** pro Hop und zeigt die Antwortzeiten in Millisekunden an.

## Installation von traceroute

Traceroute ist nicht auf allen Linux-Distributionen standardmäßig installiert. Die Installation erfolgt über den Paketmanager:

### Ubuntu/Debian-basierte Systeme:

```bash
sudo apt update
sudo apt install traceroute
```


### CentOS/RHEL/Fedora:

```bash
sudo yum install traceroute
# oder auf neueren Systemen:
sudo dnf install traceroute
```


### Überprüfung der Installation:

```bash
traceroute --version
```


## Grundlegende Verwendung

### Einfacher traceroute-Befehl:

```bash
traceroute google.com
```

**Beispielausgabe:**

```bash
traceroute to google.com (172.217.23.14), 30 hops max, 60 byte packets
 1  10.8.8.1 (10.8.8.1)  14.499 ms  15.335 ms  15.956 ms
 2  h37-220-13-49.host.redstation.co.uk (37.220.13.49)  17.811 ms  18.669 ms/images/posts/linux/traceroute.png  19.346 ms
 3  92.zone.2.c.dc9.redstation.co.uk (185.20.96.137)  19.096 ms  19.757 ms  20.892 ms
```


### Interpretierung der Ausgabe:

- **Erste Zeile**: Zielhost, IP-Adresse, maximale Hops (30), Paketgröße (60 Bytes)
- **Jede Hop-Zeile**: Hop-Nummer, Hostname/IP-Adresse, drei Antwortzeiten in Millisekunden


## Praktische Anwendungsbeispiele

### 1. Traceroute mit IPv4 erzwingen:

```bash
traceroute -4 google.com
```


### 2. Traceroute mit IPv6:

```bash
traceroute -6 google.com
```


### 3. ICMP-Pakete verwenden (statt UDP):

```bash
traceroute -I google.com
```


### 4. TCP-basiertes traceroute (für Firewall-Umgehung):

```bash
traceroute -T -p 80 google.com
```


### 5. Ohne Namensauflösung (schneller):

```bash
traceroute -n google.com
```


### 6. Maximale Hop-Anzahl begrenzen:

```bash
traceroute -m 15 google.com
```


### 7. Anzahl der Sonden pro Hop ändern:

```bash
traceroute -q 1 google.com
```


### 8. Wartezeit anpassen:

```bash
traceroute -w 3 google.com
```


### 9. Bestimmtes Interface verwenden:

```bash
traceroute -i eth0 google.com
```


### 10. MTU-Erkennung:

```bash
traceroute --mtu google.com
```


## Unterschiede zwischen verschiedenen Traceroute-Methoden

### UDP (Standard unter Linux):

- Verwendet "unwahrscheinliche" Ports (33434-33534)
- Zielhost antwortet mit "ICMP Port Unreachable" bei Erreichen


### ICMP (mit -I Option):

- Verwendet ICMP Echo Request-Pakete
- Ähnlich wie ping, aber mit TTL-Manipulation


### TCP (mit -T Option):

- Verwendet TCP SYN-Pakete
- Nützlich zum Umgehen von Firewalls
- Standard-Port: 80 (HTTP)


## Übersicht aller traceroute-Optionen

![Übersicht aller verfügbaren traceroute-Optionen mit Beschreibungen und Beispielen](/images/posts/linux/traceroute.png)

Übersicht aller verfügbaren traceroute-Optionen mit Beschreibungen und Beispielen

## Fehlerbehebung und häufige Probleme

### Asterisk (*) in der Ausgabe:

- Bedeutet: Keine Antwort innerhalb der Wartezeit
- Mögliche Ursachen: Firewall, Router-Konfiguration, Überlastung


### Zusätzliche Annotationen:

- **!H**: Host unreachable
- **!N**: Network unreachable 
- **!P**: Protocol unreachable
- **!F**: Fragmentation needed
- **!X**: Communication administratively prohibited 


### Performance-Optimierung:

```bash
# Für stabilere Ergebnisse bei problematischen Verbindungen:
traceroute -N 1 -w 5 google.com

# Für schnellere Ergebnisse ohne DNS-Auflösung:
traceroute -n google.com
```


## Unterschiede zu Windows tracert

Während Linux `traceroute` standardmäßig **UDP-Pakete** verwendet, nutzt Windows `tracert` **ICMP-Pakete**. Um unter Linux dasselbe Verhalten wie unter Windows zu erzielen, verwenden Sie:

```bash
traceroute -I google.com
```


## Erweiterte Verwendung für IT-Sicherheit

### AS-Path Lookups für Routing-Analyse:

```bash
traceroute -A google.com
```


### Firewall-Tests mit verschiedenen Ports:

```bash
traceroute -T -p 443 bank-website.com  # HTTPS
traceroute -T -p 25 mail-server.com    # SMTP
```


### Netzwerk-Segmentierung prüfen:

```bash
traceroute -s 192.168.1.100 internal-server.com
```


## Best Practices für IT-Sicherheitsmanager

1. **Kombinieren Sie traceroute mit anderen Tools**: Nutzen Sie ping und mtr für umfassende Diagnosen
2. **Dokumentieren Sie Baselines**: Speichern Sie normale traceroute-Ergebnisse für Vergleiche
3. **Überwachen Sie kritische Pfade**: Regelmäßige traceroute-Tests zu wichtigen Servern
4. **Beachten Sie Datenschutz**: traceroute kann Netzwerkstrukturen preisgeben
5. **Verwenden Sie verschiedene Methoden**: TCP, ICMP und UDP für vollständige Sicht

## Fazit | traceroute unter Linux
Der traceroute-Befehl ist ein mächtiges Werkzeug für die Netzwerkdiagnose und sollte in jedem IT-Sicherheits-Toolkit vorhanden sein. Mit dem Verständnis seiner verschiedenen Optionen und Anwendungsmöglichkeiten können Sie Netzwerkprobleme effizient identifizieren und beheben.

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->
