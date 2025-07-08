---
title: "Proxmox VE mit fail2ban absichern"
date: 2025-02-18
hero: /images/posts/proxmox-fail2ban/proxmox_und_fail2ban.png
menu:
  sidebar:
    name: Proxmox und fail2ban
    identifier: proxmox-fail2ban
    parent: linux
    weight: 10
tags: ["Linux", "Security", "Proxmox"]
categories: ["Tutorials"]
---
## Proxmox VE basierend auf Debian 12 mit fail2ban absichern

Eine Möglichkeit einen öffentlichen Proxmox Server gegen Brute Force-Angriffe abzusichern, ist der Einsatz von dem Tool ‚fail2ban‘.

In diesem kurzen Tutorial zeige ich, wie mit Hilfe von fail2ban, der Zugriff des Service ‚SSH‘ und der Zugriff auf den Port ‚8006‘ des Dashboards, abgesichert wird.
Ausgangslage

In diesem Szenario handelt es sich um einen Proxmox-Server der als Dedicated-Server bei Hetzner gehostet wird, und über eine IPv4- sowie IPv6-Adresse über das öffentliche Internet erreichbar ist.

Generell ist der Einsatz von fail2ban nur als ein Teil von Sicherheitsmaßnahmen zur Serverabsicherung anzusehen. Gerne könnt ihr auch weitere Sicherungsmaßnahmen hier auf meinem Blog zur Rate ziehen.

---
> **Gutschein**
>
> Wer auch einen VPS- / Root- / Dedicated-Server betrieben möchte, dem kann ich ein 20 Euro Gutschein anbieten. Um diesen Gutschein zu nutzen, auf den untenstehenden Link klicken.
> Der Gutschein in Höhe von 20 Euro, ist nur bei einer Neuregistrierung auf der Hetzner-Webseite nutzbar!
>
> Link zum Gutschein: <https://hetzner.cloud/?ref=OBFauh7A1Ru8>
---

## Installation von fail2ban unter Debian 12

> **WICHTIGER HINWEIS!**
>
> Bitte beachten, dass alle weiter ausgeführten Befehle mit erhöhten Privilegien ausgeführt werden!
>
> Diese Rechte erhaltet ihr wenn ihr einmalig für die bestehende SSH-Sitzung den folgenden Befehl ausführt:
>
> `sudo -s`

Da Proxmox VE ja auf der Distrubution Debian basiert, erfolgt die Installation von fail2ban genauso wie bei einem klassischen Debian-Installation.

Wir haben zwei Möglichkeiten, um die Einrichtung von fail2ban auf dem Proxmox-System vorzunehmen.

- **Einrichtung über das Dashboard von Proxmox.**
  
    Für die Einrichtung über dem Dashboard von Proxmox, klickt ihr auf den Proxmox-Node und wählt hier den Punkt ‚Shell‘ aus und gibt hier dann die entsprechenden Eingaben für die Konfiguration ein.

- **Einrichtung via Terminal über eine SSH-Verbindung zum Proxmox-Server.**
  
    In meinem Beispiel werden wir uns über ein Terminal via SSH mit dem Proxmox-Server verbinden. Vorteil ist hierbei der besserer Komfort, wie z.B. bei der Nutzung von Copy & Paste.

Für die Einrichtung über dem Dashboard von Proxmox, klickt ihr auf den Proxmox-Node und wählt hier den Punkt ‚Shell‘ aus und gibt hier dann die entsprechenden Eingaben für die Konfiguration ein.

{{< figure
  src="/images/posts/proxmox-fail2ban/dashboard-proxmox.png"
  alt="Proxmox fail2ban Dashboard"
  caption="Proxmox Dashboard"
>}}

### SSH-Verbindung via Terminal mit dem Proxmox-Server

Zunächst stellen wir eine Verbindung via SSH mit dem Proxmox-Server her. Hierfür könnt ihr je nach Betriebssystem ein Terminal-Fenster, Putty oder ähnliches nutzen.

```bash
# SSH-Verbindung aufbauen
ssh root@<IP-Adresse-Proxmox-Server>
```

### Aktualisieren des Betriebssystems sowie Installation von fail2ban

```bash
# System aktualisieren
sudo apt update && apt upgrade -y
# Installation von fail2ban
sudo apt install fail2ban
```

### Anpassung der fail2ban-Konfiguration für Proxmox VE

Wie in der Einführung von diesem Tutorial beschreiben, wollen wir den Standard-SSH-Port (22) sowie den Port 8006 für das Dashboard-Interface von Proxmox VE vor Brute Force-Attacken schützen.

Zunächst legen wir uns dafür eine lokale Jail-Config-Datei im fail2ban-Verzeichnis an, in der wir dann die Anpassung für unser Vorhaben hinterlegen.

```bash
# Zunächst werden wir uns 
# Aufrufen des Verzeichnis von fail2ban, in der sich die künftige sowie weitere Konfigurations-Dateien befinden
cd /etc/fail2ban
# Anlegen der Config-Datei für fail2ban
nano jail.conf
```

Im nächsten Schritt fügen wir die Konfiguration für die Absicherung des SSH-Verbindung sowie die Absicherung für den **Port 8006** ein.

```bash
# Konfiguration für fail2ban - Absicherung SSH (Standard-Port 22) und Dashboard-Zugriff Proxmox (Port 8006)
# Default-Einstellungen für fail2ban
[DEFAULT]
allowipv6 = auto
bantime = 3600
backend = systemd
ignoreip = 127.0.0.1/8
# Config für SSH
[sshd]
mode = aggressive
port = ssh
logpath = %(sshd_log)s
banaction = nftables-multiport
banaction_allports = nftables-allports
backend = systemd
enabled = true
maxretry = 2
findtime = 3600
bantime = 3h
# Config für Proxmox
[proxmox]
enabled = true
port = https,http,8006
filter = proxmox
backend = systemd
maxretry = 3
findtime = 3600
bantime = 3h
```

Nun die Config-Datei ‚**jail-local**‘ mit **STRG + O** speichern und mit **STRG + X** den Nano-Editor schließen

> **Ignore IP**
>
> Unter ‚**ignoreip**‚ habt ihr die Möglichkeit, IP-Adressen, Subnets als Ausnahmen hinzuzufügen, um so zum Beispiel zu verhindern, dass ihr euch selbst aussperrt.

## Proxmox-Filter für fail2ban anlegen

Eine Filter-Config für SSH ist standardmäßig in fail2ban enthalten. Die Filter-Config für Proxmox müssen wir zunächst erst erstellen.

Dazu wechseln wir in das Verzeichnis ‚**/etc/fail2ban/filter.d**‘ und legen hier mit ’nano proxmox.conf‘ die Filter-Config für Proxmox an.

```bash
# Filter-Config proxmox
[Definition]
failregex = pvedaemon\[.*authentication failure; rhost=<HOST> user=.* msg=.*
ignoreregex =
journalmatch = _SYSTEMD_UNIT=pvedaemon.service
```

Auch diese Datei mit STRG + O speichern und mit STRG + X den Editor verlassen.

### fail2ban-Dienst starten und prüfen

Da wir die erforderlichen Config-Dateien nun angelegt haben, können wir nun dazu übergehen und fail2ban auf dem System starten.

```bash
# fail2ban Autostart aktivieren, Dienst starten
systemctl enable fail2ban
systemctl start fail2ban
# fail2ban Status überprüfen
systemctl status fail2ban
```

Ausgabe sollte dann in etwas so aussehen:

{{< figure
  src="/images/posts/proxmox-fail2ban/fail2ban-service-status.png"
  alt="fail2ban status systemctl"
  caption="fail2ban status systemctl"
>}}

### Ein paar ergänzende Befehle für fail2ban

Alternative zu fail2ban

Eine Alternative zu fail2ban wird mit der Application ‚crowdsec‘ angeboten. Crowdsec funktioniert im Prinzip gleich wie fail2ban, wird aber durch zentral geführte dynamische Listen ergänzt. Nachteil ist aber hierbei, dass eine öffentliche Verbindung zu diesem Dienst etabliert wird.
Weitere Informationen zu ‚crowdsec‘ findet hier:

<https://www.crowdsec.net/>

Ich hoffe, dieses Tutorial bringt für manche unter euch einen Mehrwert und hilft bei der Absicherung eurer Proxmox-Server-Instanz!

Gerne könnt ihr mir auch im Forum oder hier in den Kommentaren ein Feedback hinterlassen.
Weitere Information zu fail2ban

<https://wiki.ubuntuusers.de/fail2ban/>

<https://de.wikipedia.org/wiki/Fail2ban>

Hier noch eine paar Befehle, mit der ihr die Möglichkeit habt, fail2ban zu ’steuern‘.

### Anzeigen der gebannten IP-Adressen

```bash
# Gebannte IP-Adressen für SSH
fail2ban-client status sshd
# Gebannte IP-Adressen für Proxmox
fail2ban-client status proxmox
```

Hier eine Beispiel-Ausgabe über die gebannte IP-Adressen, die versucht haben, sich via SSH anzumelden.

{{< figure
  src="/images/posts/proxmox-fail2ban/fail2ban-status-sshd.png"
  alt="fail2ban-client status sshd"
  caption="fail2ban-client status sshd">}}

### Gebannte IP-Adresse aus der jail-list entfernen

```bash
# IP-Adresse von der der Liste der gebannten IP-Adressen entfernen
# Für SSH
fail2ban-client set sshd unbanip <IP-Adresse>
# Für Proxmox
fail2ban-client set proxmox unbanip <IP-Adresse>
```

## Fazit – Proxmox VE mit fail2ban absichern

Wie in diesem Tutorial gesehen, ist die Absicherung vor Brute-Force-Angriffe für einen Proxmox-Server eigentlich ziemlich trival und im Betrieb, dadurch eine sehr gute Absicherung.

Weiterhin ist fail2ban auch für andere betriebenen Dienste wie zum Beispiel nginx, apache2, eigene Bitwarden-Instanz, etc. zur Absicherung genutzt werden oder aber, man erstellt selbst eine filter-Config wie in diesem Tutorial für Proxmox geschehen.

> **Meine persönliche Meinung zu fail2ban**
>
>Für mich persönlich ist der Einsatz von fail2ban zur Absicherung einer Server-Instanz, ein ganz klares „Muss“ und ergänzt mit dem Einsatz das Sicherheits-Schichten-Prinzip für einen sicheren Betrieb von öffentlichen Diensten.

### Alternative zu fail2ban

Eine Alternative zu fail2ban wird mit der Application ‚crowdsec‘ angeboten. Crowdsec funktioniert im Prinzip gleich wie fail2ban, wird aber durch zentral geführte dynamische Listen ergänzt. Nachteil ist aber hierbei, dass eine öffentliche Verbindung zu diesem Dienst etabliert wird.
Weitere Informationen zu ‚crowdsec‘ findet hier:

<https://www.crowdsec.net/>

Ich hoffe, dieses Tutorial bringt für manche unter euch einen Mehrwert und hilft bei der Absicherung eurer Proxmox-Server-Instanz!

Gerne könnt ihr mir auch im Forum oder hier in den Kommentaren ein Feedback hinterlassen.

### Weitere Information zu fail2ban

<https://wiki.ubuntuusers.de/fail2ban/>

<https://de.wikipedia.org/wiki/Fail2ban>
