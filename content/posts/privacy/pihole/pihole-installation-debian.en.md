---
title: Pi-hole Installation - Schütze dein Heimnetzwerk
date: 2021-03-07
categories:
  - linux
  - netzwerk
  - security
  - tutorials
  - video
tags:
  - linux
  - netzwerk
  - pi-hole
  - security
  - tipps-tutorials
  - video
coverImage: pi-hole-installation.png
draft: true
---

## Pi-hole Installation - Schütze dein Netzwerk vor Tracking und Werbung

Wer in seinem Heimnetzwerk Trackern, In-App-Werbung und Werbe-Botschaften den Kampf ansagen möchte, der sollte sich mit pi-hole ein wenig beschäftigen.

Natürlich werden jetzt einige denken, ich nutze doch beim Surfen einen AD-Blocker, warum dann noch ein extra Gerät für solche Dienste?! Diese Frage kann ich nachvollziehen, doch ist die Antwort ganz einfach.

Eine **Pi-hole Installation / Server** schützt euch zentral vor Werbung und Trackern, da pi-hole als zentraler DNS-Server im Netzwerk fungiert und somit nicht nur Computer vor den lästigen Schnüffelwerkzeugen schützt, sondern auch andere Geräte im Netzwerk. So zum Beispiel Smart-TV´s, Werbung in Apps auf euren Smartphone und funktioniert gleichzeitig auch als "Kindersicherung". So dass euer Nachwuchs beim Surfen im Internet geschützt ist.

### Wie funktioniert Pi-hole?

Dieses System stellt einen DNS-Server im Heimnetzwerk zu Verfügung, mit dessen Hilfe, Domainabfragen der eingebunden Endgeräte im Netzwerk aufzulösen.  
Hierbei wird auf der Basis von Ausschlusslisten (Blacklist) von Domains die als Tracking- oder Werbedomains bekannt sind, bei einem positiven Treffer, dem anfragenden Endgerät im Netzwerk eine unbrauchbare IP-Adresse mitgeteilt. Somit kann durch die Übergabe der unbrauchbaren IP-Adresse diese nicht aufgelöst werden und damit das Endgerät diese Domain nicht auflösen.  
Weiterhin ist es auch mit dem Pi-hole-DNS-Server möglich, die Verlaufsliste der besuchten Domains nachzuverfolgen, was wiederum Datenschutz-Technisch jeder für sich selbst entscheiden muss.  
Durch die Nutzung von Blacklists ist diesem System auch Grenzen gesetzt. Durch die Abarbeitung dieser Liste, kann folglich auch nur die darin enthaltenen Domains überprüft werden. Andere nicht enthaltende Domains können Aufgrund nicht vorhandener Funktion der Inhaltsanalyse, nicht überprüft werden und sind daher aufrufbar.  
Weiterhin findet die Überprüfung nur mittels der genannten Domain-Überprüfung statt. Zugriffe über direkte Eingabe der IP-Adresse der Domain werden nicht überprüft.

### Für wen ist eine Pi-hole Installation gedacht?

Eine pi-hole Installation bietet sich für alle diejenigen an, die ihr Heimnetzwerk zentral vor Werbung auf Endgeräten sowie Trackern schützen möchten.  
Der Aufwand für die Installation ist gering und der Betrieb mit einem Raspberry Pi ist sparsam im Verbrauch.

## Hardware-Anforderung für die Pi-hole Installation

Wie geschrieben, sind die Anforderungen minimal und für jeden Geldbeutel realisierbar.

Ihr könnt die pi-hole Installation entweder in einer dauerhaft virtuellen Umgebung, auf einem Einplatinen-Rechner wie den Raspberry-Pi, oder auf andere Mini-Computer. Ebenso könnt ihr auch hier gerne mein Lieblingsboard APU4D4 für diese Aufgabe verwenden. Einen Beitrag zu diesem Board findet ihr hier.

### Hardware-Anforderungen

- Minimum 512 MB Arbeitsspeicher, besser 1 GB

- Minimum 2 GB freier Festplattenspeicher, besser 4 GB

### Unterstützte Betriebssysteme

- Als Docker-Container

Oder als Installation bei den folgenden unterstützten Betriebssystemen:

<figure>

| **Distribution** | **Version**        | **Architektur**      |
| ---------------- | ------------------ | -------------------- |
| Raspberry Pi OS  | Stretch / Buster   | ARM                  |
| Ubuntu           | 16.x / 18.x / 20.x | ARM / x86\_64        |
| Debian           | 9 / 10             | ARM / x86\_64 / i386 |
| Fedora           | 31 / 32            | ARM / x86\_64        |
| CentOS           | 7 / 8              | x86\_64              |

<figcaption>

Unterstützte Betriebssysteme Pi-hole

</figcaption>

</figure>

### Meine empfohlene Hardware für den Betrieb eines Pi-hole-DNS-Server in eurem Netzwerk

Für den Betrieb des DNS-Server in eurem Heimnetzwerk würde ich euch einen Raspberry-Pi-Einplatinen-Computer empfehlen. Dieser ist sparsam im Gebrauch und für wohl die meisten Netzwerke bei euch Zuhause von der Leistung her, mehr als ausreichend.

#### Hier meine Empfehlung die ihr für den Betrieb braucht:

**Empfehlung 1:**

Dies ist das von mir genutzte Raspberry-Pi-Kit und hat einige zusätzliche Features dabei und ist auch für andere Projekte durch einen zusätzlichen Lüfter, drei unterschiedliche Kupfer-Kühlkörper, Netzteil mit Ein- / Ausschalter, 64 GB SD-Karte und 4 GB RAM Arbeitsspeicher, bestens geeignet.

\[amazon box="B09B9M7TPP"/\]

**Empfehlung 2:**

Wer es noch ein wenig performanter braucht, dem sei dieses Raspberry-Pi-Kit ans Herz gelegt. Dieses Kit bietet 8 GB RAM Arbeitsspeicher.

\[amazon box="B09B9PLZ3R"/\]

## HowTo - Pi-hole Installation

In diesem HowTo werde ich euch zeigen, wie ihr den Pi-hole DNS-Server auf einer virtuellen Debian 9-Intanz installiert. Diese hier gezeigte Installation ist gleich mit der Installation auf einem Raspberry Pi.

**Nun kommen wir zu der Installation von unserem kleinen Pi-hole DNS-Server.**

### Voraussetzungen - Pi-hole Installation

Vorgabe ist hierfür eine virtuelle Instanz von Debian 9 oder 10 in einer virtuellen Umgebung, in meinem Fall auf einem Proxmox-Server. Genauso gut funktionieren auch andere Virtualisierungen wie VMWare, Virtual-Box usw.  

Wie ihr Pi-Hole auf einen Raspberry Pi installieren könnt, erfahrt ihr in diesem Tutorial:

[Zum Tutorial](https://secure-bits.org/pi-hole-auf-einen-raspberry-pi-installieren/)

#### Benötigte Tools und Voraussetzungen:

- putty oder anderer SSH-Client

- Debain 9 oder 10

### Schritt 1:

<figure>

<figure>

![pi-hole Installation Bild 1](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-1.jpg)

<figcaption>

Bild 1

</figcaption>

</figure>

<figure>

![pi-hole Installation Bild 2](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-2.jpg)

<figcaption>

Bild 2

</figcaption>

</figure>

<figure>

![pi-hole Installation Bild 3](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-3.jpg)

<figcaption>

Bild 3

</figcaption>

</figure>

<figure>

![pi-hole Installation Bild 4](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-4.jpg)

<figcaption>

Bild 4

</figcaption>

</figure>

</figure>

Verbindet den SSH-Client mit euer Debain-Instanz als User mit root-Rechten und gibt dann das folgende Kommando in euer Terminal-Fenster ein.

```
wget -O basic-install.sh https://install.pi-hole.net
```

danach gibt ihr noch das folgende Kommando ein:

```
bash basic-install.sh
```

Solltet ihr bei den Kommandos eine Fehlermeldung bekommen, dass ihr nicht die nötigen Rechte habt, so seid ihr nicht als root-User angemeldet.  
Dann stellt bitte den Befehl "sudo" dem Kommando "bash basic-install.sh voran.  
Sollte dann so aussehen:

```
sudo bash basic-install.sh
```

Ist die Installation von Pi-Hole erfolgreich ausgeführt worden, so solltet euch wie in dem folgenden Bild, die GUI der Installationsroutine von Pi-Hole angezeigt werden.

<figure>

![pi-hole Installation Bild 5](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-5.jpg)

<figcaption>

GUI Pi-hole Installation

</figcaption>

</figure>

### Schritt 2:

Bei diesem Schritt werden wir die Konfiguration der Pi-Hole-DNS-Server erstellen. Diese Konfiguration wird komplett über die GUI-Installationsroutine durchgeführt.

Hierbei müssen wir angeben, welchen externe DNS-Server euer Internetprovider nutzt, auf welche IP-Adresse euer Pi-hole später lauschen soll und die Konfiguration des genutzten Standard-Gateway.

#### Standard-Gateway

In den meisten Fällen sollte es sich bei dem Standard-Gateway um den Router der euch von eurem Internetprovider zu Verfügung gestellt wurde. Daher müsst ihr bei der IP-Adresse für den Standard-Gateway dann die IP-Adresse eures Routers eingeben. Bei den meisten Routern dürften dass die IP-Adressen 192.168.178.1 (Fritz-Box) oder 192.168.2.1 (Telekom).  
Solltet ihr eine Hardware-Firewall zwischen Router des Internetproviders und eurem Netzwerk zwischengeschaltet haben, so müsst ihr dann die IP-Adresse eurer Hardware-Firewall eingeben.

<figure>

[![pi-hole Installation Bild 6](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-6.jpg)](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-6.jpg)

<figure>

[![pi-hole Installation Bild 7](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-7.jpg)](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-7.jpg)

<figcaption>

Bild 9 - **Auswahl externer DNS-Server**

</figcaption>

</figure>

<figure>

[![pi-hole Installation Bild 8](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-8.jpg)](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-8.jpg)

<figcaption>

Bild 10 - **Auswahl der Blacklist (kann nach der Installation auch durch andere ersetzt werden)**

</figcaption>

</figure>

<figure>

[![pi-hole Installation Bild 9](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-9.jpg)](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-9.jpg)

<figcaption>

Bild 11 - **Auswahl im welchen Protokoll Ads geblockt werden sollen**

</figcaption>

</figure>

<figure>

[![pi-hole Installation Bild 10](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-10.jpg)](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-10.jpg)

<figcaption>

Bild 12 - **Übersicht aktuelle IP-Konfiguration des Pi-hole DNS-Server**

</figcaption>

</figure>

</figure>

In den oben gezeigten Bildern seht ihr die ersten Schritte der GUI-Installationsroutine, die sich wie folgt beschreiben lassen:

1. (Bild 9) Auswahl des externen DNS-Server hierfür gibt ihr einfach die IP-Adresse eures Routers ein da dieser ja in den meisten Fällen für die externe Auflösung von externen Domains zuständig ist. .

2. (Bild 10) Auswahl der Blacklist aufgrund Ads und Tracking-Codes geblockt werden. Diese Listen können nach der Installation ausgetauscht oder bearbeitet werden.

3. (Bild 11) Auswahl der IP-Protokolle (IPv4, IPv6) bei denen Ads und Tracking-Codes geblockt werden sollen. Lasst hier am besten beide Protokoll-Arten ausgewählt.

4. (Bild 12) Im nächsten Schritt seht ihr die aktuelle IP-Konfiguration die eurer Pi-hole Installation zugewiesen wurde und die ihr jetzt nach euren Erfordernissen anpassen könnt. Bitte nutzt hierfür auf jeden Fall eine statische IP-Adresse, da ihr diese dann bei der DNS-Zuweisung für eure Clients im Netzwerk hinterlegen müsst und diese dadurch den Pi-hole für die DNS-Auflösung nutzen werden. Sollte diese IP-Adresse nicht mit der vergebenen IP-Adresse des Pi-hole-DNS-Server übereinstimmen, so werdet ihr später im Betrieb massive DNS-Auflösungsprobleme bekommen und könnt somit keine Domains im Internet aufrufen.

### Schritt 3:

<figure>

<figure>

[![pi-hole Installation Bild 11](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-11.jpg)](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-11.jpg)

<figcaption>

Bild 13

</figcaption>

</figure>

<figure>

[![pi-hole Installation Bild 12](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-12.jpg)](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-12.jpg)

<figcaption>

Bild 14

</figcaption>

</figure>

<figure>

[![pi-hole Installation Bild 13](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-13.jpg)](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-13.jpg)

<figcaption>

Bild 15

</figcaption>

</figure>

<figure>

[![pi-hole Installation Bild 14](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-14.jpg)](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-14.jpg)

<figcaption>

Bild 16

</figcaption>

</figure>

<figure>

[![pi-hole Installation Bild 15](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-15.jpg)](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-15.jpg)

<figcaption>

Bild 17

</figcaption>

</figure>

</figure>

1. (Bild 13) Die Vorauswahl, das dass Web-Interface des Pi-hole auch installiert werden soll, können wir so ausgewählt lassen. So kann später durch die Eingabe der Pi-hole-IP-Adresse / pi-hole (Beispiel http://172.16.16.61/admin) oder http://pi-hole/admin, das Web-Interface über euren favorisierten Browser aufgerufen werden, damit ihr so bequem die weiteren Konfigurationen vornehmen könnt.

2. (Bild 14) In den meisten Fällen müsst ihr den im nächsten Fenster vorausgewählten Vorschlag, den Webserver zu installieren, ausgewählt lassen, da ansonsten kein Webserver-Instanz betrieben werden kann und ihr so keinen Zugriff auf das Web-Interface haben wird.

3. (Bild 15) Im nächsten Schritt würde ich euch auch empfehlen, das log-queries mit aufgezeichnet werden sollen. Diese dienen dazu, später im Betrieb zum Beispiel Verstöße zu speichern und ihr dann auch leichter Anpassungen an der Konfiguration vornehmen könnt.

4. (Bild 16) Welche Daten ihr an das Projekt weitergeben möchtet, könnt ihr im nächsten Fenster bestimmen. In meinem Fall habe ich hier die Weitergabe von Daten in der anonymisierten Form zugestimmt.

5. (Bild 17) Im nächsten Fenster findet ihr nun eine Übersicht über eure Konfiguration, die IP-Adresse unter der ihr euch anmelden könnt (bei Änderung der IP-Adresse, müsst ihr die Instanz neu starten) **sowie das Passwort für die Anmeldung im Web-Interface**. Dieses Passwort könnt ihr dann später noch ändern. Dazu aber gleich mehr im nächsten Schritt.

### Schritt 4:

<figure>

<figure>

[![pi-hole Installation Bild 16](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-16.jpg)](https://secure-bits.org/pi-hole-installation/pi-hole-bild-16/)

<figcaption>

Bild 18

</figcaption>

</figure>

[![pi-hole Installation Bild 17](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-Bild-17.jpg)](https://secure-bits.org/pi-hole-installation/pi-hole-bild-17/)

<figure>

[![pi-hole Installation Bild 18](https://secure-bits.org/wp-content/uploads/2021/03/pi-hole-installation-beendet-674x520.jpg)](https://secure-bits.org/pi-hole-installation/pi-hole-installation-beendet/)

<figcaption>

Bild 20

</figcaption>

</figure>

</figure>

1. (Bild 18) Im Terminal-Fenster seht ihr nun eine Übersicht über die aktiven Dienste, IP-Adresse des Pi-hole-DNS-Server und wie ihr euch dort anmelden könnt. Hier steht auch beschrieben, wie ihr das automatisch vergebene Passwort ändern könnt, was ich euch am Ende von Schritt 4 noch zeigen werde.

2. (Bild 20) Öffnet jetzt euren Browser und gibt die vorab angezeigte IP-Adresse gefolgt von /admin in die Browser-Eingabezeile ein und ruft diese per Enter auf. Jetzt sollte der Anmelde-Bildschirm vom Web-Interface eures Pi-hole-DNS-Servers angezeigt werden.

#### Wichtige Befehle für eure Pi-Hole Installation:

##### Pi-hole-Passwort ändern:

Hierfür müsst ihr als superuser im Terminal angemeldet sein und gibt dann den folgenden Befehl ein:

```
pi-hole -a -p
```

##### Pi-hole Installation Update durchführen:

Hierfür müsst ihr als superuser im Terminal angemeldet sein und gibt dann den folgenden Befehl ein:

```
pi-hole -up
```

### Schritt 5:

Im letzten Schritt müsst ihr natürlich dafür Sorgen, dass alle Geräte den Pi-hole-DNS-Server auch für die DNS-Auflösung im Internet nutzen können.

Dafür meldet euch einfach bei eurem Router an, vorausgesetzt dieser ist auch bei euch als DHCP-Server verantwortlich und gibt hier in den Netzwerk-Einstellungen (DHCP-Server-Einstellungen) unter dem Punkt "DNS-Server", die IP-Adresse eures Pi-hole-DNS-Server ein.

Der nun neue vergebene DNS-Server wird aber erst nach Erneuerung der DHCP-Lease genutzt und wird von den Clients daher nicht eigenmächtig bemerkt. Am einfachsten, ihr trennt die Netzwerkverbindung von eurem Endgerät und bei dem erneuten Verbinden, wird dann die neue Konfiguration geladen und die Geräte sollten im Geräte-Übersicht im Pi-hole angezeigt werden.

**Funktionsweise einer Domainabfrage in Verbindung mit Pi-hole in diesem Beispiel:**

Client (Endgerät) -> Pi-hole -> Router  

In diesem Szenario nutzen nur die Endgeräte den Pi-hole als DNS-Server aber **nicht** der Router selbst.

### Noch mehr zum Thema Pi-hole

Eine bebilderte Anleitung über die Einrichtung einer FritzBox und auch die Konfiguration für andere Arten der Nutzung der Pi-hole Installation findet ihr auch in der Dokumentation vom Pi-hole-Projekt.

[Webseite besuchen](https://docs.pi-hole.net/routers/fritzbox-de/)

# 
