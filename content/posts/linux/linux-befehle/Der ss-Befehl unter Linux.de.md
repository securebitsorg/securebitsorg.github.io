---
title: Der ss-Befehl unter Linux
description: Der ss-Befehl und seine Parameter unter Linux in der Übersicht
date: 2025-08-11T06:22:35.618Z
menu:
    sidebar:
        name: Der ss-Befehl und seine Parameter unter Linux in der Übersicht
        identifier: ss-linux-de
        parent: linux-befehle
keywords:
    - ss linux
    - ss
tags:
    - linux
    - netzwerk
    - tutorials
categories:
    - Linux
    - Netzwerk
    - Tutorials
preview: ../../../../assets/images/posts/linux/linux-commands/ss-befehl-linux.webp
hero: /images/posts/linux/linux-commands/ss-befehl-linux.webp
---
In diesem Überblick möchte ich euch eine Anleitung zum Befehl `ss` geben, die einzelnen **Parameter** zu `ss` erklären und wie ihr diese in eurer Linux-Umgebung verwenden könnt.

## Was ist der ss-Befehl und wofür nutzt man diesen?
Der **ss**-Befehl (Socket Statistics) ist ein modernes, leistungsstarkes Kommandozeilen-Tool unter Linux zur Anzeige detaillierter Netzwerk- und Socket-Statistiken. Als offizieller Nachfolger des veralteten **`netstat`-Befehls** bietet ss eine schnellere Performance, erweiterte Funktionen und umfassendere Informationen über Netzwerkverbindungen.

## Installation und Verfügbarkeit

Der ss-Befehl ist Teil des **iproute2**-Pakets und in den meisten modernen Linux-Distributionen standardmäßig installiert. Falls nicht vorhanden:

```bash
# Ubuntu/Debian
sudo apt-get install iproute2

# CentOS/RHEL/Fedora
sudo yum install iproute2
# oder bei neueren Versionen:
sudo dnf install iproute2
```


## Grundlegende Syntax

```bash
ss [Optionen] [FILTER]
```

Ohne Optionen zeigt ss eine Liste aller offenen, nicht-abhörenden Sockets mit etablierten Verbindungen an.

## Praktische Beispiele

### 1. Grundlegende Nutzung

```bash
# Alle etablierten Verbindungen anzeigen
ss

# Alle Sockets anzeigen (abhörende und nicht-abhörende)
ss -a

# Nur abhörende Sockets anzeigen
ss -l
```


### 2. Protokoll-spezifische Abfragen

```bash
# Alle TCP-Verbindungen anzeigen
ss -t

# Alle TCP-Verbindungen (auch abhörende)
ss -ta

# Nur abhörende TCP-Sockets
ss -tl

# Alle UDP-Sockets anzeigen
ss -ua

# Nur abhörende UDP-Sockets
ss -ul
```


### 3. Numerische Ausgabe (Performance-optimiert)

```bash
# Numerische Adressen ohne DNS-Auflösung
ss -n

# Kombiniert mit anderen Optionen
ss -tln
ss -tlnp
```


### 4. Prozessinformationen anzeigen

```bash
# Mit Prozessinformationen
ss -p

# TCP-Sockets mit Prozessen (numerisch)
ss -tlnp

# Alle Verbindungen mit Prozessen
ss -anp
```


### 5. Erweiterte Informationen

```bash
# Detaillierte Socket-Informationen (uid, inode, cookie)
ss -e

# Timer-Informationen anzeigen
ss -o

# Speicher-Informationen
ss -m

# Interne TCP-Informationen
ss -i

# Kombiniert für maximale Details
ss -tnlpei
```


### 6. IPv4/IPv6 spezifische Abfragen

```bash
# Nur IPv4-Sockets
ss -4

# Nur IPv6-Sockets
ss -6

# IPv4 TCP-Verbindungen
ss -4t

# IPv6 UDP-Verbindungen
ss -6u
```


### 7. Zusammenfassende Statistiken

```bash
# Socket-Statistiken-Übersicht
ss -s
```


### 8. Kontinuierliche Überwachung

```bash
# Kontinuierliche Anzeige
ss -E

# Mit anderen Optionen kombiniert
watch -n 1 "ss -tlnp"
```


### 9. Erweiterte Filterung

```bash
# Nach Status filtern
ss state established

# Nach Port filtern
ss -tln dport = :80
ss -tln sport = :22

# Nach IP-Adresse filtern
ss dst 192.168.1.1
ss src 127.0.0.1

# Komplexere Filter
ss -o state established '( dport = :ssh or sport = :ssh )'
ss -tln sport \\< :1024
```


### 10. Häufig verwendete Kombinationen für IT-Security

```bash
# Der "Alleskönner" für schnelle Übersicht
ss -plants

# Alle offenen Ports mit Prozessen
ss -tlnp

# Verdächtige Verbindungen identifizieren
ss -antp | grep ESTABLISHED

# Externe Verbindungen überwachen
ss -antp | grep -v "127.0.0.1"

# Hochnummerierte Ports überwachen
ss -tln sport \\> :1024
```


## Ausgabeformat verstehen

### Standard-Spalten

- **Netid**: Socket-Typ (TCP, UDP, u_str für Unix stream, u_seq für Unix sequence)
- **State**: Socket-Status (ESTAB, LISTEN, UNCONN, etc.)
- **Recv-Q**: Anzahl empfangener Pakete in der Warteschlange
- **Send-Q**: Anzahl gesendeter Pakete in der Warteschlange
- **Local Address:Port**: Lokale IP-Adresse und Port
- **Peer Address:Port**: Remote-IP-Adresse und Port


### TCP-Verbindungsstatus

- **ESTAB**: Etablierte Verbindung
- **LISTEN**: Port wartet auf eingehende Verbindungen
- **SYN-SENT**: Verbindungsaufbau initiiert
- **SYN-RECV**: Verbindungsanfrage empfangen
- **FIN-WAIT-1/2**: Verbindung wird geschlossen
- **TIME-WAIT**: Verbindung abgeschlossen, wartet auf Timeout
- **CLOSE-WAIT**: Warten auf Schließung durch lokale Anwendung
- **UNCONN**: Nicht verbunden (hauptsächlich bei UDP)


## Vollständige Optionsübersicht

### Allgemeine Optionen

| Option | Beschreibung |
| :-- | :-- |
| `-h, --help` | Zeigt eine Zusammenfassung der Optionen an |
| `-V, --version` | Zeigt Versionsinformationen aus |
| `-H, --no-header` | Unterdrückt die Kopfzeile |
| `-Q, --no-queues` | Unterdrückt die Spalten für Sende- und Empfangswarteschlangen |
| `-O, --oneline` | Zeigt die Daten jedes Sockets in einer einzelnen Zeile an |
| `-n, --numeric` | Versucht nicht, Dienstnamen aufzulösen. Zeigt exakte Werte statt menschenlesbarer |
| `-r, --resolve` | Versucht numerische Adressen/Ports aufzulösen |
| `-s, --summary` | Zeigt zusammenfassende Statistiken an |
| `-E, --events` | Zeigt kontinuierlich Sockets an, während sie zerstört werden |
| `-c, --continuous` | Kontinuierliche Ausgabe (äquivalent zu -E) |

### Socket-Anzeige Optionen

| Option | Beschreibung |
| :-- | :-- |
| `-a, --all` | Zeigt sowohl abhörende als auch nicht-abhörende Sockets an |
| `-l, --listening` | Zeigt nur abhörende Sockets an (standardmäßig weggelassen) |
| `-B, --bound-inactive` | Zeigt nur TCP-Sockets an, die gebunden aber inaktiv sind |

### Erweiterte Informationen

| Option | Beschreibung |
| :-- | :-- |
| `-o, --options` | Zeigt Timer-Informationen an |
| `-e, --extended` | Zeigt detaillierte Socket-Informationen an (uid, inode, cookie) |
| `-m, --memory` | Zeigt Socket-Speichernutzung an |
| `-p, --processes` | Zeigt Prozesse an, die den Socket verwenden |
| `-T, --threads` | Zeigt Threads an, die den Socket verwenden (impliziert -p) |
| `-i, --info` | Zeigt interne TCP-Informationen an |
| `--tos` | Zeigt ToS- und Prioritätsinformationen an |
| `--cgroup` | Zeigt Cgroup-Informationen an |
| `--tipcinfo` | Zeigt interne TIPC-Socket-Informationen an |

### Sicherheits- und Kontext-Optionen

| Option | Beschreibung |
| :-- | :-- |
| `-Z, --context` | Wie -p, aber zeigt auch Prozess-Sicherheitskontext an |
| `-z, --contexts` | Wie -Z, aber zeigt auch Socket-Kontext an |

### Protokoll-spezifische Optionen

| Option | Beschreibung |
| :-- | :-- |
| `-4, --ipv4` | Zeigt nur IPv4-Sockets an (Alias für -f inet) |
| `-6, --ipv6` | Zeigt nur IPv6-Sockets an (Alias für -f inet6) |
| `-0, --packet` | Zeigt PACKET-Sockets an (Alias für -f link) |
| `-t, --tcp` | Zeigt TCP-Sockets an |
| `-u, --udp` | Zeigt UDP-Sockets an |
| `-d, --dccp` | Zeigt DCCP-Sockets an |
| `-w, --raw` | Zeigt RAW-Sockets an |
| `-x, --unix` | Zeigt Unix-Domain-Sockets an (Alias für -f unix) |
| `-S, --sctp` | Zeigt SCTP-Sockets an |
| `--tipc` | Zeigt TIPC-Sockets an (Alias für -f tipc) |
| `--vsock` | Zeigt vsock-Sockets an (Alias für -f vsock) |
| `--xdp` | Zeigt XDP-Sockets an (Alias für -f xdp) |
| `-M, --mptcp` | Zeigt MPTCP-Sockets an |
| `--inet-sockopt` | Zeigt inet-Socket-Optionen an |

### Familie und Abfrage-Optionen

| Option | Beschreibung |
| :-- | :-- |
| `-f FAMILY, --family=FAMILY` | Zeigt Sockets des Typs FAMILY an (unix, inet, inet6, link, netlink, vsock, tipc, xdp) |
| `-A QUERY, --query=QUERY` | Liste der zu durchsuchenden Socket-Tabellen, durch Kommas getrennt |
| `--socket=QUERY` | Wie -A/--query |

### Netzwerk-Namespace

| Option | Beschreibung |
| :-- | :-- |
| `-N NSNAME, --net=NSNAME` | Wechselt zum angegebenen Netzwerk-Namespace |

### BPF-Optionen

| Option | Beschreibung |
| :-- | :-- |
| `-b, --bpf` | Zeigt Socket classic BPF Filter an (nur für Administratoren) |
| `--bpf-maps` | Zeigt alle BPF socket-local Dateneinträge für jeden Socket an |
| `--bpf-map-id=MAP_ID` | Zeigt BPF socket-local Dateneinträge für die angegebene Map-ID an |

### Datei-Optionen

| Option | Beschreibung |
| :-- | :-- |
| `-D FILE, --diag=FILE` | Zeigt nichts an, speichert rohe TCP-Socket-Informationen in FILE |
| `-F FILE, --filter=FILE` | Liest Filterinformationen aus FILE |

### Erweiterte Funktionen

| Option | Beschreibung |
| :-- | :-- |
| `-K, --kill` | Versucht Sockets zwangsweise zu schließen |

## Hauptunterschiede zwischen ss und netstat

### Performance und Architektur

**ss (Socket Statistics)**:

- **Schneller**: Direkter Zugriff auf Kernel-Datenstrukturen über Netlink-Sockets
- **Effizienter**: Filtering erfolgt im Kernel-Space, nicht im User-Space
- **Skalierbar**: Bessere Performance bei großen Netzwerken und vielen Verbindungen
- **Modern**: Teil des iproute2-Pakets, aktiv entwickelt

**netstat (Network Statistics)**:

- **Langsamer**: Liest /proc/net/* Dateien sequenziell
- **Weniger effizient**: Alle Daten werden gelesen, dann gefiltert
- **Veraltete Architektur**: Kann bei vielen Verbindungen Minuten dauern
- **Deprecated**: Offiziell als veraltet markiert


### Funktionsumfang

| Feature | netstat | ss |
| :-- | :-- | :-- |
| **Geschwindigkeit** | Langsamer | **Deutlich schneller** |
| **Detaillierte Ausgabe** | Begrenzt | **Umfassend** |
| **Erweiterte Filter** | Grundlegend | **Sehr mächtig** |
| **TCP-Interna** | Nein | **Ja (-i Option)** |
| **Memory-Info** | Nein | **Ja (-m Option)** |
| **Timer-Info** | Nein | **Ja (-o Option)** |
| **Socket-Kill** | Nein | **Ja (-K Option)** |
| **BPF-Filter** | Nein | **Ja (-b Option)** |
| **Kernel-Filter** | Nein | **Ja (state, dst, src)** |
| **Aktive Entwicklung** | **Nein (deprecated)** | Ja |

### Ausgabeformat

**ss**: Saubere, konsistente Ausgabe mit besserer Lesbarkeit
**netstat**: Detaillierte aber weniger organisierte Ausgabe

### Verfügbarkeit des `ss`-Befehls

**ss**: Standardmäßig in modernen Linux-Distributionen installiert
**netstat**: Muss oft nachinstalliert werden (net-tools Paket)

## Spezielle Anwendungen für IT-Security

### 1. Netzwerk-Forensik

```bash
# Alle etablierten Verbindungen mit Details
ss -antp state established

# Verdächtige hochnummerierte Ports
ss -tln sport \\> :10000

# Externe Verbindungen identifizieren
ss -antp | grep -v -E "(127\.0\.0\.1|::1)"
```


### 2. Malware-Erkennung

```bash
# Prozesse mit ungewöhnlichen Netzwerkaktivitäten
ss -antp | grep -E ":[0-9]{4,5}"

# Unix-Sockets für lokale IPC-Analyse
ss -xa

# Memory-intensive Verbindungen
ss -m state established
```


### 3. Performance-Monitoring

```bash
# TCP-Interna für Performance-Analyse
ss -i state established

# Socket-Memory-Überwachung
ss -m -a | grep -E "(wmem|rmem)"

# Timer-basierte Analyse
ss -o state established
```


### 4. Compliance und Auditing

```bash
# Alle offenen Ports dokumentieren
ss -tlnp > open_ports_$(date +%Y%m%d).txt

# Security-Context für SELinux-Umgebungen
ss -Z -tlnp

# Cgroup-basierte Analyse
ss --cgroup -antp
```


## Praktische Tipps

### 1. Performance-Optimierung

- Verwenden Sie **-n** für schnellere Ausgabe ohne DNS-Lookups
- Nutzen Sie spezifische Filter zur Reduzierung der Ausgabe
- **ss** ist besonders bei großen Systemen deutlich schneller als netstat


### 2. Sicherheitsanalyse

- **ss -plants** ist eine einfach zu merkende Kombination für umfassende Informationen
- Root-Berechtigung für vollständige Prozessinformationen erforderlich
- Kombinieren Sie mit anderen Tools wie `lsof` für detaillierte Analyse


### 3. Scripting und Automatisierung

- **-H** Option zum Unterdrücken von Headern für Parsing
- **-O** für einzeilige Ausgabe in Scripts
- JSON-Ausgabe nicht verfügbar, aber strukturierte Filterung möglich


## Fazit

Der ss-Befehl ist die moderne, leistungsstarke Alternative zu netstat mit deutlich besserer Performance und erweiterten Funktionen. Für IT-Sicherheitsmanager bietet ss umfassende Möglichkeiten zur Netzwerkanalyse, Forensik und Überwachung. Die mächtigen Filterfunktionen, detaillierten Informationen über TCP-Interna und die Möglichkeit zur Socket-Manipulation machen ss zu einem unverzichtbaren Werkzeug in der modernen Netzwerkdiagnose.

Während netstat aufgrund seiner weiten Verbreitung und Vertrautheit noch verwendet wird, sollten Sie auf ss umsteigen, um von der besseren Performance und den erweiterten Funktionen zu profitieren.


<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://help.secure-bits.org/help)
<!-- FM:Snippet:End -->