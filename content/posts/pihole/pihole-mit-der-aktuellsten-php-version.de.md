---
title: "Pihole PHP 8.3 | Pihole immer mit der aktuellsten PHP-Version"
descripton: "Pihole PHP 8.3 | Pihole immer mit der aktuellsten PHP-Version | In diesem Tutorial zeige ich, wie ihr, Pihole mit einer aktuellen PHP - Version installiert"
hero: /images/posts/pihole/pihole-raspberry-php.png
date: 2024-03-06
menu:
  sidebar:
    name: Pi-hole mit der aktuellsten PHP-Version installieren
    identifier: pihole-php
    parent: pihole
categories:   
    - "Hardware"
    - "Linux"
    - "Netzwerk"
    - "Tutorials"
    - "Video"
tags:   
  - "it-security"
  - "netzwerk"
  - "pi-hole"
  - "tutorials"
  - "video"

---

## Pihole mit PHP 8.3 auf dem Raspberry Pi OS installieren

In diesem Tutorial '**Pihole mit PHP 8.3 installieren**' möchte ich euch gerne zeigen, wie ihr im Jahr 2024, einen Pihole-DNS-Server sicher mit einer aktuellen PHP-Version auf eurem Raspberry Pi installieren könE-Hat für Raspberry Pi 5nt.

### Hintergrund von diesem Tutorial

Bei einer Testinstallation von **Pihole mit Debian 11** auf meinem Raspberry Pi, ist mir beim Installationsprozess aufgefallen, dass die Installationsroutine auf dem **Raspberry Pi OS lite, ein PHP-7.4 installiert**, welches schon seit **Mitte 2023 nicht mehr mit Sicherheitsupdates** versorgt wird und somit **EOL (End of life)** ist.

Weitere Informationen zum Support der einzelenen PHP-Versionen findet ihr hier:

[https://www.php.net/supported-versions.php](https://www.php.net/supported-versions.php)

Daher habe ich mir gedacht, dass ich euch ein neues und aktuelles Tutorial erstelle ([mein letztes war aus dem Jahr 2022](https://secure-bits.org/pi-hole-auf-einen-raspberry-pi-installieren/)), damit die genutzte PHP-Installation, immer mit den neusten Sicherheitsupdates versorgt wird.

Weiterhin werde ich euch auch zeigen, wie ihr eine Firewall für den Raspberry Pi installieren und einrichten könnt. Und auch das System automatisch mit neuen Updates versorgt.

## Video zum Thema 'Pihole installieren in 2024'

Wie gewohnt, habe ich auch ein Video-Tutorial zu diesem Thema auf meinem YouTube-Kanal veröffentlicht. Also gerne mal vorbeischauen und ein Abo dalassen.

{{< youtube OwFPGSXQMj0 >}}

## Installation von Pihole auf einem Raspberry Pi

Vorab erstmal eine Aufstellung der Voraussetzungen die wir für die Installation brauchen:

- **Raspberry Pi mit Netzteil, SD-Karte und Gehäuse**

- **SD-Karten-Lesegerät**

- **SD-Karte mit Adapter | Meine Empfehlung**

- **Raspberry Pi PoE+ HAT für Rapberry Pi 4**

### Raspberry Pi Imager installierenClick here for the tutorial ‘

**Die Software 'Raspberry Pi Imager'**

Zunächst müssen wir erstmal unseren Raspberry Pi mit einem aktuellen Raspberry Pi OS versorgen und daher werden wir als ersten Schritt, dass Raspberry Pi OS-Image, mithilfe vom Raspberry Pi Imager, auf eine SD-Karte schreiben.

**[Download Raspberry Pi OS Imager](https://www.raspberrypi.com/software/)**

Nachdem Download vom aktuellen Raspberry Pi Imager könnt ihr die Anwendung einfach auf euer entsprechendes System installieren.

Den Imager gibt es für die Betriebssysteme Windows, macOS, Ubuntu oder auch auf ein vorhandenes RaspberryPi OS mit dem folgenden Befehl installieren.

```bash
# Raspberry Pi Imager unter Raspberry Pi OS installieren (habe ich noch nicht getestet)

sudo apt install rpi-imager
```

### Raspberry Pi OS auf die SD-Karte schreiben

In dem unteren Gif seht ihr die Konfiguration des Raspberry Pi Imager für ein Raspberry Pi OS auf einem Raspberry Pi 3. Bitte immer die Raspberry Pi OS 32bit lite Version für das Schreiben auf die SD-Karte auswählen! So wird das OS in einer Minimalversion installiert, da das für den Betrieb von Pihole vollkommen ausreicht.

> ### Kleiner Tipp bei Raspberry Pi 3B-Modellen
>
> **Möchtet ihr Debian 12 "bookworm" mit inkludierten PHP 8.2 auf euren Raspberry Pi 3B installieren, dann bitte unter 'Raspberry Pi Modell' den Raspberry Pi 4 auswählen. Hier könnt ihr dann Raspberry OS basierend auf Debian 12 auswählen. Debian 12 ist laut Raspberry Pi mit dem Modell 3B kompatibel und ich kann das auch bestätigen.**
>
> **Bei der Modell-Auswahl wird unter dem Modell Raspberry Pi 3B nur die Debian-Version 11 "bullseye" aufgeführt.**

> ### Bitte beachten!
>
> Ihr solltet anstatt SSH-Authentifizierung via Passwort, lieber die Anmeldung via Schlüsselpaar vorziehen. Die Einrichtung könnte ihr auch noch nach der Installation vornehmen. **Weitere Informationen findet ihr in dem Artikel Raspberry Pi absichern von A bis Z**.
>
> [**Zum Tutorial Raspberry Pi absichern**](https://secure-bits.org/raspberry-pi-absichern-von-a-z-2023/)

#### Nach Fertigstellung des Image-Schreibens von Raspberry Pi OS

Wenn das Beschreiben der SD-Karte abgeschlossen wurde, dann bitte die Karte entnehmen und in euren Raspberry Pi stecken.

Nachdem Einstecken das Netzwerkkabel mit dem Raspberry Pi, sowie in diesem Beispiel mit der Fritzbox verbinden und danach den Raspberry Pi mit Spannung versorgen.

Nun bootet der Raspberry Pi und ihr könnt nach einer gewissen Zeit, das Gerät in der Fritzbox unter Netzwerkverbindungen sehen

### Verbinden mit dem Raspberry Pi via SSH

Um eine Verbindung mit dem Raspberry Pi herzustellen, nutze ich in diesem Beispiel für die SSH-Verbindung, das Microsoft Terminal. Natürlich könnt ihr auch Putty oder unter macOS sowie Linux, dass gewohnte Terminal nutzen.

Um eine SSH-Verbindung zu etablieren, melden wir uns mit dem folgenden Befehlen beim Raspberry Pi via SSH an.

```bash
# Befehl, um die SSH-Verbindung herzustellen

sudo ssh benutzernamen@IP-Adresse(vom Pi)

# Bei der ersten Verbindung müsst ihr den Fingerprint akzeptieren. 
# Diesen bestätigt ihr mit 'yes'
```

### Raspberry Pi OS aktualisieren

Bevor mit der Installation von PHP 8.3 beginnen können, müssen wir erstmal das Raspberry OS auf den neusten Stand bringen. Dieses machen wir durch den folgenden Befehl.

```bash
# Raspberry OS nach neuen Paketen überprüfen

sudo apt update

# Verfügbare Pakete und die dependency changes aktualisieren

sudo apt full-upgrade -y

# Die Installation kann schon eine gewisse Zeit in Anspruch nehmen!

# Nach der Fertigstellung der Aktualisierung, muss das System neu gestartet werden

sudo reboot
```

> ### Wichtig zu PHP-Installation
>
> Es ist wichtig, dass die Installation von PHP 8.3 (gerade unter Debian 11) vor der Installation von Pihole erfolgt, da ansonsten mit der Pihole-Installation, PHP 7.4 installiert wird und das möchten wir ja vermeiden.

### Pihole PHP | Installation von PHP 8.3 auf das Raspberry OS

Jetzt können wir damit beginnen, die Installation von PHP 8.3 auf dem Raspberry Pi zu starten.

Hierzu müssen wir zunächst ein Packages installieren und ein Repository in die sources.list hinzufügen.
assets/images/posts/pihole/raspberry-pi-os-imager.gif
```bash
# Erforderliches Package installieren

sudo apt -y install lsb-release apt-transport-https ca-certificates 

# Sicherheitsschlüssel für das "Sury-Repositorie" installieren

sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
```

```bash
# Installieren des Packages für PHP 8.3

sudo echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

# Verfügbare Packete aktualisieren

sudo apt update

# Installation von PHP 8.3

sudo apt install php8.3 -y
```

#### Installation von sqlite3 für PHP 8.3

Nach der Installation von PHP 8.3 müssen wir noch das zusätzliche Modul sqlite3 nachinstallieren, damit im späteren Verlauf, auch der Betrieb von Pihole unter PHP 8.3 ordnungsgemäß funktionieren wird.

Um nun das PHP-Modul 'sqlite3' auf unseren Raspberry Pi OS zu installieren, geben wir den folgenden Befehl in die Bash ein:

```bash
# Installation von dem PHP-Modul sqlite3 für den Betrieb von Pihole

sudo apt install php8.3-sqlite3
```

#### Nacharbeiten nach der Installation von PHP 8.3 für Pihole

Bevor wir die Installation mit Pihole fortsetzen können, müssen wir zunächst den mitinstallierten Webserver 'apache2' wieder loswerden. Grund ist hierfür, das Pihole den schlanken Webserver 'lightptd' für das Admin-Webinterface nutzt, wir daher den Apache-Webserver nicht benötigen und dieser auch zu Fehlern führen würde, da dieser den Port 80 schon belegen würde.

```bash
# Den Apache2-Dienst beenden

sudo systemctl stop apache2

# Apache2 deinstallieren

sudo apt purge apache2

# Nach dem Deinstallieren, muss das Betriebssystem neu gestartet werden

sudo reboot
```

## Pihole PHP | Installation von Pihole mit PHP 8.3

> ### Hinweis
>
> Die **Installation von Pihole auf einem Raspberry Pi** **habe ich in meinem anderen Tutorial sehr ausführlich und detailliert beschrieben**. Daher spare ich mir hier die einzelnen Schritte und **verweise hier auf mein vorheriges Tutorial oder auf mein Video zu diesem Beitrag** hier:
>
> [Hier geht es zum Tutorial 'Installation Pihole auf Raspberry Pi](https://secure-bits.org/pi-hole-auf-einen-raspberry-pi-installieren/#pihole-installieren "Zum Tutorial Pihole installieren")

### Weitere Videos und Tutorials zum Thema Pihole

Ich habe hier und auf YouTube noch viele andere Beiträge und Videos zum Thema 'Pihole' veröffentlicht.

Vielleicht hilft euch das Eine oder Andere bei eurem Vorhaben mit dem Pihole weiter?! Einfach auf die Links klicken!

**[Pihole einrichten](https://secure-bits.org/pi-hole-einrichten-konfigurieren/)**

**[Pihole und Unbound](https://secure-bits.org/pi-hole-unbound-jetzt-richtig-installieren-in-2023/)**

[**Pihole Backup erstellen**]()

[**Pihole unterwegs auf dem Smartphone nutzen**](https://secure-bits.org/pihole-vpn-mit-pivpn-und-wireguard/)