---
title: AdGuard Home manuell aktualisieren
descripton: AdGuard Home manuell aktualisieren | In diesem Tutorial zeige ich euch, wie ihr AdGuard Home manuell aktualisieren könnt.
hero: /images/posts/adguard/Thumbnail-AdGuard-Home-Update.png
descripton: 
date: 2022-11-21
menu:
  sidebar:
    name: AdGuard Home manuell aktualisieren
    identifier: adguard-home-manuel-update
    parent: adguard
categories: 
  - Linux
  - Netzwerk
  - Security
  - Tutorials
  - Video
tags: 
  - adguard
  - linux
  - netzwerk
  - security
  - video
---

## Wenn das automatisches AdGuard Home Update fehlschlägt

In diesem Beitrag '**AdGuard Home manuell aktualisieren**' und dem dazugehörigen Video-Tutorial, zeige ich euch, wie es möglich ist, bei einer AdGuard Home-Instanz ein manuelles Update durchzuführen.

### Warum AdGuard Home manuell aktualisieren?

Bei manchen AdGuard Home Updates fällt die automatische Aktualisierung fehl, so zum Beispiel bei der Version "**AdGuard Home v0.107.17**". Daher ist es nötig, hier ein manuelles Update über die Kommandozeile durchzuführen.

## Video-Tutorial zu 'AdGuard Home manuell aktualisieren'

Auf meinen [**YouTube-Kanal**](https://www.youtube.com/@secure_bits) habe ich auch ein entsprechendes Video-Tutorial veröffentlicht.

In diesem Video zeige ich euch Step by Step wie ihr die manuelle Aktualisierung bei einer linuxbasierten AdGuard Home Installation durchführen könnt.

{{< youtube T4Dp8DDVjHM >}}

## Die benötigten Terminal-Befehle zu 'AdGuard Home manuell aktualisieren'

In diesem Beispiel zeige ich euch, wie ihr ein manuelles Update unter Debian / Raspberry OS durchführen könnt.

### Bitte beachten

Den Pfad zu dem Verzeichnis eurer AdGuard Home Installation bitte entsprechend euren Gegebenheiten anpassen! Ebenso die entsprechende AdGuardHome-Ausführungsdatei.

### Anmeldung via SSH-Verbindung zu unserer AdGuard Home Instanz

Per Terminal, Putty oder Windows Terminal (oder PowerShell) eine SSH-Verbindung zu euren AdGuard Home Host (Raspberry Pi, VM, etc) herstellen.

In diesem Beispiel nutze ich das Windows-Terminal unter Windows 11. Dieses erhaltet ihr zum Beispiel im [**Microsoft-App-Store**](https://www.microsoft.com/store/productId/9N0DX20HK701).

```sh
ssh benutzer@IP-Adresse-Host

# In meinem Fall 

ssh root@172.16.16.217
```

### Host-System aktualisieren

Bevor wir mit der Aktualisierung von AdGuard Home beginnen, aktualisieren wir zunächst erst das Host-System auf dem AdGuard Home installiert wurde.

```sh
# Aktualisierung des Host-Systems auf dem AdGuard Home betrieben wird

sudo apt update && apt upgrade -y

```

### Aktuelles Release von AdGuard Home herunterladen

Der weitere Schritt ist es, das aktuelle Release von AdGuard Home herunterzuladen. Hierzu müsst ihr den Downloadpfad auf dem Repository von AdGuard Home herausfinden.

Dazu besucht ihr die **[Projekt- / Downloadseite von AdGuard Home](https://github.com/AdguardTeam/AdGuardHome/wiki/Platforms)** und sucht entsprechend eurem Host-System / Hardware den entsprechenden Eintrag / Hyperlink in der Tabelle aus, macht dann auf dem entsprechenden Linkadresse einen Rechtsklick mit der Maus im sich öffnenden Kontextmenü, einen Klick auf 'Linkadresse kopieren' (siehe unteres Gif-Bild).

In meinem Fall ist das Host-System ein x86-Architektur und eine Linux-Distribution



{{< img src="/images/posts/adguard/firefox_fOZpTqWH3X-1.gif" >}}



Wenn ihr die Linkadresse kopiert habt, wechselt wieder in das Terminal-Fenster und gibt den Befehl 'wget+Leerzeichen' ein und fügt den Link mithilfe der Tasten-Kombination 'STRG+V' nach dem Befehl ein.

```sh
# In das Stammverzeichnis wechseln

cd

# Herunterladen aktuelles Release von AdGuard Home herunterladen

wget <Linkadresse aktuelles AdGuard Home Release einfügen>

# In diesem Beispiel diesen Link hier

wget https://static.adguard.com/adguardhome/release/AdGuardHome_linux_386.tar.gz

```

### AdGuard Home Release-Datei entpacken

```sh
# Entpacken heruntergeladenen Release-Datei 

sudo tar xvf AdGuardHome_linux_386.tar.gz

```

### Laufenden AdGuard Home Instanz stoppen

```sh
# Zum Verzeichnis von AdGuard wechseln. In meinem Fall in das Folgende

cd /opt/AdGuardHome/

# AdGuard Home Instanz stoppen

sudo ./AdGuardHome -s stop

# Ausgabe

AdGuard Home, version v0.107.18
service: control action: stop
service: action stop has been done successfully on linux-systemd

```

### Backup der AdGuard Home-Daten

Bevor wir das manuelle AdGuard Home Update durchführen, werden wir zunächst die Daten sowie den Konfigurations-File 'AdGuardHome.yaml' sichern. Diese können dann nach dem Update der AdGuardHome-Instanz wieder genutzt werden.

```sh
# Anlegen des Speicherorts für das Backup. Zum Beispiel:

mkdir -p ~/AdGuardBackup/

# Sicherung der Daten und der Konfigurations-Datei von AdGuard Home

cp -r ./AdGuardHome.yaml ./data ~/AdGuardBackup/

# Überprüfen ob die Dateien gesichert wurden

cd
cd AdGuardBackup
ls

Ausgabe ls:

AdGuardHome.yaml data

```

### AdGuard Home manuell aktualisieren

```sh
# Wechseln in das Stammverzeichnis

cd 

#Alte gegen neue AdGuard Home Ausführungsdatei austauschen

cp AdGuardHome/AdGuardHome /opt/AdGuardHome/AdGuardHome

# ADGuardHome Instanz wieder starten

cd /opt/AdGuardHome/

./AdGuardHome -s start
```

### Entfernen des AdGuard Home Release-Archiv

Zum Schluss müssen wir noch das Release-Archive von AdGuardHome sowie das Verzeichnis im Wurzelverzeichnis entfernen.

```sh
# Archiv entfernen

cd

rm AdGuardHome_linux_386.tar.gz

# Verzeichnis entfernen

rm -r AdGuardHome
```

## Zusammenfassung - AdGuard Home manuell aktualisieren

Wir haben in diesem Tutorial '**AdGuard Home manuell aktualisieren**' nun AdGuard Home manuell aktualisiert, sowie ein Backup der Konfigurations-Datei 'AdGuardHome.yaml' und der Daten angelegt.

Wer wissen möchte, wie ihr AdGuardHome auf einen Raspberry Pi installiert und den Raspberry Pi per UFW-Firewall absichert der kann sich diese beiden Tutorials mit entsprechendem Video ansehen.

- **[AdGuardHome auf einen Raspberry Pi installieren](https://secure-bits.org/adguard-raspberry-pi-installation-2022/)**
    

- **[Raspberry Pi per UFW-Firewall absichern](https://secure-bits.org/ufw-firewall-raspberry-pi/)**
    

Ich hoffe es hat euch dieses Tutorial ein wenig weitergeholfen. Gerne könnt ihr auch meinen YouTube-Kanal abonnieren und keine weiteren hoffentlich interessante Tutorials mehr verpassen.


- **[YouTube-Kanal von SecureBits abonnieren besuchen](https://www.youtube.com/@secure_bits)**
