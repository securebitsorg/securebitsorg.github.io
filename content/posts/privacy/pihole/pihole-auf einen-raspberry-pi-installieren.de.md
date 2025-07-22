---
title: Pi-hole Raspberry Pi Installation
date: 2022-03-30
hero: /images/posts/pihole/pi-hole-installation.png
descripton: Pi-hole Raspberry Pi | In diesem Tutorial installieren wir Pihole auf einem Raspberry Pi
menu:
  sidebar:
    name: Pihole auf einen Raspberry Pi installieren
    identifier: pihole-raspberry
    parent: pihole
categories: 
  - "Hardware"
  - "Linux"
  - "Netzwerk"
  - "Security"
  - "Tutorials"
tags: 
  - "security"
  - "linux"
  - "netzwerk"
  - "pi-hole"
  - "raspberry pi"
  - "tutorials"
  - "video"
---

## Pi-hole auf einen Raspberry Pi installieren und einrichten

In diesem Tutorial '**Pi-hole auf einen Raspberry Pi installieren**' zeige ich euch, wie ihr den Pi-hole DNS-Server installieren und mit Unbound einen rekursiven DNS-Server einrichten könnt.

Die Schritt für Schritt-Installation geschiehttps://secure-bits.org/wp-content/uploads/2022/03/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-3.jpght bei diesem Tutorial auf einen Raspberry Pi.

In einem [anderen Tutorial hier auf SecureBits](https://secure-bits.org/pi-hole-installation/), habe ich euch ja schon die **Installation auf einem Debian-System in einer virtuellen Maschine** gezeigt und aufgeführt, sowie warum und wofür ihr einen Pi-Hole DNS-Server einsetzen solltet.

## Video-Tutorial zum Thema 'Pi-hole Raspberry Pi'

Für alle unter euch die lieber die Installation von Pi-hole auf ein Raspberry Pi als Video-Tutorial anschauen möchten, habe ich ein Installations-Video auf meinem YouTube-Kanal veröffentlicht.

In diesem Video zeige ich euch auch, wie ihr mithilfe der UFW-Firewall (Uncomplicated Firewall) euren internen DNS-Server 'Pi-hole' richtig absichert.

{{< youtube PpYwxDCDOc4 >}}

Voraussetzung für die kommende Schritt für Schritt-Anleitung ist, dass ihr auf euren Raspberry Pi, schon ein aktuelles Raspberry OS installiert habt.

Für die unter euch, die noch kein Raspberry Pi OS auf eurer kleinen Box haben, habe ich im kommenden Absatz eine Schnell-Anleitung hierzu erstellt.

Pi-hole auf einen Raspberry Pi zu installieren, geht mit dem **Raspberry Pi Imager** schnell und einfach von der Hand.

Hierzu braucht ihr nur eine microSD-Karte + einem Dummy-Slot im SD-Karten-Format und einen SD-Kartenleser.

Den Raspberry Pi Imager könnt ihr euch hier herunterladen:

[https://www.raspberrypi.com/software/](https://www.raspberrypi.com/software/)

#### Pi-hole auf einen Raspberry Pi - Installationsvorgang Raspberry OS

Nach dem Download öffnet ihr Raspberry PI Imager (in diesem Beispiel für Windows), steckt eine SD-Karte in euren SD-Reader und wählt im Imager das passende OS für den Raspberry Pi aus. Hier solltet ihr darauf achten, dass ihr hier entweder die Raspberry PI OS Lite in der 64bit- oder 32bit-Variante auswählt. Die Lite-Variante reicht für den Betrieb des Pi-hole vollkommen aus.

Nach der Auswahl des passenden OS wählt ihr noch die passende SD-Karte für das Image aus und bevor ihr auf Schreiben klickt, klickt ihr noch auf das Zahnrad auf der Oberfläche des Raspberry PI Imager und aktiviert hier den Zugriff via SSH und vergibt ein sicheres Passwort für den Zugriff.

![Installationsvorgang Raspberry OS Bild 1](/images/posts/pihole/Raspberry-OS-installieren-Bild-1.jpg)

![Installationsvorgang Raspberry OS Bild 2](/images/posts/pihole/Raspberry-OS-installieren-Bild-2.jpg) 
![Installationsvorgang Raspberry OS Bild 3](/images/posts/pihole/Raspberry-OS-installieren-Bild-3.jpg)

## Pihole installieren

### Pi-Hole auf einen Raspberry Pi installieren

Als Erstes werden wir Pi-hole auf einen Raspberry Pi installieren und einrichten.  
Voraussetzung für dieses Tutorial ist, dass ihr das Raspberry OS auf euren Raspberry Pi schon installiert habt und ihr diesen dann in euer Netzwerk eingebunden habt. Soll heißen, Anschluss an euren Router, Einschalten und dann die IP-Adresse in der Netzwerkübersicht eures Routers herausfinden.  
Diese IP-Adresse brauchen wir später für den Zugriff via SSH auf den Raspberry Pi.

#### Gerät:

- Für den Betrieb eines Pi-hole-DNS-Server reicht ein Board ab der Baureihe Raspberry Pi 3 Model B+ vollkommen aus

#### Voraussetzungen:

- Raspberry Pi mit aktuellem Raspberry OS
- Anschluss des Raspberry Pi an euren Router und Überprüfen welche IP-Adresse dem Raspberry Pi in eurem Netzwerk vergeben wurde.

#### Schritt für Schritt Pi-hole auf einen Raspberry Pi installieren:

#### Schritt 1

![SSH-Verbindung zum Raspberry Pi](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-0.jpg)

Zunächst verbinden wir uns per SSH mit dem Raspberry Pi. Hierzu öffnet ihr zum Beispiel ein Terminal-Fenster (unter Windows nutze ich den Windows Terminal) und gibt den folgenden Befehl ein:  
`ssh pi@<IP-Adresse eures Raspberry Pi>`  
Nun werdet ihr bei der ersten Verbindung per SSH gefragt, ob ihr dem SSH-Key vertrauen wollt und bestätigt diese Frage mit 'yes'.  
Danach müsst ihr noch euer erstelltes Passwort für die Anmeldung eingeben.

#### Schritt 2

![Raspberry OS aktualisieren](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-1.jpg)

Als Erstes werden wir uns als root-User dauerhaft für diese Sitzung anmelden.  
```sh
sudo su
```  
Dann bringen wir das Raspberry OS mit dem folgendem Befehl auf den aktuellen Stand:  
```sh
apt-get update && apt-get upgrade -y
```

#### Schritt 3

![Pi-hole herunterladen und Installationsprozess starten](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-2.jpg)

Die Installation des Pi-hole DNS-Server starten wir mit der Eingabe des folgenden Befehls:  
```sh
curl -sSL https://install.pi-hole.net | bash
```

#### Schritt 4

![Installationsassistent Pi-hole](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-3.jpg)

Wenn die Installation des Pi-hole abgeschlossen ist, werdet ihr von dem Installations-Assistenten begrüßt.  
Hier '**OK**' auswählen und den Einrichtungs-Dialog starten.

#### Schritt 5

![Feste IP-Adresse Raspberry Pi](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-4.jpg)

Solltet ihr euren Raspberry Pi noch keine feste / statische IP-Adresse in eurem Router (FritzBox, Speedport, pfsense, etc.) vergeben haben, könnt ihr das auch noch nach der fertigen Installation machen.  
In diesem Fenster bitte '**Yes**' auswählen und dann die Eingabe-Taste drücken.

#### Schritt 6

![IP-Adresse des Raspberry Pi / Pi-hole anzeigen lassen](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-5.jpg)

Im nächsten Fenster wird euch die IP-Adresse des Pi-hole angezeigt. Diese IP-Adresse müsst ihr dann auch als feste Adresse auf euren Router / DHCP-Server vergeben, damit der Pi-hole DNS-Server später auch erreichbar ist.

#### Schritt 7

![Öffentlichen DNS-Server auswählen](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-6.jpg)

Als nächstes wählt ihr einen Upstream-DNS-Provider für das Auflösen der Anfragen aus eurem Netzwerk aus. Hier könnt ihr einen aus der Liste auswählen, in meinem Fall **OpenDNS** der auch **DNSSEC** unterstützt.  
Die Auswahl könnt ihr später jederzeit ändern, was ich euch auch empfehlen würde. Eine Liste von DNS-Servern, die auch Datenschutzfreundlich sind, findet ihr in der Liste weiter unten in diesem Tutorial.

#### Schritt 8

![Pi-hole Blacklist auswählen](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-7.jpg)

Im Auswahlfenster um eine **Blacklist (Filterliste) auszuwählen**, wird derzeit nur die **StevenBlack-Blackliste** zur Verfügung gestellt. Diese Filterliste ist aber jeden Fall zu empfehlen, kann aber in der Weboberfläche des Pi-hole geändert beziehungsweise durch weitere Listen ergänzt werden.

#### Schritt 9

![Pi--hole Web-Admin Dashboard installieren](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-9.jpg)

Nach einem Klick auf '**OK**' erscheint das Konfigurationsfenster für die spätere Web-Oberfläche für den Pi-hole. Hier bitte die **voreingestellte Auswahl 'ON' belassen**. So könnt ihr dann später das Ganze im Browser Administrieren.

#### Schritt 10

![Pi-hole lighttpd](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-9.jpg)

Um das Web-Interface auch nutzen zu können, bringt Pi-hole mit lighttpd einen eigenen leichtgewichtigen Webserver mit. Auch hier solltet ihr im Normalfall die Voreinstellung belassen und diesen Webserver mitinstallieren.

#### Schritt 11

![Pi-hole Logging aktivieren](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-10.jpg)

Im jetzigen Fenster könnt ihr auswählen, ob der Pi-hole Protokolle über Ereignisse anlegen soll. Auch hier würde ich es bei der Vorauswahl belassen.

#### Schritt 12

![Pi-hole Privacy-Einstellungen](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-11.jpg)

Beim Auswahl des '**Privacy-Mode**' müsst ihr für euch Auswählen welcher Modus hier der richtige für euch ist. Ich für meinen Teil nutze den **Modus 'Show Everything' in meinem eigenen Netzwerk**.  
Wollt ihr den Pi-Hole geschäftlich Betrieb nutzen, so würde ich euch bezüglich der DSGVO raten, den '**Anonymous-Mode**' zu verwenden.

#### Schritt 13

![Erste Anmeldung auf dem Pi-hole](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-12.jpg)

Im letzten Schritt der Installationsroutine des Pi-hole, bekommt ihr die wichtigsten Informationen für den späteren Zugriff auf den Pi-hole-DNS-Server.  
Zunächst ist hier die IP-Adresse des Pi-hole-DNS-Server zu sehen. Dann die Adresse, mit der ihr das Web-Interface des Pi-hole erreichen könnt. In meinem Fall ist das `**http://172.18.18.62/admin**`  
Und ganz wichtig, bekommt ihr noch das generierte Passwort angezeigt, welches ihr zur Authentifizierung bei der Anmeldung über die Shell oder dem Web-Interface braucht. Weiter unten in diesem Beitrag findet zeige ich euch, wie ihr das Passwort ändern könnt.

### Pi-hole auf einen Raspberry Pi - Tipps und Tricks

Hier habe ich euch mal einige nützliche Tipps zusammengestellt den ihr für euren Alltag oder bei der Einrichtung eures Pi-hole sicherlich gebrauchen könnt.

#### Update des Pi-hole - Pi-hole auf einen Raspberry Pi

In der Weboberfläche des Pi-hole bekommt ihr unten in der Fußleiste angezeigt, wenn ein neues Update verfügbar ist. Leider kann das Update nur über eine SSH-Verbindung eingespielt werden.

Um das Update einzuspielen verbindet ihr auch per SSH mit dem Raspberry Pi:

```sh
ssh pi@&<IP-Adresse des Raspberry Pi>

# Nach der Eingabe eures Passworts, gibt ihr für die Ausführung des Updates den folgenden Befehl ein:

pihole -up

# Nach dem Update sollte der Pi-hole rebootet werden
```

#### Pi-hole-Passwort für den Login ändern - Pi-hole auf einen Raspberry Pi

Mit dem folgenden Befehl könnt ihr das Passwort für die Anmeldung an eurem Pi-hole-DNS-Server ändern.

```sh
# Möglichkeit 1: Passwort ändern mit Anzeige des neuen Passworts

pihole -a -p NeuesPasswort

# Möglickeit 2: Passwort ändern ohne Anzeige

pihole -a -p

# Hier kommt dann die Abfrage nach euren neuen Passwort, welches Unix-Typisch bei der Eingabe nicht angezeigt wird.
```

#### Pi-hole IP-Adresse ändern - Pi-hole auf einen Raspberry Pi

Um die IP-Adresse des Pi-hole-DNS-Servers im Nachhinein zu ändern, müsst ihr per SSH die dhspsc.conf-Datei bearbeiten.

```sh
# per SSH mit dem Pi-hole verbinden und dann, dass folgende Kommando eingeben, um mit dem Nano-Editor die dhcpcd.conf-Datei zu berarbeiten

sudo nano /etc/dhcpcd.conf

# Im Nano-Editor-Fenster, hier bei 'static-ip-address' die neue IP-Adresse abändern und mit STRG+O und ENTER die Eingaben abspeichern und mit STRG+X den Nano-Editor verlassen. Siehe nächstes Bild
```

![Raspberry Pi statische IP-Adresse vergeben](/images/posts/pihole/pi-hole-IP-Adresse-aendern.jpg)

#### Konfiguration / Setup des Pi-hole neu ausführen - Pi-hole auf einen Raspberry Pi

Um nochmals das Setup der Pi-hole-Installation auszuführen, könnt ihr euch per SSH mit dem Raspberry Pi verbinden und das Setup mit dem folgenden Befehl neustarten

```sh
pihole -r
```

#### Deinstallieren des Pi-hole - Pi-hole auf einen Raspberry Pi

Ist der Pi-hole-DNS-Server nicht euer Ding, so könnt ihr mit dem folgenden Befehl Pi-hole wieder deinstallieren.

```sh
# Pi-hole deinstallieren

pihole uninstall

```

### Pi-hole auf einen Raspberry Pi - Blacklist-Empfehlung

Außer der vorinstallierten Blacklist 'SteveBlack' gibt es noch einige andere gute Listen, die euch hier vorstellen möchte.

> #### Bitte beachten!
>
> Nutzt bitte nicht zu viele Listen. Da die Abarbeitung der Listen sehr zur Lasten der Performance geht und der Raspberry Pi dann in die Knie geht.
>
> Mit den vorgestellten Blacklists habe ich bisher sehr gute Erfahrungen gemacht und möchte diese daher gerne weiterempfehlen.

#### Blacklist SteveBlack

Die Blacklist, die wir bei der Installation des Pi-hole schon mitinstalliert haben ist wirklich sehr umfänglich und sollte auch weiterhin genutzt werden. Diese Liste ist sehr umfassend und hat zurzeit circa 150000 Einträge enthalten.


Enthalten sind hier folgende Host-Kategorien:

- Porn

- Adware

- Malware

- Fakenews

- Gambling (verdächtige Hosts)

- Social

[https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts](https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts)

#### Blacklist adaway.org

Werbeblocker

[https://adaway.org/hosts.txt](https://adaway.org/hosts.txt)

#### Blacklist SmartTV-Tracking

Name ist Programm

[https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt](https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt)

#### Blacklist EasyPrivacy

Tracking und Telemetrie

[https://v.firebog.net/hosts/Easyprivacy.txt](https://v.firebog.net/hosts/Easyprivacy.txt)

#### Blacklist EasyList

Werbeblocker

[https://v.firebog.net/hosts/Easylist.txt](https://v.firebog.net/hosts/Easylist.txt)

#### Blacklist AdGuardDNS

Diese Blacklist stammt von dem Konkurrent AdGuard und ist ebenfalls sehr umfassend.

[https://v.firebog.net/hosts/AdguardDNS.txt](https://v.firebog.net/hosts/AdguardDNS.txt)

#### Malicious URL Blocklist (von URLHaus)

[https://adguardteam.github.io/HostlistsRegistry/assets/filter\_11.txt](https://adguardteam.github.io/HostlistsRegistry/assets/filter_11.txt)

#### The Big List of Hacked Malware Web Sites

[https://adguardteam.github.io/HostlistsRegistry/assets/filter\_9.txt](https://adguardteam.github.io/HostlistsRegistry/assets/filter_9.txt)

#### Blacklist Telemetrie Microsoft / Windows

Vermeidung Telemetrie Erfassung von Microsoft-Produkte

[https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt](https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt)

### Vertrauenswürdige DNS-Server - Pi-hole auf einen Raspberry Pi

Hier eine Auflistung von datenschutzkonformen DNS-Server-Provider, die kein Logging betreiben und zensurfrei sind.

**Für mich persönlich kommt momentan nur ein DNS-Server mit DoT aus sicherheitstechnischen Gründen in Frage.**

_Danke an [privacy-handbuch.de](https://www.privacy-handbuch.de/) für die Auflistung der DNS-Server._

#### Freifunk München (normales DNS, DNS-over-TLS und DNS-over-HTTPS)

```sh
IPv4: 5.1.66.255
IPv6: 2001:678:e68:f000::
Servername: dot.ffmuc.net
IPv4: 185.150.99.255
IPv6: 2001:678:ed0:f000::
Servername: dot.ffmuc.net
```

#### Digitale Gesellschaft (CH) (DNS-over-TLS und DNS-over-HTTPS!)

```sh
IPv4: 185.95.218.42
IPv6: 2a05:fc84::42
Servername: dns.digitale-gesellschaft.ch
IPv4: 185.95.218.43
IPv6: 2a05:fc84::43
Servername: dns.digitale-gesellschaft.ch
```

#### Censurfridns Denmark (aka. UncensoredDNS)

```sh
IPv4: 91.239.100.100
IPv6: 2001:67c:28a4::
IPv4: 89.233.43.71
IPv6: 2a01:3a0:53:53::
(mit DNS-over-TLS)
```

## Fazit - Pi-hole auf einen Raspberry Pi

Der Einsatz eines Pi-hole-DNS-Server ist eine super und günstige Sache (außer der PI ist wegen Halbleiter-Mangel wie im Moment schwer zu bekommen und daher sehr teuer) sich vor Tracking, Malware und Adware zu schützen.

Gerade im heimischen Netzwerk kann dieser DNS-Server wunderbar an einem Consumer-Router wie FritzBox, Speedport und andere als Nameserver implementiert werden. So hat man einen wunderbaren Schutz vor Tracking, Werbung, Malware und Pishing auf allen Geräten im Netzwerk. Natürlich ist dieser Schutz nicht hundertprozentig, aber sicherlich besser als nichts für seinen Datenschutz zu unternehmen.

Gerne könnt ihr mir auch Vorschläge für Blacklists die ihr in Verwendung habt zukommen lassen. Darüber würde ich mich echt freuen!
