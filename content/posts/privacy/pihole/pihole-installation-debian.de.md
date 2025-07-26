---
title: Pihole Installation Debian - Schütze dein Heimnetzwerk
date: 2021-03-07
categories:
  - Linux
  - Privacy
  - Tutorials
  - Netzwerk
tags:
  - linux
  - netzwerk
  - pihole
  - privacy
  - tutorials
keywords:
  - pihole installation debian
description: In diesem Tutorial, werden wir Pihole unter Debian installieren und einrichten
menu:
  sidebar:
    name: Pihole Installation  unter debian-basierende Betriebssysteme
    identifier: pihole-debian
    parent: pihole
preview: ../../../../assets/images/posts/pihole/pi-hole-installation-beendet.jpg
hero: /images/posts/pihole/pi-hole-installation-beendet.jpg
lastmode: 2025-07-26T07:51:43.630Z
---

## Pihole Installation Debian - Schütze dein Netzwerk vor Tracking und Werbung

> **BITTE BEACHTEN!!!**
>
> Diese Anleitung bezieht sich auf die Installation von Pihole in der Version bis **5** und nicht auf die aktuelle Version **6**.
>
> **Die Unterschiede von VERSION 5 zu VERSION 6** sind vom Prozess her, nicht wirklich anders. Version 6 basiert halt nicht mehr auf PHP und nutzt auch keine lighthtp-Instanz.
>
> Demnächst werde ich auch für die Version 6 von Pihole hier ein Tutorial veröffentlichen.

Wer in seinem Heimnetzwerk Trackern, In-App-Werbung und Werbe-Botschaften den Kampf ansagen möchte, der sollte sich mit Pihole ein wenig beschäftigen.

Natürlich werden jetzt einige denken, ich nutze doch beim Surfen einen AD-Blocker, warum dann noch ein extra Gerät für solche Dienste?! Diese Frage kann ich nachvollziehen, doch ist die Antwort ganz einfach.

Eine **Pihole Installation Debian / Server** schützt euch zentral vor Werbung und Trackern, da pi-hole als zentraler DNS-Server im Netzwerk fungiert und somit nicht nur Computer vor den lästigen Schnüffelwerkzeugen schützt, sondern auch andere Geräte im Netzwerk. So zum Beispiel Smart-TV´s, Werbung in Apps auf euren Smartphone und funktioniert gleichzeitig auch als "Kindersicherung". So dass euer Nachwuchs beim Surfen im Internet geschützt ist.

### Wie funktioniert Pihole?

Dieses System stellt einen DNS-Server im Heimnetzwerk zu Verfügung, mit dessen Hilfe, Domainabfragen der eingebunden Endgeräte im Netzwerk aufzulösen.  
Hierbei wird auf der Basis von Ausschlusslisten (Blacklist) von Domains die als Tracking- oder Werbedomains bekannt sind, bei einem positiven Treffer, dem anfragenden Endgerät im Netzwerk eine unbrauchbare IP-Adresse mitgeteilt. Somit kann durch die Übergabe der unbrauchbaren IP-Adresse diese nicht aufgelöst werden und damit das Endgerät diese Domain nicht auflösen.  
Weiterhin ist es auch mit dem Pi-hole-DNS-Server möglich, die Verlaufsliste der besuchten Domains nachzuverfolgen, was wiederum Datenschutz-Technisch jeder für sich selbst entscheiden muss.  
Durch die Nutzung von Blacklists ist diesem System auch Grenzen gesetzt. Durch die Abarbeitung dieser Liste, kann folglich auch nur die darin enthaltenen Domains überprüft werden. Andere nicht enthaltende Domains können Aufgrund nicht vorhandener Funktion der Inhaltsanalyse, nicht überprüft werden und sind daher aufrufbar.  
Weiterhin findet die Überprüfung nur mittels der genannten Domain-Überprüfung statt. Zugriffe über direkte Eingabe der IP-Adresse der Domain werden nicht überprüft.

### Für wen ist eine Pihole Installation Debian gedacht?

Eine pihole Installation Debian bietet sich für alle diejenigen an, die ihr Heimnetzwerk zentral vor Werbung auf Endgeräten sowie Trackern schützen möchten.  
Der Aufwand für die Installation ist gering und der Betrieb mit einem Raspberry Pi ist sparsam im Verbrauch.

## Hardware-Anforderung für die Pihole Installation Debian

Wie geschrieben, sind die Anforderungen minimal und für jeden Geldbeutel realisierbar.

Ihr könnt die pi-hole Installation entweder in einer dauerhaft virtuellen Umgebung, auf einem Einplatinen-Rechner wie den Raspberry-Pi, oder auf andere Mini-Computer. Ebenso könnt ihr auch hier gerne mein Lieblingsboard APU4D4 für diese Aufgabe verwenden. Einen Beitrag zu diesem Board findet ihr hier.

### Hardware-Anforderungen

- Minimum 512 MB Arbeitsspeicher, besser 1 GB

- Minimum 2 GB freier Festplattenspeicher, besser 4 GB

### Unterstützte Betriebssysteme

- Als Docker-Container

Oder als Installation bei den folgenden unterstützten Betriebssystemen:


| **Distribution** | **Version**        | **Architektur**      |
| ---------------- | ------------------ | -------------------- |
| Raspberry Pi OS  | Bullseye / Bookworm | ARM                  |
| Ubuntu           | 23.x / 24.x / 25.x | ARM / x86\_64        |
| Debian           | 11 / 12            | ARM / x86\_64 / i386 |

---
Auswahl unterstützter debian-basierende Betriebssysteme


## HowTo - Pihole Installation Debian

In diesem HowTo werde ich euch zeigen, wie ihr den Pi-hole DNS-Server auf einer virtuellen Debian 9-Intanz installiert. Diese hier gezeigte Installation ist gleich mit der Installation auf einem Raspberry Pi.

**Nun kommen wir zu der Installation von unserem kleinen Pi-hole DNS-Server.**

### Voraussetzungen - Pihole Installation Debian

Vorgabe ist hierfür eine virtuelle Instanz von Debian 11 oder 12 in einer virtuellen Umgebung, in meinem Fall auf einem Proxmox-Server. Genauso gut funktionieren auch andere Virtualisierungen wie VMWare, Virtual-Box usw.  

**Wie ihr Pi-Hole auf einen Raspberry Pi installieren könnt, erfahrt ihr in diesem Tutorial:**

[Zum Tutorial](/posts/privacy/pihole/pihole-auf-einen-raspberry-pi-installieren/)

#### Benötigte Tools und Voraussetzungen:

- putty oder anderer SSH-Client

- Debain-basierendes OS

### Schritt 1 - Pihole Installation Debian :
![Pihole installieren Debian Bild 1](/images/posts/pihole/pi-hole-Bild-1.jpg)

Pihole installieren Debian - Bild 1

---

![pihole Installation Debian Bild 2](/images/posts/pihole/pi-hole-Bild-2.jpg)


Pihole installieren Debian - Bild 2

---
![pihole Installation Bild 3](/images/posts/pihole/pi-hole-Bild-3.jpg)

Pihole Installation Debian Bild 3

---
![pi-hole Installation Bild 4](/images/posts/pihole/pi-hole-Bild-4.jpg)



Pihole Installation Debian Bild 4

---

Verbindet den SSH-Client mit euer Debain-Instanz als User mit root-Rechten und gibt dann das folgende Kommando in euer Terminal-Fenster ein.

```sh
sudo -s root@<IP-Adresse-Instanz>
wget -O basic-install.sh https://install.pi-hole.net
```

danach gibt ihr noch das folgende Kommando ein:

```sh
bash basic-install.sh
```

Solltet ihr bei den Kommandos eine Fehlermeldung bekommen, dass ihr nicht die nötigen Rechte habt, so seid ihr nicht als root-User angemeldet.  
Dann stellt bitte den Befehl "sudo" dem Kommando "bash basic-install.sh voran.  
Sollte dann so aussehen:

```sh
sudo bash basic-install.sh
```

Ist die Installation von Pi-Hole erfolgreich ausgeführt worden, so solltet euch wie in dem folgenden Bild, die GUI der Installationsroutine von Pi-Hole angezeigt werden.

![pi-hole Installation Bild 5](/images/posts/pihole/pi-hole-Bild-5.jpg) 

GUI Pihole Installation Debian

---

### Schritt 2 - Pihole Installation Debian :

Bei diesem Schritt werden wir die Konfiguration der Pihole Installation DebianPiHole-DNS-Server erstellen. Diese Konfiguration wird komplett über die GUI-Installationsroutine durchgeführt.

Hierbei müssen wir angeben, welchen externe DNS-Server euer Internetprovider nutzt, auf welche IP-Adresse euer Pi-hole später lauschen soll und die Konfiguration des genutzten Standard-Gateway.

#### Standard-Gateway

In den meisten Fällen sollte es sich bei dem Standard-Gateway um den Router der euch von eurem Internetprovider zu Verfügung gestellt wurde. Daher müsst ihr bei der IP-Adresse für den Standard-Gateway dann die IP-Adresse eures Routers eingeben. Bei den meisten Routern dürften dass die IP-Adressen 192.168.178.1 (Fritz-Box) oder 192.168.2.1 (Telekom).  
Solltet ihr eine Hardware-Firewall zwischen Router des Internetproviders und eurem Netzwerk zwischengeschaltet haben, so müsst ihr dann die IP-Adresse eurer Hardware-Firewall eingeben.


![pi-hole Installation Bild 6](/images/posts/pihole/pi-hole-Bild-6.jpg)


(Bild 7) Auswahl des externen DNS-Server hierfür gibt ihr einfach die IP-Adresse eures Routers ein da dieser ja in den meisten Fällen für die externe Auflösung von externen Domains zuständig ist.


![pi-hole Installation Bild 7](/images/posts/pihole/pi-hole-Bild-7.jpg)

Bild 7 - **Auswahl externer DNS-Server**

---
(Bild 8) Auswahl der Blacklist aufgrund Ads und Tracking-Codes geblockt werden. Diese Listen können nach der Installation ausgetauscht oder bearbeitet werden.


![pi-hole Installation Bild 8](/images/posts/pihole/pi-hole-Bild-8.jpg)

Bild 8 - **Auswahl der Blacklist (kann nach der Installation auch durch andere ersetzt werden)**

---
(Bild 9) Auswahl der IP-Protokolle (IPv4, IPv6) bei denen Ads und Tracking-Codes geblockt werden sollen. Lasst hier am besten beide Protokoll-Arten ausgewählt.


![pihole Installation Bild 9](/images/posts/pihole/pi-hole-Bild-9.jpg)

Bild 9 - **Auswahl im welchen Protokoll Ads geblockt werden sollen**

---

(Bild 10) Im nächsten Schritt seht ihr die aktuelle IP-Konfiguration die eurer Pi-hole Installation zugewiesen wurde und die ihr jetzt nach euren Erfordernissen anpassen könnt. Bitte nutzt hierfür auf jeden Fall eine statische IP-Adresse, da ihr diese dann bei der DNS-Zuweisung für eure Clients im Netzwerk hinterlegen müsst und diese dadurch den Pi-hole für die DNS-Auflösung nutzen werden. Sollte diese IP-Adresse nicht mit der vergebenen IP-Adresse des Pi-hole-DNS-Server übereinstimmen, so werdet ihr später im Betrieb massive DNS-Auflösungsprobleme bekommen und könnt somit keine Domains im Internet aufrufen.


![pi-hole Installation Bild 10](/images/posts/pihole/pi-hole-Bild-10.jpg)

Bild 10 - **Übersicht aktuelle IP-Konfiguration des Pi-hole DNS-Server**

---
(Bild 11) Die Vorauswahl, das dass Web-Interface des Pi-hole auch installiert werden soll, können wir so ausgewählt lassen. So kann später durch die Eingabe der Pi-hole-IP-Adresse / pi-hole (Beispiel http://172.16.16.61/admin) oder http://pi-hole/admin, das Web-Interface über euren favorisierten Browser aufgerufen werden, damit ihr so bequem die weiteren Konfigurationen vornehmen könnt.


![pi-hole Installation Bild 11](/images/posts/pihole/pi-hole-Bild-11.jpg)

Bild 11 - **Installation des Pihole-Webinterface bestätigen**

### Schritt 3:
(Bild 12) Die Vorauswahl, das ein lighttpd-Server installiert werden soll, bestætigen, da ihr diesen für das Webinterface des Pihole benötigt.


![pi-hole Installation Bild 12](/images/posts/pihole/pi-hole-Bild-12.jpg)

Bild 12 - **Installation des lighttpd-Server bestätigen**

---
(Bild 13) Im nächsten Schritt würde ich euch auch empfehlen, das log-queries mit aufgezeichnet werden sollen. Diese dienen dazu, später im Betrieb zum Beispiel Verstöße zu speichern und ihr dann auch leichter Anpassungen an der Konfiguration vornehmen könnt.


![pi-hole Installation Bild 13](/images/posts/pihole/pi-hole-Bild-13.jpg)

Bild 13 - **Pihole Logging aktivieren**

---
(Bild 14) - Pihole bietet mehrere Möglichkeiten, die Aufzeichnung der besuchten Domains sowie IP-Adressen zu protokollieren. Welche Protokoll-Stufe ihr hier auswählt, müsst ihr selbst entscheiden.


![pi-hole Installation Bild 14](/images/posts/pihole/pi-hole-Bild-14.jpg)


Bild 14 - **Einstellung 'Privacy mode'**

---
(Bild 15, 16 und 17) Im nächsten Fenster findet ihr nun eine Übersicht über eure Konfiguration, die IP-Adresse unter der ihr euch anmelden könnt (bei Änderung der IP-Adresse, müsst ihr die Instanz neu starten) **sowie das Passwort für die Anmeldung im Web-Interface**. Dieses Passwort könnt ihr dann später noch ändern. Dazu aber gleich mehr im nächsten Schritt.

![pi-hole Installation Bild 15](/images/posts/pihole/pi-hole-Bild-15.jpg)


Bild 15 - **Benachrichtigung über die Fertigstellung der Pihole-Installation** 

![pi-hole Installation Bild 16](/images/posts/pihole/pi-hole-Bild-16.jpg)

Bild 16 - **Anzeige des Passworts für die Anmeldung im Webinterface**

### Schritt 4 - Pihole Installation Debian :

(Bild 17) Öffnet jetzt euren Browser und gibt die vorab angezeigte IP-Adresse gefolgt von /admin in die Browser-Eingabezeile ein und ruft diese per Enter auf. Jetzt sollte der Anmelde-Bildschirm vom Web-Interface eures Pi-hole-DNS-Servers angezeigt werden. Hier gibt ihr eurer vorher angezeigtes Passwort zur Anmeldung ein und werdet dann vom Dashboard von Pihole begrüßt.

![Dashboard / Webinterface Pihole](/images/posts/pihole/pi-hole-installation-beendet.jpg)

Bild 17 - **Dashboard von Pihole** | Pihole Installation Debian Bild 4

### Schritt 5 - Pihole Installation Debian :

Im letzten Schritt müsst ihr natürlich dafür Sorgen, dass alle Geräte den Pi-hole-DNS-Server auch für die DNS-Auflösung im Internet nutzen können.

Dafür meldet euch einfach bei eurem Router an, vorausgesetzt dieser ist auch bei euch als DHCP-Server verantwortlich und gibt hier in den Netzwerk-Einstellungen (DHCP-Server-Einstellungen) unter dem Punkt "DNS-Server", die IP-Adresse eures Pi-hole-DNS-Server ein.

Der nun neue vergebene DNS-Server wird aber erst nach Erneuerung der DHCP-Lease genutzt und wird von den Clients daher nicht eigenmächtig bemerkt. Am einfachsten, ihr trennt die Netzwerkverbindung von eurem Endgerät und bei dem erneuten Verbinden, wird dann die neue Konfiguration geladen und die Geräte sollten im Geräte-Übersicht im Pi-hole angezeigt werden.

> **Funktionsweise einer Domainabfrage in Verbindung mit Pi-hole in diesem Beispiel:**
>
> Client (Endgerät) -> Pi-hole -> Router  

> **INFO**
> 
> In diesem Szenario nutzen nur die Endgeräte den Pi-hole als DNS-Server aber **nicht** der Router selbst.

## Wichtige Befehle für eure PiHole Installation Debian :

### Pihole-Passwort ändern:

Hierfür müsst ihr als superuser im Terminal angemeldet sein und gibt dann den folgenden Befehl ein:

```sh
pi-hole -a -p
```

### Pihole Installation Debian - Update durchführen:

Hierfür müsst ihr als superuser im Terminal angemeldet sein und gibt dann den folgenden Befehl ein:

```sh
pi-hole -up
```


![pi-hole Installation Debian - Bild 17](/images/posts/pihole/pi-hole-Bild-17.jpg)



### Noch mehr zum Thema Pihole

Eine bebilderte Anleitung über die Einrichtung einer FritzBox und auch die Konfiguration für andere Arten der Nutzung der Pi-hole Installation findet ihr auch in der Dokumentation vom Pi-hole-Projekt.

[Webseite besuchen pihole.net](https://docs.pi-hole.net/routers/fritzbox-de/)

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->
