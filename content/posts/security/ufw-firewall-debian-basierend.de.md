---
title: UFW-Firewall Raspberry Pi Installation
descripton: UFW-Firewall Raspberry Pi | In diesem Tutorial zeige ich euch, wie ihr euren Raspberry Pi mit der UFW-Firewall absichern könnt.
hero: /images/posts/it-security/Thumbnail-1.png
menu:
  sidebar:
    name: UFW Firewall konfigurieren am Beispiel eines Raspberry Pi
    identifier: ufw-firewall-raspberry
    parent: security
date: 2022-09-20
categories: 
  - "Linux"
  - "Netzwerk"
  - "Security"
  - "Tutorials"
  - "Video"
  - "Hardware"
tags: 
  - "raspberry pi"
  - "firewall"
  - "linux"
  - "security"
  - "tutorials"
  - "video"
---

## UFW-Firewall (Uncomplicated Firewall) installieren auf einen Raspberry Pi

In diesem Beitrag '**UFW-Firewall Raspberry Pi Installation**' möchte ich euch gerne zeigen, wie ihr diese Firewall beziehungsweise Befehlszeilenschnittstelle für **iptables** auf einen Raspberry Pi oder jeder anderen Linux-basierenden Distribution installieren und einrichten könnt. Soll heißen, dass die hier aufgeführten Befehle nicht alleine auf den **Raspberry Pi** beschränkt sind, sondern auch auf allen anderen Linux-basierten Distros angewendet werden können.

Passend zum Tutorial '[AdGuard auf dem Raspberry Pi installieren](https://secure-bits.org/adguard-raspberry-pi-installation-2022/)'. bietet sich natürlich an, dass wir die [UFW-Firewall](https://wiki.ubuntuusers.de/ufw/) auch auf den Raspberry Pi mit **AdGuard Home** drauf, installieren. So schützen wir diesen AdGuard DNS-Server vor unberechtigten Zugriffen aus dem Netzwerk.

### UFW-Firewall-Regeln für AdGuard auf dem Raspberry Pi

Das von mir vorgeschlagene Regelwerk für die UFW-Firewall findet ihr weiter unten in diesem Beitrag. Vorab solltet ihr aber unbedingt erst den ganzen Beitrag durchlesen, damit ihr euch nicht vom Raspberry Pi aussperrt.

[Zum AdGuard Regelwerk](#adguard)


### Was ist eine UFW-Firewall?

Die UFW-Firewall ist eigentlich keine Firewall, sonder bietet eine Schnittstelle um die regelbasierte Firewall 'iptables' leichter per Terminal zu Konfigurieren. Die Firewall ‚iptables‘ ist ein Bestandteil jeder Linux-basierten Distribution.    
Mit der UFW-Firewall ist es möglich, durch einfache Befehle, Regeln in ‚iptables‘ anzulegen, ändern oder zu löschen.

### Gibt es eine grafische Benutzeroberfläche für die UFW-Firewall?

Es gibt auch eine grafische Benutzeroberfläche (GUI) für die UFW-Firewall. Diese grafische Benutzeroberfläche heißt 'gufw' und ist auf Ubuntu-Systemen vorinstalliert.  
Angeboten wird diese Erweiterung für die folgenden Distributionen:  
- Ubuntu  
- Debian  
- Linux Mint  
- openSuse  
- archlinux  
- salix

### Hinweis zu den aufgeführten Befehlen | UFW-Firewall Raspberry Pi

Alle hier aufgeführten Befehle / Kommandos funktionieren nicht nur auf einen Raspberry Pi, sondern auch auf jeder anderen Linux-basierten Distibution wie zum Beispiel Ubuntu, Debian, archLinux und viele andere Systeme.

### Grundlegende Behandlungsanweisung einer Firewall-Regel

Bei der UFW-Firewall sowie den mir bekannten anderen Firewalls auch, gibt es drei Methoden, die die Verarbeitung von Daten-Pakete im Netzwerkverkehr regelt. Diese Methoden zu verstehen, ist die absolute Grundlage für eine sichere Konfiguration einer Firewall.

#### Methode 'allow oder pass'

Mit der Methode '**allow** oder **pass**' werden Daten-Pakete bei Netzwerkanfragen erlaubt. Diese Methode ist zumeist der Standard bei angelegten Regeln für ausgehenden Netzwerkverkehr.

Eingehender Netzwerkverkehr wird **nur explizit** per 'allow oder pass' freigegeben.

#### Methode 'reject'

Die Methode '**reject**' wiederrum, ermöglicht es, Daten-Pakete im Netzwerkverkehr zu verwerfen und gibt den Sender der Netzwerkanfrage direkt darüber auch eine sofortige Rückmeldung.

Weil die Rückmeldung über die abgelehnte Anfrage an den Sender oft auch für Denial of Service-Angriffe missbraucht werden, ist diese Methode der Behandlung von Anfragen bei einer Firewall eher nicht von Vorteil und wird daher für diesen Zweck nicht genutzt.

Verwendung findet '**reject**' zum Beispiel bei der Kommunikation zwischen Netzwerkkomponenten um eine gegebenenfalls hohe Netzwerklast im Netzwerk zu vermeiden.

#### Methode 'deny oder drop'

Anders wie bei der Methode '**reject**' wird bei der Methode '**deny** **oder drop**', die Netzwerkanfrage zwar auch gleich verworfen, aber der Absender erhält durch diese Methode keine direkte Rückmeldung und die Anfragen verlaufen sozusagen ins Leere.

Nachteil dieser Methode ist aber, dass dadurch eine höherere Netzwerklast im Netzwerk entstehen kann. **Trotzdem ist diese Methode der Behandlung von Anfragen auf einer Firewall ganz klar den Vorzug zu geben.**

## Installation UFW-Firewall Raspberry Pi

Um die Installation der UFW-Firewall beginnen zu können, müsst ihr euch zunächst per SSH-Verbindung im Terminal-Fenster mit dem Raspberry Pi verbinden.

```shell
# ssh-Verbindung mit dem Raspberry Pi erstellen

ssh Benutzername@IP-Adresse des Pi

# Als Beispiel: ssh pi@172.16.16.215

# Dann euer vergebenes Passwort eingeben.
```

Nach der erfolgreichen Anmeldung sollte der Inhalt des Terminal-Fenster wie auf dem folgenden Bild aussehen.

![Terminal SSH-Verbindung](/images/posts/it-security/Terminal-ssh-Verbindung.png)

### UFW Firewall Raspberry Pi installieren

Mit dem folgenden Befehl könnt ihr die UFW-Firewall auf den Raspberry Pi installieren:

```shell
# Installation ufw-Firewall
sudo apt install ufw
```

### UFW-Firewall-Dienst aktivieren

Nach der Installation muss der System-Dienst der Firewall gegebenenfalls noch gestartet werden.

```shell
# System-Dienst der UFW-Firewall starten

sudo systemctl enable ufw --now
```

### Status der Firewall überprüfen - UFW-Firewall Raspberry Pi

Um den Status der Firewall zu überprüfen, gibt ihr den folgenden Befehl ein:

```shell
# Status der Firewall abfragen
sudo ufw status

# Ausgabe:

Status: inactive
```

> ### Wichtig!
>
> **Bitte die UFW-Firewall erst am Ende dieses Tutorials aktivieren, ansonsten sperrt ihr auch aus dem Raspberry Pi aus!**

### Grundlegende eingehende Traffic-Verbots-Regel anlegen - UFW-Firewall Raspberry Pi

Zunächst werden wir den grundlegenden Netzwerkverkehr verbieten, damit nur explizite von uns erstellte Freigaben aktiv sind.

```shell
# Grundlegenden Netzwerkverkehr verbieten

sudo ufw default deny incoming
```

### Grundlegende ausgehende Regel anlegen - UFW-Firewall Raspberry Pi

```shell
# Grundlegenden ausgehenden Netzwerkverkehr erlauben

sudo ufw default allow outgoing

# Natürlich kann der grundlegende ausgehende Netzwerkverkehr auch verboten werden und dann einzelne Ports später freigegeben werden

sudo ufw default deny outgoing
```

### Regel für Zugriff per ssh anlegen - UFW-Firewall Raspberry Pi

Damit der Zugriff per ssh auf den Raspberry Pi nach der Aktivierung der UFW-Firewall weiterhin möglich ist, erstellen wir hierfür eine Regel.

```shell
# Regel für den ssh-Zugriff anlegen. Dies kann entweder über den 'Port 22' angegeben werden oder aber ihr welt den Service 'ssh' aus. Eine Liste der Services die die UFW-Firewall kennt, findet ihr unter /etc/services 

sudo ufw allow ssh

# Zugriff nur von eurem Netzwerk gestatten 

sudo ufw allow from IP-Adressbereich to any port 22

# So würde die Regel bei meinem Netzwerk aussehen

sudo ufw allow from 172.16.16.0/24 to any port 22
```

#### UFW-Firewall Anmeldeversuche für ssh limitieren

Um ein Limit für den ssh-Zugang zu definieren und so eine Brut Force-Attacke vorzubeugen (klappt auch bei anderen Ports und Services), kann man eine Regel erstellen, die ein Limit an Anmeldeversuche setzt.

Bei diesem Limit werden die Anmeldeversuche auf 6 Anmeldungen in 30 Sekunden begrenzt.

Diese Regel könnt ihr wie folgt anlegen:

```shell
# Limit für Anmeldeversuche am ssh-Port setzen

sudo ufw limit ssh

oder 

sudo ufw limit 22/tcp
```

### Bekannte Services der UFW-Firewall

Der UFW-Firewall sind auch von Haus aus einige '**Services**' bekannt. Services sind zum Beispiel '**ssh**' für den **Port 22**.

Diese '**Services**' können bei dem Anlegen neuer Firewall-Regeln auch direkt angesprochen werden.

Im unteren Bild seht ihr die Datei in der die Services der UFW-Firewall aufgeführt werden.

Diese Datei könnt ihr durch den Befehl '**nano /etc/services**' anschauen.

![Auflistung der Services unter Debain](/images/posts/it-security/WindowsTerminal_ufw-firewall-services.png)


### Firewall-Regeln mittels Apps definieren - UFW-Firewall Raspberry Pi

Eine weitere Methode Definitionen für das Regelwerk der Firewall zu nutzen, ist es '**App**' als Definition für die Behandlung von Daten-Pakete zu nutzen.

'**Apps**' sind Applikationen die auf eurem System am Laufen sind und bringen und hinterlegen bei dessen Installation sogenannte '**Profile**', in diesen Profilen sind die verwendeten Ports der Applikation angegeben.

#### Liste der installierten App-Profile anzeigen lassen

```shell
# UFW-Firewall App-List anzeigen

sudo ufw app list

# Beispielausgabe siehe unteres Bild
```

![APP-Liste der UFW-Firewall](/images/posts/it-security/sudo-ufw-app-list.png)

#### App-Profil einer Applikation in der UFW-Firewall anzeigen

Wie schon im vorherigen Absatz erwähnt, sind einem App-Profil einer installierten Applikation, die genutzten Ports der Anwendung angegeben. Um dieses Profil anzeigen zu lassen gibt ihr den folgenden Befehl in euer Terminal-Fenster ein.

```shell
# App-Profil anzeigen

sudo ufw app info <Name der App>

# Beispiel

sudo ufw app info IMAPS

# Ausgabe: Siehe unteres Bild
```
![App-Profil mittels UFW-Firewall anzeigen](/images/posts/it-security/sudo-ufw-app-info.png)

#### Firewall-Regel mittels App-Profil definieren

Um jetzt eine Firewall-Regel mittels App-Profil zu erstellen, gibt ihr den folgenden Befehl ins Terminal ein.

```shell
# UFW-Firewall-Regel mittels App-Profil definieren

sudo ufw allow/deny APP-Profil

# Beispiel für IMAPS

sudo ufw allow IMAPS
```

### Eigene Firewall-Profile definieren - UFW-Firewall Raspberry Pi

Es gibt natürlich auch die Möglichkeit eigene APP-Profile anzulegen (so wie bei der OPNsense das 'Alias') und damit mehrere Ports einem eigenen Profil zuzuweisen. Damit braucht man dann weiteren Verlauf in der Regelerstellung der UFW-Firewall nur dieses Profil benennen.

Abgespeichert sind diese App-Profile unter folgendem Pfad:

**/etc/ufw/application.d/**

In diesem Beispiel nenne ich das selbsterstellte Profil 'eigenesprofile'.

#### UFW-Firewall-App-Profil anlegen

```shell
# In das Verzeichnis wechseln in dem die App-Profile gespeichert sind

cd /etc/ufw/application.d/

# Anzeigen der vorhandenen Profile (kann je nach installieren Apps anders bei euch ausschauen)

ls -l

# Ausgabe

pi@raspberrypi3:/etc/ufw/applications.d $ ls -l
total 44
-rw-r--r-- 1 root root 145 Jul  2 00:37 openssh-server
-rw-r--r-- 1 root root 349 Dec 14  2018 ufw-bittorent
-rw-r--r-- 1 root root 627 Mar 30  2018 ufw-chat
-rw-r--r-- 1 root root 513 Mar 30  2018 ufw-directoryserver
-rw-r--r-- 1 root root  89 Jan 14  2018 ufw-dnsserver
-rw-r--r-- 1 root root 358 Mar 30  2018 ufw-fileserver
-rw-r--r-- 1 root root 212 Jan 14  2018 ufw-loginserver
-rw-r--r-- 1 root root 524 Mar 30  2018 ufw-mailserver
-rw-r--r-- 1 root root 131 Jan 14  2018 ufw-printserver
-rw-r--r-- 1 root root 155 Jan 14  2018 ufw-proxyserver
-rw-r--r-- 1 root root 320 Jan 14  2018 ufw-webserver
pi@raspberrypi3:/etc/ufw/applications.d $

# Anlegen eines eigenen Profils

sudo nano eigenesprofile

# Im Nano-Editor-Fenster gibt ihr dann folgendes ein (angepasst an eurem Profil)

[eigenesprofil]
title=Ports fuer das eigene Profil
description=Ports und Portbereiche für das eigene App-Profil
ports=443,80,3689/tcp

# Abspeichern mit STRG+O und Enter, verlassen mit STRG+X

# Laden der neuen Regel

sudo ufw reload

# Aktivieren der angelegten Regel

sudo ufw allow eigenesprofil

# Überprüfen der Regeln der UFW-Firewall 

sudo ufw status verbose

# Ausgabe siehe unteres Bild

```

#### Überprüfung der UFW-Firewall-Regeln nach Anlegung des eigenen Profils

![Überprüfung der UFW-Firewall-Regeln nach Anlegung des eigenen Profils](/images/posts/it-security/Eigenes-App-Profil-ueberpruefen.png)

### Mehrere Ports als Regel definieren

Möchte man für gleichzeitig mehrere Ports nach Protokoll-Definition (UDP oder TCP) eine Firewall-Regel anlegen, gibt es dafür zwei Möglichkeiten.

Erste Möglichkeit ist es, zu regelnde Ports mit einem '**,**' aneinander zu reihen (zum Beispiel: 22,25,80,443).

Die zweite Möglichkeit ist es, Portbereiche mittels des Zeichens '**:**'anzugeben (zum Beispiel: 2000:3000).

Je nach einer der beiden Möglichkeiten, gibt ihr hierzu den jeweiligen Befehl ins Terminal ein:

```shell
# UFW-Firewall-Regel für mehrere Ports desselben Protokolls anlegen

sudo ufw allow 22,25,80,443/tcp

# Firewall-Regel mittels Portbereich anlegen

sudo ufw allow 2000:3000/tcp
```

### Regel-Kommentar hinzufügen - UFW-Firewall Raspberry Pi

Bei einem umfassenden Regelwerk der Firewall ist es gut, wenn den einzelnen Regeln ein Kommentar mit dessen Funktion hinterlegt wird. So behält man bei vielen Regeln oder Ports die nicht eindeutig zugeordnet werden können, den Überblick.

```shell
# Einer Regel einen Kommentar hinzufügen

sudo ufw allow ssh comment "Freigabe ssh-Verbindung"

```

### UFW-Firewall Aktivieren und Deaktivieren

Die Firewall könnt ihr durch die folgenden Befehle Aktivieren oder Deaktivieren.

```shell
# Aktivieren

sudo ufw enable

# Deaktivieren

sudo ufw disable
```

### Firewall Status anzeigen

Um den Status der UFW-Firewall anzeigen zu lassen, gibt es zwei Möglichkeiten.

```shell
# Möglichkeit 1, zeigt alle Regeln an:

sudo ufw status verbose

# Möglichkeit 2, zeigt Regeln mit Nummerierung an:

sudo ufw status numbered
```

### Regeln löschen - UFW-Firewall Raspberry Pi

Am einfachsten Regeln zu löschen ist es, wenn ihr wie folgt vorgeht.

```shell
# Die UFW-Firewall-Regeln nummeriert anzeigen lassen:

sudo ufw status numbered

# Beispielausgabe:

pi@raspberrypi3:~ $ sudo ufw status numbered
Status: active

     To                         Action      From
     -- ------ ----
[ 1] 22                         ALLOW IN    172.16.16.0/24
[ 2] 3000                       ALLOW IN    172.16.16.0/24
[ 3] 53/tcp                     ALLOW IN    Anywhere
[ 4] 53/udp                     ALLOW IN    Anywhere
[ 5] 853/tcp                    ALLOW IN    Anywhere
[ 6] 853/udp                    ALLOW IN    Anywhere
[ 7] 67/tcp                     ALLOW IN    Anywhere
[ 8] 67/udp                     ALLOW IN    Anywhere
[ 9] 68/tcp                     ALLOW IN    Anywhere
[10] 68/udp                     ALLOW IN    Anywhere
[11] 80/tcp                     ALLOW IN    Anywhere
[12] 443/tcp                    ALLOW IN    Anywhere

# UFW-Firewall-Regel löschen. Hier als Beispiel Regel 3:

sudo ufw delete 3
```

### UFW-Firewall Deinstallieren

Möchtet ihr aus hoffentlich guten Gründen ;) , Die Firewall Deinstallieren, dann nutzt hierzu den folgenden Befehl.

```shell
# UFW-Firewall Deinstallieren

sudo apt remove ufw --purge
```

### Regeländerungen der UFW-Firewall mitteilen

Wenn ihr Änderungen am Regelwerk der Firewall vorgenommen habt, muss dies der Firewall mitgeteilt werden.

```shell
# Firewall Regeländerungen bekannt geben

sudo ufw reload
```

## Video-Tutorial - AdGuard absichern mit UFW-Firewall auf Raspberry Pi

Demnächst wird auch ein passendes Video-Tutorial zum Thema 'AdGuard-Installation auf einen Raspberry Pi mittels UFW-Firewall absichern' auf meinem [YouTube-Kanal](https://www.youtube.com/channel/UCr-cuwB555JmAm4F412KZ2Q) erscheinen.

https://youtu.be/Dh3A1Idktmg

Also am besten meinen Kanal gleich [Abonnieren](https://www.youtube.com/channel/UCr-cuwB555JmAm4F412KZ2Q) um kein Video zu verpassen.

## Regeln für AdGuard | UFW-Firewall Raspberry Pi

Nachdem ihr jetzt hoffentlich einen guten Überblick über das UFW-Firewall-Regelwerk bekommen habt, ist nun die Zeit gekommen, dass wir die Regeln für unseren installierten AdGuard auf dem Raspberry Pi anlegen.

```shell
# Firewall Reset - So setzt ihr die UFW-Firewall auf die ursprüngliche Konfiguration nach der Installation zurück

sudo ufw reset

# Grundregeln der Firewall

# IPv6 deaktivieren - Hierzu müsst ihr in der Datei '/etc/default/ufw' den Eintrag 'IPv6=yes' auf 'no' umstellen

# Öffnen der Konfigurationsdatei mit dem Nano-Editor

sudo nano /etc/default/ufw

IPv6=no

# Datei speichern mit STRG+O und STRG+X den Nano-Editor verlassen

# UFW-Firewall-Dienst neustarten

sudo systemctl restart ufw

# Jeden eingehenden Traffic sperren

sudo ufw default deny incoming 

# Jeden ausgehenden Traffic erlauben

sudo ufw default allow outgoing 

# Der IP-Adressbereich muss natürlich mit eurem Bereich in der der Raspberry läuft, übereinstimmen | Freigabe SSH-Zugriff über den definierten IP-Adressbereich

sudo ufw allow from 172.16.16.0/24 to any port 22 

# Port für den Zugriff auf das Dashboard von AdGuard (Hier auch wieder den IP-Adressbereich anpassen)

sudo ufw allow from 172.16.16.0/24 to any port 3000

# Port für den DNS-Service

sudo ufw allow 53/tcp
sudo ufw allow 53/udp
sudo ufw allow 853/tcp
sudo ufw allow 853/udp

# Ports für DHCP-Service erlauben

sudo ufw allow 67/tcp
sudo ufw allow 67/udp
sudo ufw allow 68/tcp
sudo ufw allow 68/udp

# Ports für https und http 

sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Ports für DNS over Quic

sudo ufw allow 784/udp
sudo ufw allow 8853/udp

# Ports für DNSCrypt

sudo ufw allow 5443/udp
sudo ufw allow 5443/tcp

# Ports für NTP - Timeserver:

sudo ufw allow 37/udp
sudo ufw allow 37/tcp

# Firewall-Regeln neu laden

sudo ufw reload

# Firewall aktivieren:

sudo ufw enable

```

## Zusammenfassung - UFW-Firewall Raspberry Pi

In diesem Tutorial 'UFW Firewall Raspberry Pi' haben wir den Raspberry Pi per UFW-Firewall gegen unnötige Zugriffe abgesichert.

Das Tool UFW-Firewall macht es möglich, auf einfacher Art, die Konfiguration von iptables (Netfilter) durchzuführen und somit mehr Sicherheit auf einen Linux-System zu gewährleisten.

Wem von euch die Bedienung über das Terminal nicht so liegt, der kann mit der graphischen Benutzeroberfläche 'gufw' das Ganze auch per "Klicki-Bunti" durchführen, vorausgesetzt natürlich, es ist eine graphische Benutzeroberfläche auf dem System installiert.

Ich hoffe, der Beitrag hat euch gefallen und den Einen oder Anderen unter euch konnte dieser ein wenig weiterhelfen?!

Solltet ihr Fragen haben. dann hinterlasst mir bitte einen Kommentar oder schreibt mir eine E-Mail.
