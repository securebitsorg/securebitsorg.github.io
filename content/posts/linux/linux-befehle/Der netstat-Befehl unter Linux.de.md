---
title: Der netstat-Befehl unter Linux
description: Übersicht über den Befehl netstat und seine Parameter unter Linux
date: 2025-08-11T06:16:18.634Z
preview: ../../../../assets/images/posts/linux/linux-commands/netstat-linux.webp
hero: /images/posts/linux/linux-commands/netstat-linux.webp
tags:
    - linux
    - tutorials
    - netzwerk
categories:
    - Linux
    - Network
    - Tutorials
menu:
    sidebar:
        name: Übersicht über den Befehl netstat und seine Parameter unter Linux
        identifier: netstat-linux
        parent: linux-befehle
keywords:
    - netstat linux
    - netstat-parameter
    - netstat
---
In diesem Überblick möchte ich euch eine Anleitung zum Befehl `netstat` geben, die einzelnen **Parameter** zu `netstat` erklären und wie ihr diese in eurer Linux-Umgebung verwenden könnt.

## Was ist der netstat-Befehl und wofür nutzt man diesen?

Der **netstat**-Befehl (Network Statistics) ist ein klassisches Kommandozeilen-Tool unter Linux, das detaillierte Informationen über Netzwerkverbindungen, Routing-Tabellen, Schnittstellen-Statistiken und verschiedene netzwerkbezogene Datenstrukturen anzeigt. Obwohl das Tool inzwischen als veraltet gilt und durch modernere Alternativen wie `ss` ersetzt wurde, ist es nach wie vor weit verbreitet und ein wichtiges Werkzeug für die Netzwerkdiagnose.

## Installation und Verfügbarkeit

In neueren Linux-Distributionen ist netstat nicht mehr standardmäßig installiert. Sie können es über das **net-tools**-Paket nachinstallieren:

```bash
# Ubuntu/Debian
sudo apt-get install net-tools

# CentOS/RHEL/Fedora
sudo yum install net-tools
# oder bei neueren Versionen:
sudo dnf install net-tools
```


## Grundlegende Syntax

```bash
netstat [Optionen]
```

Ohne Optionen zeigt netstat eine Liste der aktiven Netzwerkverbindungen an.

## Praktische Beispiele

### 1. Alle aktiven Verbindungen anzeigen

```bash
netstat -a
```

Zeigt alle aktiven TCP- und UDP-Verbindungen sowie alle abhörenden Ports an.

### 2. Nur TCP-Verbindungen anzeigen

```bash
netstat -t
# oder für alle TCP-Verbindungen (auch abhörende)
netstat -at
```


### 3. Nur UDP-Verbindungen anzeigen

```bash
netstat -u
# oder für alle UDP-Verbindungen
netstat -au
```


### 4. Abhörende Ports anzeigen

```bash
netstat -l
# oder spezifisch für TCP
netstat -lt
# oder für UDP
netstat -lu
```


### 5. Numerische Ausgabe (keine Namensauflösung)

```bash
netstat -n
# Kombiniert mit anderen Optionen
netstat -an
netstat -tln
```

Diese Option ist besonders nützlich für die Performance, da keine DNS-Lookups durchgeführt werden.

### 6. Prozessinformationen anzeigen

```bash
netstat -p
# Kombiniert mit anderen Optionen
netstat -tlnp
```

Zeigt die PID und den Prozessnamen an, der den jeweiligen Socket verwendet. 

> **Hinweis**: Root-Berechtigung erforderlich für vollständige Informationen.

### 7. Routing-Tabelle anzeigen

```bash
netstat -r
# oder mit numerischer Ausgabe
netstat -rn
```


### 8. Netzwerk-Schnittstellen anzeigen

```bash
netstat -i
# mit erweiterten Informationen
netstat -ie
```


### 9. Netzwerk-Statistiken anzeigen

```bash
# Alle Protokoll-Statistiken
netstat -s
# Nur TCP-Statistiken
netstat -st
# Nur UDP-Statistiken
netstat -su
```


### 10. Kontinuierliche Überwachung

```bash
netstat -c
# Kombiniert mit anderen Optionen für kontinuierliche Anzeige
netstat -tlnpc
```


### 11. Häufig verwendete Kombinationen

```bash
# Alle TCP-Verbindungen mit Prozessinformationen (numerisch)
netstat -tlnp

# Alle aktiven Verbindungen mit Prozessen
netstat -anp

# Abhörende Ports mit Prozessinformationen
netstat -lnp

# Erweiterte Informationen über etablierte Verbindungen
netstat -tep
```


## Ausgabeformat verstehen

### TCP/UDP-Verbindungen

- **Proto**: Protokoll (TCP, UDP)
- **Recv-Q**: Anzahl Bytes im Empfangspuffer
- **Send-Q**: Anzahl Bytes im Sendepuffer
- **Local Address**: Lokale IP-Adresse und Port
- **Foreign Address**: Remote-IP-Adresse und Port
- **State**: Verbindungsstatus (ESTABLISHED, LISTENING, etc.)
- **PID/Program name**: Prozess-ID und Programmname (bei -p Option)


### Verbindungsstatus

- **ESTABLISHED**: Aktive Verbindung[^5][^2]
- **LISTENING**: Port wartet auf eingehende Verbindungen
- **TIME_WAIT**: Verbindung wird geschlossen
- **CLOSE_WAIT**: Warten auf Schließung durch lokale Anwendung
- **SYN_SENT**: Verbindungsaufbau initiiert
- **SYN_RECV**: Verbindungsanfrage empfangen


## Vollständige Optionsübersicht

### Allgemeine Optionen

| Option | Beschreibung |
| :-- | :-- |
| `-a, --all` | Zeigt alle Sockets an (sowohl abhörende als auch nicht-abhörende). Mit --interfaces zeigt auch nicht aktive Schnittstellen |
| `-l, --listening` | Zeigt nur abhörende Sockets an (normalerweise werden diese ausgeblendet) |
| `-n, --numeric` | Zeigt numerische Adressen statt symbolischer Host-, Port- oder Benutzernamen |
| `--numeric-hosts` | Zeigt nur numerische Host-Adressen, aber löst Port- und Benutzernamen auf |
| `--numeric-ports` | Zeigt nur numerische Portnummern, aber löst Host- und Benutzernamen auf |
| `--numeric-users` | Zeigt nur numerische Benutzer-IDs, aber löst Host- und Portnamen auf |
| `-p, --program` | Zeigt die PID und den Namen des Programms, dem jeder Socket gehört |
| `-v, --verbose` | Ausführliche Ausgabe mit zusätzlichen Informationen |
| `-c, --continuous` | Kontinuierliche Ausgabe - aktualisiert die Anzeige jede Sekunde |
| `-e, --extend` | Zeigt erweiterte Informationen. Zweimalige Verwendung für maximale Details |
| `-W, --wide` | Kürzt IP-Adressen nicht ab, verwendet so breite Ausgabe wie nötig |
| `--help` | Zeigt Hilfe an |
| `-V, --version` | Zeigt Versionsinformation an |

### Protokoll-spezifische Optionen

| Option | Beschreibung |
| :-- | :-- |
| `-t, --tcp` | Zeigt nur TCP-Verbindungen an |
| `-u, --udp` | Zeigt nur UDP-Verbindungen an |
| `-U, --udplite` | Zeigt nur UDPLite-Verbindungen an |
| `-S, --sctp` | Zeigt nur SCTP-Verbindungen an |
| `-w, --raw` | Zeigt nur RAW-Sockets an |
| `-x, --unix` | Zeigt nur Unix-Domain-Sockets an |
| `-2, --l2cap` | Zeigt nur L2CAP-Sockets (Bluetooth) an |
| `-f, --rfcomm` | Zeigt nur RFCOMM-Sockets (Bluetooth) an |

### Adressfamilien-Optionen

| Option | Beschreibung |
| :-- | :-- |
| `-4, --inet` | Zeigt nur IPv4-Verbindungen an |
| `-6, --inet6` | Zeigt nur IPv6-Verbindungen an |
| `--protocol={family}` | Gibt die Adressfamilie an (inet, inet6, unix, ipx, ax25, netrom, ddp, bluetooth) |
| `--ax25` | Zeigt AX.25-Verbindungen an |
| `--x25` | Zeigt X.25-Verbindungen an |
| `--rose` | Zeigt ROSE-Verbindungen an |
| `--ash` | Zeigt ASH-Verbindungen an |
| `--bluetooth` | Zeigt Bluetooth-Verbindungen an |
| `--ipx` | Zeigt IPX-Verbindungen an |
| `--netrom` | Zeigt NET/ROM-Verbindungen an |
| `--ddp, --appletalk` | Zeigt DDP (AppleTalk)-Verbindungen an |
| `--econet, --ec` | Zeigt Econet-Verbindungen an |

### Spezielle Modi

| Option | Beschreibung |
| :-- | :-- |
| `-r, --route` | Zeigt die Kernel-Routing-Tabelle an |
| `-i, --interfaces` | Zeigt eine Tabelle aller Netzwerk-Schnittstellen an |
| `-g, --groups` | Zeigt Multicast-Gruppenmitgliedschaften für IPv4 und IPv6 an |
| `-M, --masquerade` | Zeigt eine Liste der maskierten Verbindungen an |
| `-s, --statistics` | Zeigt zusammenfassende Statistiken für jedes Protokoll an |

### Timer und zusätzliche Informationen

| Option | Beschreibung |
| :-- | :-- |
| `-o, --timers` | Zeigt Informationen zu Netzwerk-Timern an |
| `-N, --symbolic` | Löst Hardware-Namen auf |

### Routing-spezifische Optionen

| Option | Beschreibung |
| :-- | :-- |
| `-F` | Zeigt Routing-Informationen aus der FIB (Forward Information Base) - Standard |
| `-C` | Zeigt Routing-Informationen aus dem Route-Cache |

## Erweiterte Nutzung für IT-Security

Als IT-Sicherheitsmanager können Sie netstat für verschiedene Sicherheitsanalysen einsetzen:

### 1. Überwachung verdächtiger Verbindungen

```bash
# Alle etablierten Verbindungen mit Prozessinformationen
netstat -antp | grep ESTABLISHED
```


### 2. Analyse offener Ports

```bash
# Alle abhörenden Ports identifizieren
netstat -tlnp | grep LISTEN
```


### 3. Unbekannte Prozesse identifizieren

```bash
# Alle Netzwerkaktivitäten mit Prozessen
netstat -anp | grep -v "127.0.0.1"
```


### 4. Kontinuierliche Sicherheitsüberwachung

```bash
# Kontinuierliche Überwachung aller Verbindungen
watch -n 1 "netstat -antp"
```


## Moderne Alternativen

Da netstat als veraltet gilt, sollten Sie auch moderne Alternativen kennen:

- **ss**: Ersatz für netstat mit besserer Performance **(einen Überblick zum Befehl `ss`, findet ihr auch eine Übersicht hier auf SecureBits)**
- **ip route**: Ersatz für `netstat -r` **(einen Überblick zum Befehl `ip`, findet ihr auch eine Übersicht hier auf SecureBits)
- **ip -s link**: Ersatz für `netstat -i`
- **ip maddr**: Ersatz für `netstat -g`


## Fazit

Der netstat-Befehl bleibt trotz seines veralteten Status ein nützliches Werkzeug für die Netzwerkdiagnose und Sicherheitsanalyse unter Linux. Die umfangreichen Optionen ermöglichen eine detaillierte Analyse von Netzwerkverbindungen, Routing-Tabellen und Schnittstellen-Statistiken. Für IT-Sicherheitsmanager ist es besonders wertvoll zur Identifikation verdächtiger Netzwerkaktivitäten und zur Überwachung offener Ports.

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://help.secure-bits.org/help)
<!-- FM:Snippet:End -->
