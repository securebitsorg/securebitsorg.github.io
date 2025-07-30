---
title: Nmap (Network Mapper)
description: Nmap (Network Mapper) - Umfassender Leitfaden für IT-Sicherheitsmanager
date: 2025-07-29T12:03:19.208Z
tags:
    - linux
    - netzwerk
    - security
    - tutorials
categories:
    - Linux
    - Security
    - Windows
    - Tutorials
menu:
    sidebar:
        name: Nmap (Network Mapper) - Umfassender Leitfaden für IT-Sicherheitsmanager
        identifier: nmap
        parent: security
keywords:
    - nmap
    - nmap-pdf
preview: ../../../assets/images/posts/linux/erstelle ein bild mit einem computernetzwerk und der Überschrift 'nmap-Tutorial'.jpeg
hero: /images/posts/linux/erstelle ein bild mit einem computernetzwerk und der Überschrift 'nmap-Tutorial'.jpeg
---
{{< alert type="danger" >}}
## Das Wichtigste vorab!

Es gilt zu beachten, dass der Einsatz von **nmap**, **außerhalb seiner Test- / Labor- oder Produktivumgebung**, **nur mit dem Einverständnis dessen Inhabers** erfolgen darf!
{{< /alert >}} 
</br>
</br>

Mit diesem Artikel möchte ich euch hoffentlich auf verständliche Art und Weise, das mächtige Tool '**nmap**' näher bringen und des Weiteren euch ein **PDF mit dem meisten genutzten nmap-Befehlen zum Download** zur Verfügung zu stellen.

**Nmap** lässt sich hervorragend dafür nutzen, um eure IT-Infrastruktur auf Herz und Nieren zu überprüfen und ist auch in 99 % der Fälle, der erste Vektor, bei einem Penetrationstest von Systemen.
## Was ist Nmap?

**Nmap (Network Mapper)** ist ein Open-Source-Tool für Netzwerkerkundung und der Durchführung von Sicherheitsaudits. Als IT-Sicherheitskräfte ist Nmap eines der wichtigsten Werkzeuge in Ihrem Arsenal zur Bewertung der Netzwerksicherheit. Es wird verwendet, um Hosts und Services in einem Computernetzwerk zu entdecken, indem Pakete gesendet und die Antworten analysiert werden.

**Hauptzwecke von Nmap:**

- Echtzeitinformationen über ein Netzwerk
- Detaillierte Informationen über alle aktiven IPs im Netzwerk
- Anzahl der offenen Ports in einem Netzwerk
- Liste der aktiven Hosts bereitstellen
- Port-, OS- und Host-Scanning

## Installation von Nmap

Nmap ist in den meisten Linux-Distributionen verfügbar und kann einfach installiert werden:

**Debian/Ubuntu:**

```bash
sudo apt-get install nmap
```

**CentOS/RedHat:**

```bash
yum install nmap
```

**Fedora:**

```bash
sudo dnf install nmap
```

## Grundlegende Syntax

Die grundlegende Syntax von Nmap ist

```bash
nmap [Scan-Type(s)] [Optionen] {Zielspezifikation}
```

### nmap-help aufrufen

```bash
nmap -h
```
</br>

![Ausgabe nmap help nmap -h](/images/posts/it-security/nmap-help.png)

**Ausgabe nmap -h**


## Wichtige Scan-Techniken im Detail

### 1. TCP SYN Scan (-sS) - Der "Stealth" Scan

Der **TCP SYN Scan** ist die Standard- und beliebteste Scan-Option. Er wird auch als "Stealth Scan" oder "Half-Open Scan" bezeichnet, da er niemals vollständige TCP-Verbindungen aufbaut.

```bash
nmap -sS 192.168.1.1
```

**Funktionsweise:**

- Sendet SYN-Pakete an Zielports
- Bei offenen Ports: Empfängt SYN/ACK-Antwort
- Bei geschlossenen Ports: Empfängt RST-Antwort
- Bei gefilterten Ports: Keine Antwort (Firewall)

**Vorteile:**

- Schnell und unauffällig
- Funktioniert gegen jeden TCP-Stack
- Klare Unterscheidung zwischen offen, geschlossen und gefiltert

### 2. TCP Connect Scan (-sT)

Der **TCP Connect Scan** führt den vollständigen TCP-Handshake durch.

```bash
nmap -sT 192.168.1.1
```

**Wann verwenden:**

- Wenn keine Root-Rechte verfügbar sind
- Für genauere Ergebnisse bei bestimmten Systemen

### 3. UDP Scan (-sU)

**UDP-Scanning** ist wichtig für Services wie DNS, SNMP und DHCP.

```bash
nmap -sU 192.168.1.1
```

**Besonderheiten:**

- Langsamer als TCP-Scans
- Schwieriger zu interpretieren
- Wichtig für vollständige Sicherheitsbewertung

## Betriebssystem-Erkennung

Nmap kann Remote-Betriebssysteme durch TCP/IP-Stack-Fingerprinting erkennen.

```bash
nmap -O 192.168.1.1
```

**Funktionsweise:**

- Sendet TCP- und UDP-Pakete an das Zielsystem
- Analysiert praktisch jedes Bit in den Antworten
- Vergleicht Ergebnisse mit Datenbank von über 2.600 OS-Fingerprints

**Erweiterte OS-Erkennung:**

```bash
nmap -O --osscan-guess 192.168.1.1    # Aggressive Erkennung
nmap -O --osscan-limit 192.168.1.1    # Nur bei guten Zielen
```

## Nmap Scripting Engine (NSE)

Die **Nmap Scripting Engine** ist eine der mächtigsten Funktionen von Nmap. Sie ermöglicht es, Lua-Scripts für erweiterte Aufgaben zu verwenden.

### Script-Kategorien:

- **auth** - Authentifizierungs-Scripts
- **broadcast** - Broadcast-Scripts
- **default** - Standard-Scripts
- **discovery** - Discovery-Scripts
- **dos** - Denial-of-Service-Scripts
- **exploit** - Exploit-Scripts
- **fuzzer** - Fuzzing-Scripts
- **intrusive** - Intrusive Scripts
- **malware** - Malware-Erkennung
- **safe** - Sichere Scripts
- **version** - Version-Erkennung
- **vuln** - Vulnerability-Scripts

### NSE-Beispiele:

```bash
nmap -sC 192.168.1.1                    # Standard-Scripts
nmap --script vuln 192.168.1.1          # Vulnerability-Scripts
nmap --script http-* 192.168.1.1        # Alle HTTP-Scriptsflags:
      enable: true 
nmap --script smb-vuln-* 192.168.1.1    # SMB-Vulnerability-Scripts
```

## Timing-Templates

Nmap bietet 6 Timing-Templates für verschiedene Geschwindigkeits- und Stealth-Anforderungen:

| Template | Name       | Beschreibung                      | Verwendung                      |
|:-------- |:---------- |:--------------------------------- |:------------------------------- |
| -T0      | Paranoid   | Sehr langsam (5 Min. Verzögerung) | IDS-Umgehung                    |
| -T1      | Sneaky     | Langsam (15 Sek. Verzögerung)     | IDS-Umgehung                    |
| -T2      | Polite     | Höflich (0.4 Sek. Verzögerung)    | Ressourcenschonung              |
| -T3      | Normal     | Standard (parallel)               | Standard                        |
| -T4      | Aggressive | Schnell                           | Moderne, zuverlässige Netze     |
| -T5      | Insane     | Sehr schnell                      | Lokale Netze, kann ungenau sein |

**Empfehlungen für IT-Sicherheit:**

- **Interne Audits:** -T4 für schnelle Ergebnisse
- **Externe Penetrationstests:** -T2 oder -T3 für weniger Auffälligkeit
- **Stealth-Assessments:** -T0 oder -T1

## Output-Formate

Nmap unterstützt verschiedene Output-Formate für unterschiedliche Anwendungszwecke:

### Normal Output (-oN)

```bash
nmap -oN scan_results.txt 192.168.1.0/24
```

- Standard-Textformat
- Gut lesbar für Menschen
- Ideal für einzelne Hosts oder kleine Netze

### XML Output (-oX)

```bash
nmap -oX scan_results.xml 192.168.1.0/24
```

- Strukturiertes, maschinenlesbares Format
- Ideal für Automatisierung und Datenbanken
- Kann in HTML konvertiert werden

### Grepable Output (-oG)

```bash
nmap -oG scan_results.grep 192.168.1.0/24
```

- Optimiert für Unix-Tools wie grep, awk, cut
- Ein Host pro Zeile
- Ideal für Scripting

### Alle Formate (-oA)

```bash
nmap -oA complete_scan 192.168.1.0/24
```

- Erstellt .nmap, .xml und .grep Dateien gleichzeitig

## Praktische Anwendungsbeispiele für IT-Sicherheitsmanagerflags:
      enable: true 

### 1. Netzwerk-Discovery

```bash
# Aktive Hosts im Netzwerk finden
nmap -sn 192.168.1.0/24

# Detaillierte Host-Informationen
nmap -A 192.168.1.0/24
```

### 2. Vulnerability Assessment

```bash
# Vulnerability-Scan durchführen
nmap --script vuln 192.168.1.100

# Spezifische Vulnerability-Checks
nmap --script smb-vuln-ms17-010 192.168.1.100
```

### 3. Service-Inventarisierung

```bash
# Alle Services und Versionen erfassen
nmap -sV -p- 192.168.1.100

# Top 1000 Ports mit Service-Erkennung
nmap -sV --top-ports 1000 192.168.1.0/24
```

### 4. Firewall-Testing

```bash
# Firewall-Regeln testen
nmap -sA 192.168.1.100

# Verschiedene Scan-Techniken kombinierenflags:
      enable: true 
nmap -sS -sU -A 192.168.1.100
```

### 5. Stealth-Reconnaissance

```bash
# Unauffällige Reconnaissance
nmap -T1 -f --source-port 53 192.168.1.100

# Mit Decoy-IPs
nmap -D RND:10 192.168.1.100
```

## Rechtliche und ethische Überlegungen

Als IT-Sicherheitsmanager sollten Sie folgende Punkte beachten:

1. **Autorisierung:** Verwenden Sie Nmap nur in eigenen Netzwerken oder mit expliziter Genehmigung
2. **Dokumentation:** Dokumentieren Sie alle Scans für Compliance-Zwecke
3. **Minimal-Impact:** Verwenden Sie angemessene Timing-Templates
4. **Test-Umgebung:** Nutzen Sie scanme.nmap.org für Tests

## Best Practices für IT-Sicherheitsmanager

### 1. Regelmäßige Netzwerk-Audits

- Wöchentliche Discovery-Scans mit `-sn`
- Monatliche vollständige Port-Scans mit `-sV`
- Quartalsweise Vulnerability-Assessments mit NSE-Scripts

### 2. Automatisierung und Reporting

```bash
# Automatisiertes Scanning mit Reporting
nmap -sV -A --script vuln -oA monthly_audit_$(date +%Y%m%d) 192.168.1.0/24
```

### 3. Monitoring von Änderungen

- Vergleichen Sie regelmäßige Scans zur Erkennung neuer Services
- Überwachen Sie offene Ports und Services
- Dokumentieren Sie alle Änderungen

## Fazit - nmap
Nmap ist ein unverzichtbares Tool für jeden Tätigen in der IT-Sicherheit und sollten ebenso von jeden Administrator zur Überprüfung seiner betreuenden IT-Landschaft genutzt werden. Die Beherrschung seiner vielfältigen Funktionen ermöglicht es, effektive Sicherheitsbewertungen durchzuführen, Schwachstellen zu identifizieren und die Sicherheitsposture des Netzwerks kontinuierlich zu verbessern.

Ich hoffe sehr, dass diese kleine Übersicht, den Einen oder Anderen unter euch, einen guten Überblich über das Tool **nmap** gibt und somit dem zukünftigen Gebrauch nichts im Wege steht.

## Download | nmap-commands in der Übersicht

> [DOWNLOAD nmap-PDF](https://cloud.secure-bits.org/s/pTY58wfpAty2X6R)

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->