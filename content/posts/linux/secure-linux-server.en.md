---
preview: ../../../assets/images/posts/linux/Linux-Server-absichern.png
hero: /images/posts/linux/Linux-Server-absichern.png
tags:
  - linux
  - security
  - video
  - tutorials
categories:
  - Linux
  - Security
  - Tutorials
  - Video
title: Linux Server absichern | Debian
description: In diesem Tutorial werden wir einen debian-basierenden Linux Server  richtig vor Angriffe absichern
date: 2025-08-05T05:22:20.785Z
menu:
  sidebar:
    name: Linux-Server unter Debain absichern von A - Z
    identifier: linux-absichern
    parent: linux
lastmode: 2025-08-05T05:23:27.216Z
keywords:
  - Linux server absichern
draft: true
---
> **Wer unter euch seinen Raspberry Pi absichern möchte, der findet hier die entsprechende Anleitung:**
>
> https://secure-bits.org/raspberry-pi-absichern-von-a-z-2023/

<!-- FM:Snippet:Start data:{"id":"Info","fields":[]} -->
{{< alert type="info" >}}
Hinweis
Da manche Konfigurationen sehr umfassend sind, habe ich manche Schritte in separate Beiträge ausgelagert. Diese Beiträge habe ich dann bei den entsprechenden Schritten verlinkt..
{{< /alert >}}
<!-- FM:Snippet:End -->

## Linux Server absichern und sicher betreiben

In diesem neuen Video auf meinem **[YouTube-Kanal](https://www.youtube.com/channel/UCr-cuwB555JmAm4F412KZ2Q)** zeige ich euch, wie ihr euren debian-basierenden Linux Server mithilfe verschiedener Anpassungen sicher betreiben könnt und so vor Angriffe schützen könnt.

Wie der Presse und etwaigen IT-Portalen immer wieder zu entnehmen, nehmen die Angriffe auf öffentliche Server immer mehr zu.

Oft werden Dienste im Internet sowie im Unternehmensumfeld auf Grundlage von Linux Betriebssysteme bereitgestellt. Daher möchte ich in diesem Tutorial auf das Absichern eines debianbasierten Linux-Server näher eingehen und euch zeigen, wie ihr eure Server entsprechend vor Angriffe schützen könnt.

<!-- FM:Snippet:Start data:{"id":"Warning","fields":[]} -->
{{< alert type="warning" >}}
**Wie immer gilt "Eine 100 %-Sicherheit gibt es nicht!**
{{< /alert >}}
<!-- FM:Snippet:End -->


## Video-Tutorial zum Thema Linux Server absichern


<!-- FM:Snippet:Start data:{"id":"Info","fields":[]} -->
{{< alert type="info" >}}

Da dieses Thema schon sehr umfassend ist, habe ich das Tutorial auf mehrere Videos aufgeteilt und als Playlist auf meinem YouTube-Kanal zur Verfügung gestellt.

Dieser Playlist werden nach und nach immer weitere Video-Tutorials zum Thema 'Linux Server absichern' hinzugefügt.

[**--> YouTube-Playlist: Linux Server absichern**](https://www.youtube.com/playlist?list=PLknVEQKqt1ln-5HL8aG_Xk0bDeitgt0j_)
{{< /alert >}}
<!-- FM:Snippet:End -->



## Verwendete Befehle und Anmerkungen in den entsprechenden Videos

Alle Befehle die ich im Video-Tutorial 'Linux Server absichern' verwendet habe, findet hier chronologisch aufgelistet.

<!-- FM:Snippet:Start data:{"id":"Info","fields":[]} -->
{{< alert type="info" >}}
### Hinweis

Die folgenden Voraussetzungen sollten / müssen erfüllt sein, dass ihr die einzelnen Konfigurationen am Linux-Server vornehmen könnt:

- **Das Server-OS muss ein Betriebssystem sein, welches auf Debian basiert**

- **Zugriff per SSH auf den Linux-Server ist möglic**h

- **Ihr habt die nötigen Berechtigungen (root-Zugriff) um am System Änderungen vorzunehmen**

- **SSH-Client (Putty, Terminal)**
{{< /alert >}}
<!-- FM:Snippet:End -->


### Schritt 1 Linux Server absichern | Anmelden per SSH und System aktualisieren:

```sh
# SSH-Verbindung herstellen
ssh root@IP-Adresse-vom-Pi
```

```sh
# Betriebssystem aktualisieren
sudo apt update && apt upgrade -y
```

### Schritt 2 Linux Server absichern | Ändern Root-User-Passwort

Natürlich ist es sehr empfehlenswert das Passwort des Standard-User durch ein wirklich sicheres Passwort abzusichern. Auch wenn wir im nächsten Schritt den Standard-User 'root' deaktivieren werden, empfehle ich es trotzdem hier vorab ein sicheres Passwort zu vergeben. Schnell ist es passiert, dass irgendwelchen Gründen der Standard-User wieder aktiviert wird oder alte Systeme genutzt werden.

#### Ändern des Passworts des Root-User in ein sicheres Passwort.

Am besten nutzt ihr zum Generieren des Passworts einen Passwort-Generator von einem Passwort-Manager eures Vertrauens wie zum Beispiel **[KeePass](https://keepass.info/download.html)** oder **[Bitwarden](https://bitwarden.com/de-DE/)** und speichert das generierte Passwort in diesem Passwort-Manager gleich ab.

```sh
# Password erneuern

passwd
```

### Schritt 3 Linux Server absichern | Neuen User mit erhöhten Rechten anlegen

#### Sudo-Programm installieren

Um einen neuen Nutzer im weiteren Verlauf in die Gruppe 'sudo' aufzunehmen und damit diesem root-Rechte zu erteilen, müssen wir vorab das Programm 'sudo' installieren.

```sh
# sudo-Programm installieren

apt install sudo
```

#### Neuen Benutzer anlegen:

```sh
sudo adduser NeuerUsername
```

#### Neuen Benutzer der Administratoren-Gruppe hinzufügen:

```sh
sudo gpasswd -a NeuerUsername adm
```

#### Neuen Benutzer zur Superuser-Gruppe hinzufügen:

```sh
sudo gpasswd -a NeuerUsername sudo
```
<!-- FM:Snippet:Start data:{"id":"Warning","fields":[]} -->
{{< alert type="warning" >}}
Vor dem Deaktivieren von dem User 'root', erst überprüfen, ob der neue User alle erforderlichen Rechte hat!

Wie das funktioniert, erfahrt ihr im Schritt 4.
{{< /alert >}}
<!-- FM:Snippet:End -->


### Schritt 4 Linux Server | Testen des neuen User-Accounts

Bevor der alte Standard-Account 'root' deaktiviert werden kann, wird dieser von uns zunächst auf seine Rechte hin überprüft.

Dazu wird ein separates Terminal-Instanz (Terminal-Fenster) geöffnet. Hier melden wir uns mit dem neu erstellten User an und überprüfen die Berechtigungen mit den folgenden Befehlen.

#### Überprüfen welche Berechtigung der neu angelegte User hat:

```sh
sudo whoami

# Dann das vergebene Benutzer-Passwort eingeben

# Antwort muss hier 'root' sein
```

#### Den alten User-Account 'root' deaktivieren:

Nach erfolgreicher Überprüfung der Rechte des neuen Username, kann nun der User 'pi' deaktiviert werden und damit ist dann keine Anmeldung mit diesem Username mehr möglich.

```sh
sudo passwd -l root
```

## SSH-Zugang absichern

**Die Absicherung des Zugangs via SSH ist wirklich ein absolutes Muss bei der Absicherung eines Linux-Servers!  
Hierzu habe ich euch extra ein ausführliches Tutorial hier auf SecureBits geschrieben:  
Erfahre wie du einen Zugang mittels SSH zu deinem Remote-Server richtig und sicher einrichtest.**This is sample alert with `type="info"`.

[Zum Tutorial](https://secure-bits.org/tutorial-linux-ssh-absichern-hardening-in-2024/ "Linux SSH absichern")

### Schritt 5 Linux Server absichern | Firewall: Installation und Konfiguration

Als leicht zu bedienende Firewall nutzen wir in diesem Beispiel die UFW-Firewall (Uncomplicated Firewall).

In diesem Tutorial werde ich die Konfiguration der UFW-Firewall nur kurz anhand des Beispiels einer Firewall-Regel für den SSH-Zugriff aufführen.

Ein ausführliches Tutorial zu diesem Thema habe ich hier auf SecureBits veröffentlicht und es gibt ebenso auch einige Video-Tutorials zu diesem Thema von mir. In diesen Tutorials erfahrt ihr, wie ihr weitere Regeln für Zugriffe auf dem Server konfigurieren könnt.

### Linux Server absichern | Blog-Beiträge zur UFW-Firewall:

- **[UFW-Firewall-Installation auf einem Raspberry Pi](https://secure-bits.org/ufw-firewall-raspberry-pi/)** (funktioniert auf allen debianbasierten Systemen)

- **[UFW-Firewall Grundlagen](https://secure-bits.org/ufw-firewall-grundlagen/)**

- **[UFW-Firewall - Mehrere Ports, Ports und Dienste freigeben](https://secure-bits.org/ufw-firewall-mehrere-ports-portbereiche-und-dienste-freigeben/)**

- **[UFW-Firewall - Application Profiles erstellen](https://secure-bits.org/ufw-firewall-application-profiles-erstellen-teil-3-uncomplicated-firewall/)**

### Linux Server absichern | Video-Beiträge auf meinem YouTube-Kanal

- **[UFW-Firewall-Installation auf einem Raspberry Pi](https://youtu.be/Dh3A1Idktmg)**

- **[UFW-Firewall Grundlagen](https://youtu.be/BumaXOYey1c)**

- **[UFW-Firewall - Mehrere Ports, Ports und Dienste freigeben](https://youtu.be/Gwbq6F1N3xo)**

- **[UFW-Firewall - Application Profiles erstellen](https://youtu.be/TDKaLgWd12A)**

#### UFW-Firewall installieren

Die Installation der Uncomplicated-Firewall erfolgt durch die Eingabe des folgenden Befehls:

```sh
sudo apt install ufw
```

#### Firewall-Regel für den SSH-Zugriff erstellen

Nach der erfolgreichen Installation der UFW-Firewall ist diese inaktiv.

**Bevor die Firewall aktiviert** werden kann, **muss** zunächst **eine Firewall-Regel für den SSH-Zugriff erstellt werden**, da ihr sonst beim Aktivieren der Firewall keinen Zugriff mehr per SSH auf den Linux Server habt!

```sh
sudo ufw allow 22/tcp comment "SSH"

# Hinweis - Wenn ihr den Port für SSH geändert habt, müsst ihr diesen entsprechend anpassen!
# Beispiel:

sudo ufw allow 2223/tcp comment "neuer SSH-Port"
```

#### SSH-Zugriff weiter beschränken

Weiterhin könnt ihr den Zugriff per SSH-Verbindung auch noch weiter reglementieren.

So zum Beispiel, dass nur ein Zugriff über einen IP-Adressbereich möglich ist:

```sh
sudo ufw allow from <Beispielbereich=192.168.178.0/24> to any port 22

# Hinweis - Wenn ihr den Port für SSH geändert habt, müsst ihr diesen entsprechend anpassen!
# Beispiel:

sudo ufw allow from <Beispielbereich=192.168.178.0/24> to any port 2223 
```

oder der Zugriff ist nur über eine einzelne IP-Adresse (von einem Rechner oder eine öffentliche feste IP-Adresse) möglich:

```sh
sudo ufw allow from <feste IP-Adresse=192.168.178.30> to any Port 22

# Hinweis - Wenn ihr den Port für SSH geändert habt, müsst ihr diesen entsprechend anpassen!
# Beispiel:

sudo ufw allow from <feste IP-Adresse=192.168.178.30> to any port 2223 
```


<!-- FM:Snippet:Start data:{"id":"Warning","fields":[]} -->
{{< alert type="warning" >}}
Bitte darauf achten, dass ihr bei der Vergabe entweder den richtigen IP-Adressbereich beziehungsweise die richtige feste IP-Adresse angibt. 
**Andernfalls sperrt ihr euch selbst aus!**
{{< /alert >}}
<!-- FM:Snippet:End -->


##### SSH-Zugriff - Anmeldelimit für falsche Anmeldungen limitieren

Es gibt auch die Möglichkeit, die Falsch-Anmeldungen mittels Firewall-Regel per SSH-Zugriff zu limitieren oder ihr nutzt hierzu den Dienst Fail2Ban, dessen Konfiguration ich weiter unten in diesem Tutorial zeige.

Zunächst zeige ich hier erstmal wie das per UFW-Firewall-Regel funktioniert. Hierbei wird der Standard von 6 fehlgeschlagenen Anmeldungen innerhalb 30 Sekunden gesetzt.

```sh
sudo ufw limit 22/tcp
```

#### UFW-Firewall aktivieren und aktivierte Regeln anzeigen

Nachdem ihr die Regeln für den Service 'SSH' erstellt habt, könnt ihr nun die Firewall aktivieren.

```sh
sudo ufw enable
```

Um einen Überblick über die erstellten UFW-Regeln zu erhalten, könnt ihr diesen Befehl nutzen

```sh
sudo ufw status verbose
```

## Schritt 6 Linux Server absichern - Automatische Installation wichtiger Updates konfigurieren

### Automatische Updates - Beispiel Debain 12

Für andere Distros müsst ihr die folgende Konfiguration entsprechend anpassen!

Fast jeden Tag kann man in den Nachrichten verfolgen, dass wieder Hacker-Angriffe auf irgendwelche Server im Internet erfolgen! Und meistens liegt das daran, dass hierbei Sicherheitslücken für einen Angriff ausgenutzt werden, wofür aber schon Sicherheitsupdates seit längerem zur Verfügung stehen, aber diese Updates nicht im System eingepflegt wurden.

Dabei ist es unter Linux ja ein Leichtes, diese Sicherheitsupdates automatisch zum Beispiel jede Nacht einzuspielen und somit etwaige Sicherheitslücken im System zu schließen. Und das alles ohne das man als Administrator jedes Mal handanlegen muss!

#### Installation des Service für automatische Updates

```sh
sudo apt install unattended-upgrades -y
```

#### Konfiguration der automatischen Aktualisierung vornehmen

Als erstes müssen wir erstmal die Config-Datei von '**unattended-upgrades**' konfigurieren und diesen Dienst an Debian 12 anpassen.

#### Aufrufen der '50unattended-upgrades-config-Datei' mit dem Nano-Editor

```sh
sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
```

Folgende Ausgabe sollte euch im Nano-Editor-Fenster angezeigt werden:

```ini
Unattended-Upgrade::Origins-Pattern {
        // Codename based matching:
        // This will follow the migration of a release through different
        // archives (e.g. from testing to stable and later oldstable).
        // Software will be the latest available for the named release,
        // but the Debian release itself will not be automatically upgraded.
//      "origin=Debian,codename=${distro_codename}-updates";
//      "origin=Debian,codename=${distro_codename}-proposed-updates";
        "origin=Debian,codename=${distro_codename},label=Debian";
        "origin=Debian,codename=${distro_codename},label=Debian-Security";
        "origin=Debian,codename=${distro_codename}-security,label=Debian-Security";

        // Archive or Suite based matching:
        // Note that this will silently match a different release after
        // migration to the specified archive (e.g. testing becomes the
        // new stable).
//      "o=Debian,a=stable";
//      "o=Debian,a=stable-updates";
//      "o=Debian,a=proposed-updates";
//      "o=Debian Backports,a=${distro_codename}-backports,l=Debian Backports";
};
```

Wenn alle Änderungen in der Config-Datei vorgenommen wurden, könnt ihr die Änderungen durch die folgenden Tasten-Kombinationen speichern und den Editor verlassen:

**STRG+O** und mit **Y** bestätigen und mit **STRG+X** den Editor verlassen

#### Automatische Updates aktivieren

Um nun den Dienst zu Aktivieren und die tägliche Durchführung zu gewährleisten, müssen wir noch die Config-Datei '20auto-upgrades' überprüfen und falls nicht vorhanden die folgenden Anweisungen eintragen.

#### Config-Datei '20auto-upgrades' im Editor aufrufen

```sh
sudo nano /etc/apt/apt.conf.d/20auto-upgrades
```

Folgende Einträge hinzufügen

```ini
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
```

Danach die Änderungen mit den oben genannten Tasten-Kombinationen speichern und den Editor verlassen.

#### Unattended-Upgrades Dienst Starten und den automatischen Start aktivieren

Nach der Installation muss der Dienst 'unattended-upgrades' gestartet werden und auch zum automatischen Starten nach einem Neustart eingerichtet werden.

```sh
# unattended-upgrades aktiveren

sudo systemctl start unattended-upgrades

# unattended-upgrades automatisch nach einem Neustart starten

sudo systemctl enable unattended-upgrades

# Status des Dienstes überprüfen

sudo systemctl status unattended-upgrades
```

#### Überprüfen des Dienstes - **unattended-upgrades**

Um die Konfiguration des Dienstes 'unattended-upgrades' zu überprüfen, gibt ihr den folgenden Befehl ein:

```sh
# unattended-upgrades Dienst überprüfen

sudo unattended-upgrades --dry-run --debug
```

### Linux Server absichern | SSH-Zugriff nur für einen bestimmten User erlauben

Weiter haben wir noch die Möglichkeit, den SSH-Zugriff nur auf einen oder mehrere User festzulegen. Hierfür bearbeiten wir die 'sshd\_config-Datei' um hier den oder die User festzulegen.

##### Aufrufen und bearbeiten der 'sshd\_config-Datei'

```sh
sudo nano /etc/ssh/sshd_config
```

Nun fügt ihr den folgenden Eintrag in den Editor ein:

```ini
AllowUsers <Username den ihr freigeben möchtet>

# Mehrere User könnt ihr wie folgt freigeben:
AllowUsers user1 user2
```

Danach die Änderungen im Editor wieder mit STRG+O und mit Y speichern und mit STRG+X den Editor schließen.

##### SSH-Dienst neu starten

Nach der Änderung der 'sshd\_config-Datei' muss der SSH-Dienst neu gestartet werden um die Änderungen zu übernehmen.

```sh
sudo systemctl restart ssh
```

### Linux Server absichern | Brute Force-Attacken abwehren mit Fail2Ban

Gerade bei Geräten, die mit dem Internet verbunden sind (Webservices, Smart Home, etc.) ist es sehr ratsam, dass Gerät vor Brute-Force-Attacken zu schützen.

Hierfür hat sich die Anwendung 'fail2ban' sehr bewährt. Diese Anwendung ist hervorragend dazu geeignet Anmeldevorgänge zu überwachen und bei zu vielen fehlgeschlagenen Anmeldeversuchen, die zugreifende IP-Adresse zu verbannen.

In meinem Beispiel werden wir die Anmeldungen auf den SSH-Server überwachen. Natürlich könnt ihr fail2ban auch für andere Zugänge wie zum Beispiel sftp, https und noch viele weitere Dienste, verwenden.

#### Installation von fail2ban auf einen Debian-Server

```sh
sudo apt install fail2ban -y
```

Um die Konfigurations-Datei 'jail.local' im Nano-Editor zu bearbeiten / erstellen führt ihr den folgenden Befehl aus:

```sh
sudo nano /etc/fail2ban/jail.local
```

Um nun ungültige Anmeldeversuche per SSH-Verbindung zu bannen, erstellen wir die folgenden Einträge im Editor-Fenster

### Debian 12 und fail2ban

Ab Debian Version 12 wird die Log-Datei **/var/log/auth.log** nicht mehr vom OS unterstützt, da Debian 12 zum Loggen Journald nutzt. Daher habe ich in der **jail.local** als backend '**systemd**' eingetragen. Ebenfalls habe ich für das Blocken von SSH-Anfragen, die Konfiguration für das Erstellen der Firewall-Regeln, auf nftables geändert (Debain 12 nutzt nftables und nicht mehr iptables). Unter Debain 11 kann auch 'ufw' als banaction genutzt werden!

```ini
[DEFAULT]
bantime = 3600
backend = systemd
allowipv6 = auto

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
bantime = 2W
ignoreip = 127.0.0.1/8
```

Wenn die Eintragungen vorgenommen wurden, dann wie immer per STRG+O den Speicherdialog aufrufen, diesen mit Y bestätigen und mit STRG-X den Editor verlassen.

#### Den Dienst fail2ban auf dem Debain-System aktivieren

Nachdem jetzt die Konfiguration für das Bannen von IP-Adressen bei Falschanmeldung per SSH-Verbindung fertig gestellt ist, kann nun die Aktivierung von fail2ban erfolgen.

```sh
# Autostart fail2ban aktivieren

sudo systemctl enable fail2ban

# fail2ban starten

sudo systemctl start fail2ban

# fail2ban-Service überprüfen

sudo systemctl status fail2ban
```

#### fail2ban - IP-Adressen entsperren / sperren

Um zum Beispiel eine gebannte IP-Adresse wieder manuell zu Entsperren, gibt ihr den folgenden Befehl im Terminal ein:

```sh
# IP-Adresse wieder entsperren

sudo fail2ban-client set sshd unbanip <IP-Adresse>
```

Genauso habt ihr die Möglichkeit auch eine IP-Adresse manuell zu Sperren:

```sh
# IP-Adresse manuell sperren:

sudo fail2ban-client set sshd banip <IP-Adresse>
```

#### SSHD-Dienst neu starten

Als letztes muss der Dienst SSHD ebenfalls neu gestartet werden, damit fail2ban seiner Aufgabe nachgehen kann. Hierzu gibt ihr diesen Befehl ein:

```sh
# SSH-Dienst neu starten

sudo systemctl restart sshd
```

#### Ansicht der gesperrten IP-Adressen in fail2ban

Um eine Übersicht anzuzeigen, welche IP-Adressen durch erfolglose Anmeldeversuche via SSH durch fail2ban gesperrt wurden, könnt ihr diesen Befehl eingeben.

```sh
# Anzeigen gesperrter IP-Adressen

sudo fail2ban-client status sshd
```

## Linux Server absichern | Zusammenfassung

Nach meinem Dafürhalten haben wir durch die durchgeführten Maßnahmen unseren konfigurierten Linux-Server gut gegen Angriffe abgesichert.

In Zukunft werde ich noch andere Möglichkeiten zur Absicherung von Linux-Servern hier auf diesem Blog vorstellen. Hier werde ich dann zum Beispiel Dienste wie Crowdsec, Copilot (hat nichts mit KI zu tun) und andere Tools vorstellen.

Sollte euch ein Fehler auffallen oder habt ihr noch Ergänzungen für dieses Anleitung, dann schreibt mir gerne ein Kommentar.

Natürlich würde ich mich auch über ein [**Abo auf meinem YouTube-Kanal**](https://www.youtube.com/channel/UCr-cuwB555JmAm4F412KZ2Q) von euch freuen!


<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->