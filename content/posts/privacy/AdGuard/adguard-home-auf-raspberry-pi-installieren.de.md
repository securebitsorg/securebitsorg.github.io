---
title: "AdGuard Home Raspberry Pi Installation"
descripton: "AdGuard Home Raspberry Pi Installation | In diesem Tutorialziege ich euch, wie ihr AdGuard Home auf einem Raspberry Pi installiert."
hero: /images/posts/adguard/Video-Thumbnail.png
date: 2022-08-23
menu:
  sidebar:
    name: AdGuardHome auf einen Raspberry Pi installieren
    identifier: adguard-raspberry-pi
    parent: adguard
categories: 
  - "Linux"
  - "Netzwerk"
  - "Security"
  - "Tutorials"
  - "Video"
tags: 
  - "adguard"
  - "netzwerk"
  - "security"
  - "tutorials"
  - "video"
  - "raspberry pi"
---
## Mit AdGuard dein Netzwerk vor Werbung und Trackern schützen

Im heutigen Tutorial '**AdGuard Raspberry Pi Installation**' möchte ich euch zeigen, wir ihr den **AdGuard DNS-Server** auf einen **Raspberry Pi ab Version 3** installieren könnt.

Mit diesem DNS-Server habt ihr dann ähnlich wie bei dem **pihole DNS-Server** ([zum Tutorial hier entlang](https://secure-bits.org/pi-hole-auf-einen-raspberry-pi-installieren/)) die Möglichkeit, die meiste Werbung und Datentracker aus eurem Heimnetzwerk zu verbannen.

Solltet ihr noch Hardware für euren AdGuard-DNS-Server benötigen, dann schaut am [Ende von diesem Beitrag. Dort habe ich eine kleine Liste erstellt.](#hardware)

### Video-Tutorial - AdGuard Raspberry Pi Home Installation

**Wer von euch lieber die einzelnen Schritte zu 'AdGuard Raspberry Pi Installation' als Video-Tutorial schauen möchte, der kann dies auf meinem YouTube-Kanal tun.**

**Hierzu einfach auf das untere Bild klicken.**

{{< youtube PF2WH2llwSg >}}

### Alternative zu 'AdGuard Home Raspberry Pi Installation' gesucht?

Dann schaut euch doch meine Schritt- für Schritt-Anleitung an, wie ihr den DNS-Server **Pi-hole** auf einen Raspberry PI installieren könnt.

[Zum Tutorial]()

### Hinweis!

Bei dem Befehl zum Entpacken der Datei "`sudo tar xvf AdGuardHome_linux_armv7.tar.gz`" hatte sich ein Tippfehler eingeschlichen. Bei diesem Befehl fehlte das "v" bei "armv7" und daher konnte die Datei natürlich nicht entpackt werden! Vielen Dank an **Sebastian** für diesen Hinweis!

## Schritt für Schritt | AdGuard Home Raspberry Pi Installation

### Schritt 1:

Zunächst müsst ihr die SD-Karte von eurem Raspberry Pi mit dem Raspberry OS bestücken. Hierzu könnt ihr euch auf raspberrypi.com das Tool [Raspberry Pi Imager](https://www.raspberrypi.com/software/) herunterladen. Mit diesem Tool könnt ihr ganz leicht das benötigte Raspberry Pi OS auf die SD-Karte zaubern.

### Schritt 2:

Wenn ihr den Raspberry Pi Imager heruntergeladen habt, dann könnt ihr diesen zunächst auf euren Rechner installieren. Nach erfolgreicher Installation und dem Starten des Programms, begrüßt euch wie auf dem Bild zu sehen, das Dashboard des Raspberry Pi OS Imager.

### Schritt 3:

Dann klickt ihr auf den Button 'Auswählen', hier auf 'Raspberry Pi OS (other)' und dann auf das Betriebssystem 'Raspberry Pi OS Lite (64 bit)'.
![Raspberry OS auswählen](/images/posts/adguard/rpi-imager_vHFGbf8SGe.png)

### Schritt 4:

Nach der Auswahl des Raspberry Pi OS Image müsst ihr auf den Button '**SD-Karte**' klicken und dann eure SD-Karte auswählen, die ihr in eurem SD-Card-Reader stecken habt und für den späteren Betrieb im Raspberry Pi vorgesehen habt.

### Schritt 5:

Zu guter Letzt muss noch auf das 'Zahnrad-Symbol (Einstellungen)' geklickt werden, um hier noch einige Einstellungen für das Schreiben des Images auf die SD-Karte vornehmen zu können. Die folgenden Einstellungen anpassen:  
- optional Hostnamen vergeben  
- SSH aktivieren und sicheres Passwort vergeben  
- Spracheinstellungen einstellen  
- Telemetry deaktivieren  
- Medien nach Beenden auswerfen  
Sind alle Einstellungen vorgenommen worden, dann auf 'Speichern' klicken.

![Raspberry OS konfigurieren](/images/posts/adguard/rpi-imager_0Hhavk9E8r.gif)

### Schritt 6:

Nach dem Abschließen der vorherigen Schritte, könnt ihr nun auf 'Schreiben' klicken und somit das Raspberry Pi OS Image auf die SD-Karte schreiben. Dieser Vorgang kann ein wenig dauern.

### Schritt 7:

Nach dem Schreiben des Images auf die SD-Karte könnt ihr die Karte in den ausgeschalteten Raspberry Pi einstecken, das Netzwerkkabel mit eurem Router oder Switch verbinden und dann den Raspberry Pi mit der Spannungsversorgung verbinden. Nach etwa 30 Sekunden sollte der Raspberry Pi gebootet sein.

### Schritt 8:

Im nächsten Schritt müssen wir herausfinden, welche IP-Adresse der Raspberry Pi per DHCP bezogen hat. Hier könnt ihr einfach bei eurem Router in den Netzwerkeinstellungen / DHCP-Leases nachsehen. Hier sollte dann das Gerät in der Auflistung angezeigt werden. Ihr solltet das Gerät in eurem DHCP-Server / Router eine statische IP-Adresse vergeben, damit bei der späteren Nutzung des DNS-Servers, keine Probleme bei der DNS-Auflösung im Netzwerk entstehen.

![IP-Adresse des Raspberry Pi herausfinden](/images/posts/adguard/Raspberry-Pi-IP-Adresse.png)

### Schritt 9:

Ist die IP-Adresse des Raspberry Pi bekannt, so kann nun ein Terminal-Fenster (in diesem Beispiel unter Windows 11) oder das Tool 'Putty' geöffnet werden. Hier gibt ihr die folgende Anweisung ein: `ssh pi@IP-Adresse Raspberry`  
Beim ersten Verbinden müsst ihr noch den Fingerprint für die SSH-Verbindung bestätigen. Die Frage danach (siehe Bild) beantwortet ihr mit 'yes'. Danach werdet ihr noch nach dem Passwort gefragt, welches ihr bei den Einstellungen im Raspberry Pi OS Imager vergeben habt.

![SSH-Verbindung zum Raspberry Pi herstellen](/images/posts/adguard/SSH-Anmeldung-Raspberry-Pi.png)

### Schritt 10:

Der nächste Schritt ist, das Raspberry Pi OS auf einen aktuellen Stand zu bringen. Dieses könnt ihr durch den folgenden Befehl erreichen.  
`sudo apt-get update && apt-get upgrade`  
Dieser Update-Vorgang kann schon ein wenig dauern. Sollte dieser Hinweis erscheinen, Repository 'http://deb.debian.org/debian bullseye InRelease' changed its 'Version' value from '11.3' to '11.4' dann könnt ihr mit dem folgenden Befehl ein Distributions-Upgrade durchführen:  
`sudo apt-get dist-upgrade`  
Wenn der Installationsvorgang abgeschlossen ist, wird das System durch die Eingabe von `sudo reboot` neugestartet.

![Raspberry Pi update durchführen](/images/posts/adguard/Update-Raspberry-Pi-OS.png)

### Schritt 11:

Nach dem Neustart des Raspberry Pi und nach dem Neuverbinden per SSH, können wir endlich AdGuard Home auf den Raspberry Pi installieren. Dafür brauchen wir zunächst das Installationspaket für den AdGuard Home. Dafür gibt ihr den folgenden Befehl in das Terminal-Fenster ein, um das erforderliche Installationspaket herunterzuladen. AdGuard-Installationspaket herunterladen:  
`wget https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.11/AdGuardHome_linux_armv7.tar.gz`  
Installationspaket entpacken:  
`sudo tar xvf AdGuardHome_linux_armv7.tar.gz`  
In das AdGuard-Verzeichnis wechseln: `cd AdGuardHome`  
Installation von AdGuard durchführen: `sudo ./AdGuardHome -s install`

![Installation AdGuardHome auf einen Raspberry Pi](/images/posts/adguard/Installation-AdGuard.png)


Nach erfolgreicher Installation könnt ihr die weitere Konfiguration per Webbrowser vornehmen. Hierzu einfach die IP-Adresse gefolgt von dem Port 3000 in die Adressezeile eures Browsers eingeben. `http://IP-Adresse:3000`  
Dann sollte euch das im Bild gezeigte Willkommens-Dashboard von AdGuard angezeigt werden.

### Schritt 12:

Die Admin-Weboberfläche sollte aus Sicherheitsgründen nur über das LAN / Management-Netzwerk aus erreichbar sein. Daher wählt ihr im ersten Pulldown-Menü die Schnittstelle mit der IP-Adresse eures Raspberry Pi aus. Habt ihr mehre Netzwerke, Gast-Netzwerke oder VLAN´s im Betrieb, dann könnt ihr unter dem Punkt 'DNS-Server' das Pulldown-Menü auf 'Alle Schnittstellen' belassen, andernfalls wählt ihr auch hier die Schnittstelle eures Raspberry Pi aus.

![Setup AdGuardHome](/images/posts/adguard/Installationssetup-AdGuard-Bild-2.png)

### Schritt 13:

Auf der nächsten Seite des Assistenten müsst ihr einen Benutzernamen sowie ein Passwort für den Zugang zum AdGuard vergeben. Bitte beachten, dass das gewählte Passwort auch ein wirklich sicheres Passwort ist, um so Missbrauch des DNS-Servers zu vermeiden!

![Benutzer und Passwort für AdGuardHome setzen](/images/posts/adguard/Installationssetup-AdGuard-Bild-3.png)

### Schritt 14:

Im nächsten Fenster seht ihr dann eine Konfigurationshilfe für verschiedene Geräte und eine Übersicht über die IP-Adressen auf der AdGuard-DNS-Server lauscht. Wenn ihr dann auf 'Weiter' klickt, gelangt ihr zum Anmeldefenster von AdGuard Home.

![Konfigurationshilfe AdGuardHome](/images/posts/adguard/Installationssetup-AdGuard-Bild-4.png)

### Schritt 15:

Nach der Eingabe eures Benutzernamens sowie eurem Passwort, wird euch das Dashboard von AdGuard Home angezeigt. Hier habt ihr dann die Möglichkeiten, die Anfragestatistiken des DNS-Servers auszuwerten und natürlich AdGuard weiter zu Konfigurieren.

![AdGuardHome Dashboard](assets/images/posts/adguard/Installationssetup-AdGuard-Bild-5.png)

## Zusammenfassung - AdGuard Raspberry Pi Installation

Wie ihr sehen konntet, ist die Installation von AdGuard Home auf einem Raspberry Pi eigentlich nicht schwer!

Natürlich müsst ihr AdGuard noch ein wenig Konfigurieren (DNS over https, Blacklists vergeben, etc.), damit dieser richtig in Aktion treten kann.

Wie ihr AdGuard konfigurieren könnt, dass zeige ich dann in einem separaten Beitrag oder Video auf meinem YouTube-Kanal.

Eine Übersicht über gute Blacklists für AdGuard oder pihole, sowie eine Übersicht über öffentliche DNS-Server, die Datenschutz und Sicherheit auf Ihre Fahnen geschrieben haben, findet ihr weiter unten in diesem Beitrag 'AdGuard Raspberry Pi Installation'.

**Sollte euch diese Schritt für Schritt-Anleitung weitergeholfen haben, so würde ich mich sehr darüber freuen, wenn ihr mich durch ein Abo auf meinen [YouTube-Kanal](https://www.youtube.com/channel/UCr-cuwB555JmAm4F412KZ2Q) unterstützen würdet.**

## Blacklist-Empfehlungen - AdGuard Raspberry Pi Installation

Mit den vorgestellten Blacklists habe ich bisher sehr gute Erfahrungen gemacht und möchte diese daher gerne weiterempfehlen.

### Blacklist SteveBlack

Diese Liste ist sehr umfassend und hat zurzeit circa 150000 Einträge enthalten.

Kategorien:

- Porn

- Adware

- Malware

- Fakenews

- Gambling (verdächtige Hosts)

- Social+

[https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts](https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts)

### Blacklist adaway.org

Werbeblocker

[https://adaway.org/hosts.txt](https://adaway.org/hosts.txt)

### Blacklist SmartTV-Tracking

Name ist Programm

[https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt](https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt)

### Blacklist EasyPrivacy

Tracking und Telemetrie

[https://v.firebog.net/hosts/Easyprivacy.txt](https://v.firebog.net/hosts/Easyprivacy.txt)

### Blacklist EasyList

Werbeblocker

[https://v.firebog.net/hosts/Easylist.txt](https://v.firebog.net/hosts/Easylist.txt)

### Blacklist Telemetrie Microsoft / Windows

Vermeidung Telemetrie Erfassung von Microsoft-Produkte

[https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt](https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt)

### Weiterführende Links zum Thema

**Raspberry Pi OS Imager**

[https://downloads.raspberrypi.org/imager/imager\_latest.exe](https://downloads.raspberrypi.org/imager/imager_latest.exe)

## Vertrauenswürdige DNS-Server - AdGuard Home Raspberry Pi Installation

Hier eine Auflistung von datenschutzkonformen DNS-Server-Provider, die kein Logging betreiben und zensurfrei sind.

> Danke an [privacy-handbuch.de](https://www.privacy-handbuch.de/) für die Auflistung der DNS-Server.

### Freifunk München (normales DNS, DNS-over-TLS und DNS-over-HTTPS)

```sh
IPv4: 5.1.66.255
IPv6: 2001:678:e68:f000::
Servername: dot.ffmuc.net
IPv4: 185.150.99.255
IPv6: 2001:678:ed0:f000::
Servername: dot.ffmuc.net
```

### Digitale Gesellschaft (CH) (DNS-over-TLS und DNS-over-HTTPS!)

```sh
IPv4: 185.95.218.42
IPv6: 2a05:fc84::42
Servername: dns.digitale-gesellschaft.ch
IPv4: 185.95.218.43
IPv6: 2a05:fc84::43
Servername: dns.digitale-gesellschaft.ch
```

### Censurfridns Denmark (aka. UncensoredDNS)

```sh
IPv4: 91.239.100.100
IPv6: 2001:67c:28a4::
IPv4: 89.233.43.71
IPv6: 2a01:3a0:53:53::
(mit DNS-over-TLS)
```


