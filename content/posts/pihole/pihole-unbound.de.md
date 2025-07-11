---
title: "Pihole Unbound jetzt richtig installieren in 2024"
date: 2023-10-12
description: "Pihole Unbound jetzt richtig installieren in 2023 | In diesen Tutorial zeige ich euch, wie ihr Unbound richtig für Pihole installiert und konfiguriert."
hero: /images/posts/pihole/Video-Pi-hole-und-Unbound.png
menu:
  sidebar:
    name: Pi-hole und unbound installieren
    identifier: pihole-unbound
    parent: pihole
categories: 
  - "Linux"
  - "Netzwerk"
  - "Security"
  - "Tutorials"
  - "Video"
tags: 
  - "netzwerk"
  - "pi-hole"
  - "security"
  - "tutorials"
  - "video"
---

## Pihole Unbound und DNS-Verschlüsselung - Für mehr Sicherheit im Netzwerk

Im heutigem Video-Tutorial '**Pi-hole Unbound**' möchte ich euch gerne zeigen, wie ihr mithilfe von dem zusätzlichen Tool '**Unbound**', für mehr Sicherheit bei euren DNS-Anfragen im Netzwerk sorgen könnt.

Weiterhin findet ihr alle Befehle die ihr für die Installation und Konfiguration von Unbound neben Pi-hole braucht.

Inhaltsverzeichnis zu Pihole Unbound

### Voraussetzungen für Pihole Unbound Installation

> ### Hinweis
>
> Diese Anleitung für die Installation und Einrichtung von **Unbound** ist für **debianbasierte Distributionen wie Debian, Ubuntu, Raspberry Pi OS, etc**.  
>
> Dieses Tutorial bezieht sich auf die vorherigen Tutorials zum Thema 'Pi-Hole auf einen Raspberry Pi installieren' und nimmt diese Konfiguration als Grundlage für diesen Beitrag.

In diesem Tutorial gehe ich von der Basis aus, die ihr nachdem Tutorial '**[Pi-Hole + Firewall auf einen Raspberry Pi installieren](https://secure-bits.org/pi-hole-auf-einen-raspberry-pi-installieren/)**' auf euren Raspberry Pi nutzt. Sollte das nicht der Fall sein, dann könnt ihr vorab gerne das Tutorial für die Installation durchgehen.

Natürlich sollte die Installation von **Unbound** auch auf anderen Linux basierten Systemen so funktionieren!

## Video-Tutorial zum Thema 'Pi-hole Unbound installieren'

{{< youtube TdL_3iB9SiU >}}

## Installation von Unbound

Vorab müssen wir immer erstmal das Betriebssystem auf den aktuellen Stand bringen.

```bash
sudo apt update && apt upgrade -y
```

Nach der Aktualisierung sollte das System neu gestartet werden.

### Pi-hole Unbound | Abrufen der root.hints

Jetzt kann die Installation von Unbound und der Liste der aktuellen root.hints (Root-Namansserver, diese werden alle 6 Monate aktualisiert) erfolgen.

```bash
# Installation von Unbound

sudo apt install unbound

# Installation der Liste der Root-Namensserver (sollte alle 6 Monate durchgeführt werden)

sudo wget -O /etc/unbound/root.hints https://www.internic.net/domain/named.root
sudo wget -O /var/lib/unbound/root.hints https://www.internic.net/domain/named.root
```

### Liste der Root-Nameserver (root.hints) automatisch Aktualisieren | Pi-hole Unbound

Um die Liste der root.hints automatisch alle 6 Monate zu aktualisieren, legen wir einen Cronjob an, der diese Aufgabe für uns automatisiert. Um diese Automatisierung einzurichten, gehen wir wie folgt vor.

#### Anlegen einer Update-Datei mit allen Befehlen

Wir legen zunächst eine Datei an, in der wir alle Befehle zum Aktualisieren der root.hints hineinpacken.

```bash
# Anlegen einer Befehlsdatei für das Update der root.hints

nano /root/roothintsupdate

# Im Editorfenster dieser angelegten Datei hinterlegen wir die folgenden Befehle:

#!/bin/bash
wget -O root.hints https://www.internic.net/domain/named.root ; 
rm /var/lib/unbound/root.hints
mv root.hints /var/lib/unbound/
service unbound restart
```

#### Rechte zur Ausführung der angelegten Datei vergeben

Damit die angelegte Update-Datei auch ausgeführt werden kann, müssen wir noch hier die richtigen Berechtigungen vergeben.

```bash
# Berechtigungen für die Update-Datei vergeben

chmod +x /root/roothintsupdate
```

#### Cronjob für das automatische Update der root.hints anlegen

Um unsere Update-Datei automatisch alle sechs Monate auszuführen, legen wir einen Cronjob an, in dem wir die Cronjobs-Config entsprechend unserer Anforderung ergänzen.

```bash
# Öffnen der Cronjob-Config

crontab -e

# Hier tragen wir im unteren freien Bereich die folgende Zeile ein:

0 0 1 */6 * /root/roothintsupdate &

# Uns Speichern die Datei mit STRG + O und Enter und Verlassen das Editor-Fenster mit STRG + X
```

#### Neustart den Cronjob-Service

Zu guter Letzt, müssen wir den Service 'Cronjob' noch neu starten und überprüfen im Anschluss, dass der Service auch ordnungsgemäß läuft.

```bash
# Cronjob-Service neu starten

service cronjob restart

# Überprüfen des Status des Cronjob-Service

service cronjob status

# Ausgabe des Befehls (piholetest ist der Name meines Testrechners):

* cron.service - Regular background program processing daemon
     Loaded: loaded (/lib/systemd/system/cron.service; enabled; vendor preset: enabled)
     Active: active (running) since Fri 2024-01-19 06:57:01 UTC; 15s ago
       Docs: man:cron(8)
   Main PID: 3866 (cron)
      Tasks: 1 (limit: 38127)
     Memory: 340.0K
        CPU: 2ms
     CGroup: /system.slice/cron.service
             `-3866 /usr/sbin/cron -f

Jan 19 06:57:01 piholetest systemd[1]: Started Regular background program processing daemon.
Jan 19 06:57:01 piholetest cron[3866]: (CRON) INFO (pidfile fd = 3)
Jan 19 06:57:01 piholetest cron[3866]: (CRON) INFO (Skipping @reboot jobs -- not system startup)
```

### Pi-hole Unbound - Unbound-Config-Datei anlegen

Als nächstes müssen wir eine Config-Datei für Unbound anlegen, in der wir dann im nächsten Schritt, die Konfiguration für das Zusammenspiel von Unbound und Pi-hole eintragen.

```bash
# Unbound-Conf-Datei anlegen

sudo nano /etc/unbound/unbound.conf.d/pi-hole.conf

# In dieser Datei tragen wir die im nächsten Absatz stehende Konfiguration ein
# und Speichern die Config-Datei mit STRG+O ab und Verlassen den Editor mit STRG+x
```

### Inhalt der Pi-hole Unbound Config-Datei

Hier findet ihr den Inhalt der Config-Datei dir ihr für den Betrieb von Pi-hole und Unbound eintragen müsst.

In dieser Config-Datei habe ich einige Anpassungen vorgenommen, damit externe DNS-Anfragen auf verschlüsselter Weise angefragt werden und einige andere Privacy-Einstellungen konfiguriert.

Beschreibung zu den einzelnen Unbound-Konfigurationen stehen immer als Kommentar über den Anweisungen in der Unbound-Conf-Datei.

```bash
# Unbound-Config-Datei fuer Pi-hole

server:
chroot: ""

# Versions-Informationen von Unbound nicht anzeigen - Sicherheitsaspekt
server:
   hide-identity: yes
   hide-version: yes

# Wenn keine Logdatei angegeben wird, wird syslog verwendet.

logfile: "/var/log/unbound.log"
verbosity: 0
log-time-ascii: yes
log-queries: no

# Port fuer Pi-hole Custom-DNS 1 angeben:

port: 5335
do-ip4: yes
do-udp: yes
do-tcp: yes

# Kann auf ja gesetzt werden, wenn du IPv6-Konnektivität hast

do-ip6: no

# Verwende dies nur, wenn du die Liste der primären Root-Server heruntergeladen hast!

root-hints: "/var/lib/unbound/root.hints"
tls-cert-bundle: "/etc/ssl/certs/ca-certificates.crt"

# Vertraue dem Glue nur, wenn er innerhalb der Autorität des Servers liegt

harden-glue: yes

# Erforderliche DNSSEC-Daten für vertrauenswürdige Zonen; wenn diese Daten fehlen, wird die zu Zone BOGUS

harden-dnssec-stripped: yes

# Verwende keine Großbuchstaben-Randomisierung, da sie bekanntermaßen manchmal DNSSEC-Probleme verursacht
# Siehe https://discourse.pi-hole.net/t/unbound-stubby-or-dnscrypt-proxy/9378 für weitere Details

use-caps-for-id: no

# Reduziere die Größe des EDNS-Zusammensetzungspuffers.
# IP-Fragmentierung ist heute im Internet unzuverlässig und kann 
# Übertragungsfehler verursachen, wenn große DNS-Nachrichten über UDP gesendet werden. Selbst
# Wenn die Fragmentierung funktioniert, ist sie unter Umständen nicht sicher.
# Es ist theoretisch möglich, Teile einer fragmentierten DNS-Nachricht zu fälschen, ohne
# dass der Empfänger es merkt. Kürzlich gab es eine hervorragende Studie
# >>> Defragmenting DNS - Determining the optimal maximum UDP response size for DNS <<<
# von Axel Koolhaas, und Tjeerd Slokker (https://indico.dns-oarc.net/event/36/contributions/776/)
# in Zusammenarbeit mit NLnet Labs untersuchten DNS anhand von realen Daten aus den
# den RIPE Atlas Probes und die Forscher schlugen unterschiedliche Werte für
# IPv4 und IPv6 und in verschiedenen Szenarien. Sie raten, dass Server so konfiguriert werden sollten
# DNS-Nachrichten, die über UDP gesendet werden, auf eine Größe zu begrenzen, die keine
# Fragmentierung auf typischen Netzwerkverbindungen auslöst. DNS-Server können
# von UDP auf TCP umschalten, wenn eine DNS-Antwort zu groß ist, um in diesen begrenzten
# Puffergröße passt. Dieser Wert wurde auch auf dem DNS Flag Day 2020 vorgeschlagen.

edns-buffer-size: 1232

# TTL-Grenzen für den Cache

cache-min-ttl: 3600
cache-max-ttl: 86400

# Prefetching von fast abgelaufenen Nachrichten-Cache-Einträgen durchführen
# Dies gilt nur für Domains, die häufig abgefragt wurden

prefetch: yes
prefetch-key: yes

# Ein Thread sollte ausreichen, auf leistungsfähigen Maschinen kann er erhöht werden.

num-threads: 1

# Anzahl der Slabs im RRset-Cache. Slabs reduzieren die Sperrkonflikte zwischen den
# Threads. Muss auf eine Potenz von 2 in der Nähe von num-threads gesetzt werden.

msg-cache-slabs: 2
rrset-cache-slabs: 2
infra-cache-slabs: 2
key-cache-slabs: 2

# Cache-Speicher rrset sollte doppelt so groß sein wie msg

msg-cache-size: 50m
rrset-cache-size: 100m

# mehr ausgehende Verbindungen
# hängt von der Anzahl der Kerne ab: 1024/Kerne - 50

outgoing-range: 450

# UDP mit Multithreading beschleunigen

so-reuseport: yes

# Sicherstellen, dass der Kernel Buffer groß genug ist, um bei Traffic-Spitzen keine Nachrichten zu verlieren 
# (wird nicht zusammen mit aktiviertem AppArmor verwendet)
# so-rcvbuf: 1m

# Sicherstellung des Datenschutzes für lokale IP-Bereiche

private-address: 192.168.0.0/16
private-address: 169.254.0.0/16
private-address: 172.16.0.0/12
private-address: 10.0.0.0/8
private-address: fd00::/8
private-address: fe80::/10

# !!! Bitte den IP-Adressbereich für euren entsprechend anpassen !!!
# access-control: 192.168.0.0/16 allow 
# Bei mir ist es dieser IP-Adressbereich
access-control: 172.16.0.0/16 allow 

# Eine Liste an Upstream-Server die TLS-Anfragen (DoH) unterstuetzen und Anfragen verschluesseln

forward-zone:
name: "."
forward-tls-upstream: yes
forward-addr: 9.9.9.11@853#dns11.quad9.net
forward-addr: 176.9.93.198@853#dnsforge.de
forward-addr: 94.140.14.140@853#unfiltered.adguard-dns.com
```

### Anlegen der Config-Datei für EDNS

Die Config-Datei für die Bestimmung der maximale 'edns-buffer-size' legen wir mit dem folgenden Befehl an.

```bash
# Anlegen der EDNS-Config-Datei

sudo nano /etc/dnsmasq.d/99-edns.conf

# Und tragen hier den folgenden Parameter ein

edns-packet-max=1232

# Und speichern die Conf-Datei mit STRG+O und STRG+X ab
```

### Unbound neustarten

Wenn die oben genannten Schritte durchgeführt wurden, muss der Unbound-Dienst neu gestartet werden.

```bash
# Unbound-Dienst neu starten

sudo systemctl restart unbound.service

# Status des Unbound-Service überprüfen

sudo systemctl status unbound.service

# Ausgabe sollte wie folgt aussehen (piholetest2 steht nur für System welches ich bei diesem Tutorial genutzt habe und wird bei euch mit dem Namen von eurer Pi-hole-Instanz ersetzt):

# root@piholetest2:~# sudo systemctl status unbound.service
* unbound.service - Unbound DNS server
     Loaded: loaded (/lib/systemd/system/unbound.service; enabled; vendor preset: enabled)
     Active: active (running) since Fri 2023-10-06 08:29:59 UTC; 1min 9s ago
       Docs: man:unbound(8)
    Process: 3190 ExecStartPre=/usr/lib/unbound/package-helper chroot_setup (code=exited, status=0/SUCCESS)
    Process: 3193 ExecStartPre=/usr/lib/unbound/package-helper root_trust_anchor_update (code=exited, status=0/SUCCESS)
   Main PID: 3196 (unbound)
      Tasks: 2 (limit: 38124)
     Memory: 4.8M
        CPU: 92ms
     CGroup: /system.slice/unbound.service
             `-3196 /usr/sbin/unbound -d -p

Oct 06 08:29:59 piholetest2 systemd[1]: Starting Unbound DNS server...
Oct 06 08:29:59 piholetest2 unbound[3196]: Oct 06 08:29:59 unbound[3196:0] error: Could not open logfile /var/log/unbound.>
Oct 06 08:29:59 piholetest2 systemd[1]: Started Unbound DNS server.
Oct 06 08:29:59 piholetest2 unbound[3196]: Oct 06 08:29:59 unbound[3196:0] info: start of service (unbound 1.13.1).
lines 1-17/17 (END)
```

#### Unbound-Service automatischen Start aktivieren

Damit Unbound auch nach einem Neustart wieder gestartet wird, müssen wir noch das folgende Kommando ausführen:

```bash
#Automatischer Start von Unbound nach einem Neustart

sudo systemctl enable unbound.service
```

### Funktion von Unbound testen

Nach der Konfiguration von Unbound müssen wir noch testen, ob Unbound DNS-Anfragen richtig beantwortet.

Dieses machen wir durch das folgende Kommando:

```bash
# Funktion von Unbound testen am Beispiel meiner Domain. Kann auch durch z.B. google.com ersetzt werde

dig secure-bits.org @127.0.0.1 -p 5335
```

Die Ausgabe sollte dann wie auf dem unteren Bild aussehen.

Bei 'Status' muss 'NOERROR' stehen und natürlich auch die aufgelöste IP-Adresse der angefragten Domain.

![pi-hole unbound testen](/images/posts/pihole/Unbound-Pi-hole-testen.png)

### Deaktivieren des Standard-DNS-Cache-Daemon

Da ja nun Unbound das Caching von DNS-Anfragen übernimmt, werden wir noch den Standard-Cache-Resolver 'systemd-resolved' deaktivieren.

```bash
sudo systemctl disable systemd-resolved
```

### Log-Datei für Unbound erstellen

Erstellen der unbound.log-Datei damit, sowie in der Config-Datei angegeben, Unbound hier sein Protokoll schreiben kann.

```bash
# Log-Datei für Unbound anlegen

sudo touch /var/log/unbound.log

# Besitzer / Rechte für die unbound.log-Datei zuweisen

sudo chown unbound:unbound /var/log/unbound.log

# Neustart von Unbound

sudo systemctl restart unbound.service
```

### Einrichtung von Pi-hole Unbound

Zu guter Letzt müssen wir Pi-hole noch konfigurieren, dass dieser Unbound als Upstream-DNS-Server nutzt.

Hierzu meldet ihr euch bei Pi-Hole an und geht hier auf '**Settings->DNS**' und tragt bei '**Custom 1 (IPv4)**' den folgenden Eintrag ein '**127.0.0.1#5335**'.

Auf der linken Seite klickt ihr unter '**Upstream DNS Servers**' die Haken von den bisher genutzten Upstream-DNS-Server weg, da diese nicht mehr gebraucht werden.

**Wichtig!** - Wenn alle Einträge angepasst wurden, bitte nach unten scrollen und mit einem Klick aus '**SAVE**' die Änderungen speichern.


![Pi-hole Unbound einrichten](/images/posts/pihole/Pi-hole-Unbound-einrichten.png)

#### Links zum Thema Unbound

Entwickler hinter Unbound und Hintergrund-Informationen zum rekursiven DNS-Server - [https://nlnetlabs.nl/projects/unbound/about/](https://nlnetlabs.nl/projects/unbound/about/)

Dokumentation zu Unbound - [https://unbound.docs.nlnetlabs.nl/en/latest/](https://unbound.docs.nlnetlabs.nl/en/latest/)

Dokumentation von Pi-hole.net zum Thema Unbound

[https://docs.pi-hole.net/guides/dns/unbound/](https://docs.pi-hole.net/guides/dns/unbound/)

Übersichtsbild DNS-Anfrage über einen Root-Nameserver

[https://upload.wikimedia.org/wikipedia/commons/3/3c/DNS-query-to-wikipedia.svg](https://upload.wikimedia.org/wikipedia/commons/3/3c/DNS-query-to-wikipedia.svg)
