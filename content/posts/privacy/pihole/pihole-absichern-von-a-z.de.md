---
title: "Raspberry Pi absichern von A-Z "
date: 2023-02-08
categories:
  - linux
  - netzwerk
  - security
  - tutorials
  - video
tags:
  - firewall
  - linux
  - network
  - netzwerk
  - security
  - tutorials
  - pi-hole
description: Raspberry Pi OS absichern von a - Z
preview: ../../../../assets/images/posts/pihole/Video-Raspberry-Pi-absichern-von-A-Z.png
hero: /images/posts/pihole/Video-Raspberry-Pi-absichern-von-A-Z.png
menu:
  sidebar:
    name: Sichere deinen Raspberry Pi für Pihole und AdGuardHome a
    identifier: raspberry-safe
    parent: pihole
lastmode: 2025-08-09T17:27:30.778Z
keywords:
  - Raspberry Pi absichern
---

## ## Raspberry Pi absichern - Den Raspberry Pi sicher betreiben

In diesem neuen Video auf meinem **[YouTube-Kanal](https://www.youtube.com/channel/UCr-cuwB555JmAm4F412KZ2Q)** zeige ich euch, wie ihr euren Raspberry Pi mithilfe verschiedener Anpassungen sicher betreiben könnt und so vor Angriffe schützen könnt.

Immer wieder liest und hört man von Hacking-Angriffen auf IoT-Geräte. Meist liegt das daran, dass IoT-Geräte minderwertig vor Angriffen jeglicher Art, geschützt sind.

Oft wird für den IoT-Einsatz auch der Raspberry Pi als Grundplattform hierbei genutzt. Dieser ist ja auch nicht umsonst einer der beliebtesten Einplatinen-Rechner und sorgt mit seiner Vielzahl an Einsatzmöglichkeiten dazu, dass dieses Gerät sehr gut für viele verschiedene IoT-Einsatzszenarien flexibel genutzt werden kann.

Leider sehen es viele Hersteller von solchen Produkten es mit der Sicherheit ihrer Produkte nicht so eng! Obwohl es ein Einfaches ist, das Raspberry Pi OS oder andere genutzte Linux-Varianten abzusichern.

Und wie ihr euren Raspberry Pi absichern könnt, das erfahrt ihr in diesem Video-Tutorial:

## Video-Tutorial zum Thema Raspberry Pi absichern

Da dieses Thema schon sehr umfassend ist, habe ich das Tutorial auf mehrere Videos aufgeteilt. Soll heißen hier werden von Zeit zu Zeit weitere Videos dazukommen.


https://www.youtube.com/playlist?list=PLknVEQKqt1ln-5HL8aG\_Xk0bDeitgt0j\_


Playlist der Videoreihe | Linux Server absichern / hardening



## Verwendete Befehle in diesem Video

Alle Befehle die ich im Video-Tutorial 'Raspberry Pi absichern' verwendet habe, findet hier chronologisch aufgelistet.

### Voraussetzungen:

Die folgenden Voraussetzungen sollten / müssen erfüllt sein, dass ihr die einzelnen Konfigurationen am Raspberry Pi vornehmen könnt:

- **User = pi (oder die aufgeführten Befehle entsprechend mit eurem Username austauschen)**

- **Zugriff per SSH auf den Raspberry Pi ist möglich**

- **SSH-Client (Putty, Terminal)**

### Schritt 1 Raspberry Pi absichern | Anmelden per SSH und Raspberry Pi OS aktualisieren:

```sh
# SSH-Verbindung herstellen
ssh pi@IP-Adresse-vom-Pi
```

#### Raspberry OS aktualisieren:

```sh
# Raspberry Pi OS aktualisieren
sudo apt update && apt upgrade -y
```

### Schritt 2 Raspberry Pi absichern | Ändern Root-User-Passwort

Natürlich ist es sehr empfehlenswert das Passwort des Standard-User durch ein wirklich sicheres Passwort abzusichern. Auch wenn wir im nächsten Schritt den Standard-User 'pi' deaktivieren werden, empfehle ich es trotzdem hier vorab ein sicheres Passwort zu vergeben. Schnell ist es passiert, dass irgendwelchen Gründen der Standard-User wieder aktiviert wird oder alte Systeme genutzt werden (hier war das Standard-Passwort 'raspberry') und schon kann man sich leicht Zugang zum System verschaffen.

**Noch sicherer ist meiner Meinung nach die Anmeldung mittels Public Key. Diesbezüglich werde ich nächster Zeit auch noch ein Tutorial veröffentlichen und dann hier verlinken.**

#### Ändern des Passworts des Root-User in ein sicheres Passwort.

Am besten nutzt ihr zum Generieren des Passworts einen Passwort-Generator von einem Passwort-Manager eures Vertrauens wie zum Beispiel **[KeePass](https://keepass.info/download.html)** oder **[Bitwarden](https://bitwarden.com/de-DE/)** und speichert das generierte Passwort in diesem Passwort-Manager gleich ab.

```sh
# Password erneuern

passwd
```

### Schritt 3 Raspberry Pi absichern | Standard-User Pi ändern

Solltet ihr beim Erstellen des Raspberry Pi OS mit dem [**Raspberry Pi Imager**](https://www.raspberrypi.com/software/) den Standard-User 'pi' nicht geändert haben, dann sollte dieser Standard-User auf jeden Fall durch einen neuen User ersetzt werden und im späteren Verlauf der User 'pi' deaktiviert werden.

#### Sudo-Programm installieren

Um einen neuen Nutzer in die Gruppe 'sudo' aufzunehmen und damit diesem root-Rechte zu erteilen, müssen wir vorab das Programm 'sudo' installieren.

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

Vor dem Deaktivieren von dem User 'pi', erst überprüfen, ob der neue User alle erforderlichen Rechte hat!

Wie das funktioniert, erfahrt ihr im Schritt 4.

### Schritt 4 Raspberry Pi absichern | Testen des neuen User-Accounts

Bevor der alte Standard-Account 'pi' deaktiviert werden kann, wird dieser von uns zunächst auf seine Rechte hin überprüft.

Dazu wird ein separates Terminal-Instanz (Terminal-Fenster) geöffnet. Hier melden wir uns mit dem neu erstellten User an und überprüfen die Berechtigungen mit den folgenden Befehlen.

#### Überprüfen welche Berechtigung der neu angelegte User hat:

```sh
sudo whoami

# Dann das vergebene Benutzer-Passwort eingeben

# Antwort muss hier 'root' sein
```

#### Den alten User-Account 'pi' deaktivieren:

Nach erfolgreicher Überprüfung der Rechte des neuen Username, kann nun der User 'pi' deaktiviert werden und damit ist dann keine Anmeldung mit diesem Username mehr möglich.

```sh
sudo passwd -l pi
```

### SSH-Zugang richtig absichern

Die Absicherung des Zugangs via SSH ist wirklich ein absolutes Muss bei der Absicherung eines Linux-Servers!  
Hierzu habe ich euch extra ein ausführliches Tutorial hier auf SecureBits geschrieben:  
Erfahre wie du einen Zugang mittels SSH zu deinem Remote-Server richtig und sicher einrichtest.

[Zum Tutorial](https://secure-bits.org/tutorial-linux-ssh-absichern-hardening-in-2024/)

### Schritt 5 Raspberry Pi absichern | Firewall: Installation und Konfiguration

Als leicht zu bedienende Firewall nutzen wir in diesem Beispiel die UFW-Firewall (Uncomplicated Firewall).

In diesem Tutorial werde ich die Konfiguration der UFW-Firewall nur kurz anhand des Beispiels einer Firewall-Regel für den SSH-Zugriff aufführen.

Ein ausführliches Tutorial zu diesem Thema habe ich hier auf SecureBits veröffentlicht und es gibt ebenso auch einige Video-Tutorials zu diesem Thema von mir. In diesen Tutorials erfahrt ihr, wie ihr weitere Regeln für Zugriffe auf dem Server konfigurieren könnt.

### Raspberry Pi absichern | Blog-Beiträge zur UFW-Firewall:

- **[UFW-Firewall-Installation auf einem Raspberry Pi](https://secure-bits.org/posts/security/ufw-firewall-debian-basierend/)**

- **[UFW-Firewall Grundlagen](https://secure-bits.org/posts/security/ufw-firewall-basics/)**

- **[UFW-Firewall - Mehrere Ports, Ports und Dienste freigeben](https://secure-bits.org/posts/security/ufw-firewall-mehrere-ports/)**

- **[UFW-Firewall - Application Profiles erstellen](https://secure-bits.org/posts/security/ufw-firewall-application-profiles/)**

### Raspberry Pi absichern | Video-Beiträge auf meinem YouTube-Kanal

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

**Bevor die Firewall aktiviert** werden kann, **muss** zunächst **eine Firewall-Regel für den SSH-Zugriff erstellt werden**, da ihr sonst beim Aktivieren der Firewall keinen Zugriff mehr per SSH auf den Raspberry Pi habt!

```sh
sudo ufw allow 22/tcp comment "SSH"
```

#### SSH-Zugriff weiter beschränken

Weiterhin könnt ihr den Zugriff per SSH-Verbindung auch noch weiter reglementieren.

So zum Beispiel, dass nur ein Zugriff über einen IP-Adressbereich möglich ist:

```sh
sudo ufw allow from <Beispielbereich=192.168.178.0/24> to any port 22
```

oder der Zugriff ist nur über eine einzelne IP-Adresse (von einem Rechner oder eine öffentliche feste IP-Adresse) möglich:

```sh
sudo ufw allow from <feste IP-Adresse=192.168.178.30> to any Port 22
```

Bitte darauf achten, dass ihr bei der Vergabe entweder den richtigen IP-Adressbereich beziehungsweise die richtige feste IP-Adresse angibt. Andernfalls sperrt ihr euch selbst aus!

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

### Schritt 6 Raspberry Pi absichern - Automatische Installation wichtiger Updates konfigurieren

Fast jeden Tag kann man in den Nachrichten verfolgen, dass wieder Hacker-Angriffe auf irgendwelche Server im Internet erfolgen! Und meistens liegt das daran, dass hierbei Sicherheitslücken für einen Angriff ausgenutzt werden, wofür aber schon Sicherheitsupdates seit längerem zur Verfügung stehen, aber diese Updates nicht im System eingepflegt wurden.

Dabei ist es unter Linux ja ein Leichtes, diese Sicherheitsupdates automatisch zum Beispiel jede Nacht einzuspielen und somit etwaige Sicherheitslücken im System zu schließen. Und das alles ohne das man als Administrator jedes Mal handanlegen muss!

#### Installation des Service für automatische Updates

```sh
sudo apt install unattended-upgrades -y
```

#### Konfiguration der automatischen Aktualisierung vornehmen

Als erstes müssen wir erstmal die Config-Datei von 'unattended-upgrades' konfigurieren und diesen Dienst an das Raspberry Pi OS anpassen.

##### Aufrufen der '50unattended-upgrades-config-Datei' mit dem Nano-Editor

```sh
sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
```

Folgende Ausgabe sollte euch im Nano-Editor-Fenster angezeigt werden:

```ini
// Unattended-Upgrade::Origins-Pattern controls which packages are
// upgraded.
//
// Lines below have the format "keyword=value,...".  A
// package will be upgraded only if the values in its metadata match
// all the supplied keywords in a line.  (In other words, omitted
// keywords are wild cards.) The keywords originate from the Release
// file, but several aliases are accepted.  The accepted keywords are:
//   a,archive,suite (eg, "stable")
//   c,component     (eg, "main", "contrib", "non-free")
//   l,label         (eg, "Debian", "Debian-Security")
//   o,origin        (eg, "Debian", "Unofficial Multimedia Packages")
//   n,codename      (eg, "jessie", "jessie-updates")
//     site          (eg, "http.debian.net")
// The available values on the system are printed by the command
// "apt-cache policy", and can be debugged by running
// "unattended-upgrades -d" and looking at the log file.
//
// Within lines unattended-upgrades allows 2 macros whose values are
// derived from /etc/debian_version:
//   ${distro_id}            Installed origin.
//   ${distro_codename}      Installed codename (eg, "buster")
Unattended-Upgrade::Origins-Pattern {
        // Codename based matching:
        // This will follow the migration of a release through different
        // archives (e.g. from testing to stable and later oldstable).
        // Software will be the latest available for the named release,
        // but the Debian release itself will not be automatically upgraded.
//      "origin=Debian,codename=${distro_codename}-updates";
//      "origin=Debian,codename=${distro_codename}-proposed-updates";
//      "origin=Debian,codename=${distro_codename},label=Debian";
//      "origin=Debian,codename=${distro_codename},label=Debian-Security";
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

// Python regular expressions, matching packages to exclude from upgrading
Unattendufw-firewall-application-profiles-erstellen-teil-3-uncomplicated-firewall/ed-Upgrade::Package-Blacklist {
    // The following matches all packages starting with linux-
//  "linux-";

    // Use $ to explicitely define the end of a package name. Without
    // the $, "libc6" would match all of them.
//  "libc6$";
//  "libc6-dev$";
//  "libc6-i686$";

    // Special characters need escaping
//  "libstdc++6$";

    // The following matches packages like xen-system-amd64, xen-utils-4.1,
    // xenstore-utils and libxenstore3.0
//  "(lib)?xen(store)?";

    // For more information about Python regular expressions, see
    // https://docs.python.org/3/howto/regex.html
};

// This option allows you to control if on a unclean dpkg exit
// unattended-upgrades will automatically run
//   dpkg --force-confold --configure -a
// The default is true, to ensure updates keep getting installed
//Unattended-Upgrade::AutoFixInterruptedDpkg "true";
// Split the upgrade into the smallest possible chunks so that
// they can be interrupted with SIGTERM. This makes the upgrade
// a bit slower but it has the benefit that shutdown while a upgrade
// is running is possible (with a small delay)
//Unattended-Upgrade::MinimalSteps "true";

// Install all updates when the machine is shutting down
// instead of doing it in the background while the machine is running.
// This will (obviously) make shutdown slower.
// Unattended-upgrades increases logind's InhibitDelayMaxSec to 30s.
// This allows more time for unattended-upgrades to shut down gracefully
// or even install a few packages in InstallOnShutdown mode, but is still a
// big step back from the 30 minutes allowed for InstallOnShutdown previously.
// Users enabling InstallOnShutdown mode are advised to increase
// InhibitDelayMaxSec even further, possibly to 30 minutes.
//Unattended-Upgrade::InstallOnShutdown "false";

// Send email to this address for problems or packages upgrades
// If empty or unset then no email is sent, make sure that you
// have a working mail setup on your system. A package that provides
// 'mailx' must be installed. E.g. "user@example.com"
//Unattended-Upgrade::Mail "";

// Set this value to one of:
//    "always", "only-on-error" or "on-change"
// If this is not set, then any legacy MailOnlyOnError (boolean) value
// is used to chose between "only-on-error" and "on-change"
//Unattended-Upgrade::MailReport "on-change";

// Remove unused automatically installed kernel-related packages
// (kernel images, kernel headers and kernel version locked tools).
//Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";

// Do automatic removal of newly unused dependencies after the upgrade
//Unattended-Upgrade::Remove-New-Unused-Dependencies "true";

// Remove unused automatically installed kernel-related packages
// (kernel images, kernel headers and kernel version locked tools).
//Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";

// Do automatic removal of newly unused dependencies after the upgrade
//Unattended-Upgrade::Remove-New-Unused-Dependencies "true";

//      Do automatic removal of unused packages after the upgrade
//      (equivalent to apt-get autoremove)
//      Unattended-Upgrade::Remove-Unused-Dependencies "false";

// Automatically reboot *WITHOUT CONFIRMATION* if
//  the file /var/run/reboot-required is found after the upgrade
//        Unattended-Upgrade::Automatic-Reboot "true";

// Automatically reboot even if there are users currently logged in
// when Unattended-Upgrade::Automatic-Reboot is set to true
//      Unattended-Upgrade::Automatic-Reboot-WithUsers "true";

// If automatic reboot is enabled and needed, reboot at the specific
// time instead of immediately
//  Default: "now"
//      Unattended-Upgrade::Automatic-Reboot-Time "02:00";

// Use apt bandwidth limit feature, this example limits the download
// speed to 70kb/sec
//Acquire::http::Dl-Limit "70";

// Enable logging to syslog. Default is False
// Unattended-Upgrade::SyslogEnable "false";

// Specify syslog facility. Default is daemon
// Unattended-Upgrade::SyslogFacility "daemon";

// Download and install upgrades only on AC power
// (i.e. skip or gracefully stop updates on battery)

// Download and install upgrades only on AC power
// (i.e. skip or gracefully stop updates on battery)
// Unattended-Upgrade::OnlyOnACPower "true";

// Download and install upgrades only on non-metered connection
// (i.e. skip or gracefully stop updates on a metered connection)
// Unattended-Upgrade::Skip-Updates-On-Metered-Connections "true";

// Verbose logging
// Unattended-Upgrade::Verbose "false";

// Print debugging information both in unattended-upgrades and
// in unattended-upgrade-shutdown
// Unattended-Upgrade::Debug "false";

// Allow package downgrade if Pin-Priority exceeds 1000
// Unattended-Upgrade::Allow-downgrade "false";

// When APT fails to mark a package to be upgraded or installed try adjusting
// candidates of related packages to help APT's resolver in finding ufw-firewall-application-profiles-erstellen-teil-3-uncomplicated-firewall/a solution
// where the package can be upgraded or installed.
// This is a workaround until APT's resolver is fixed to always find a
// solution if it exists. (See Debian bug #711128.)
// The fallback is enabled by default, except on Debian's sid release because
// uninstallable packages are frequent there.
// Disabling the fallback speeds up unattended-upgrades when there are
// uninstallable packages at the expense of rarely keeping back packages which
// could be upgraded or installed.
// Unattended-Upgrade::Allow-APT-Mark-Fallback "true";
```

##### Bearbeiten der '50unattended-upgrades-config-Datei'

###### Zum einen müssen wir die folgenden zwei Zeilen ersetzen, damit Updates von dem Release-Channel für -Raspberry OS aktualisiert und heruntergeladen werden.

```sh
#Entfernen der folgenden Zeile:

//      "origin=Debian,codename=${distro_codename},label=Debian";

# Wird ersetzt durch:

"origin=Raspbian,codename=${distro_codename},label=Raspbian";
"origin=Raspberry Pi Foundation,codename=${distro_codename},label=Raspberry Pi Foundation";

# und die '//' werden vor den hinzugefügten sowie von folgenden Zeilen für Security-Updates entfernt:

        "origin=Debian,codename=${distro_codename},label=Debian-Security";
        "origin=Debian,codename=${distro_codename}-security,label=Debian-Security";
```

##### Automatischer Neustart einrichten

Weiterhin könnt ihr noch einen täglichen Neustart des Systems aktivieren, damit Änderungen die einen solchen benötigen, übernommen werden.

In diesem Beispiel wird jede Nacht um '02:00 Uhr' ein Reboot durchgeführt.

Dafür müssen noch folgende Zeilen ergänzt / geändert werden.

```sh
# Folgende Zeilen ändern und '//' entfernen:

Unattended-Upgrade::Automatic-Reboot "true";

Unattended-Upgrade::Automatic-Reboot-Time "02:00";
```

Wenn alle Änderungen in der Config-Datei vorgenommen wurden, könnt ihr die Änderungen durch die folgenden Tasten-Kombinationen speichern und den Editor verlassen:

**STRG+O** und mit **Y** bestätigen und mit **STRG+X** den Editor verlassen

##### Automatische Updates aktivieren

Um nun den Dienst zu Aktivieren und die tägliche Durchführung zu gewährleisten, müssen wir noch die Config-Datei '20auto-upgrades' überprüfen und falls nicht vorhanden die folgenden Anweisungen eintragen.

###### Config-Datei '20auto-upgrades' im Editor aufrufen

```sh
sudo nano /etc/apt/apt.conf.d/20auto-upgrades
```

Folgende Einträge hinzufügen

```sh
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
```

Danach die Änderungen mit den oben genannten Tasten-Kombinationen speichern und den Editor verlassen.

### Schritt 7 Raspberry Pi absichern | Unnötige Dienste deaktivieren

Um eine höhere Sicherheit auf dem System zu erlangen, sollten Dienste die nicht zum Betrieb benötigt werden, deaktiviert werden. Welche Dienste hier behandelt werden sollten, hängt natürlich von dem Einsatz ab, für den ihr den Raspberry Pi nutzen möchtet.

In diesem Beispiel werden wir den Dienst WiFi deaktivieren.

#### Aktive Dienste des Raspberry Pi anzeigen lassen

Mit dem folgenden Befehl könnt ihr alle aktiven Dienste des Raspberry Pi OS anzeigen lassen und dann hier nach Diensten schauen, die für den Betrieb eures Raspberry Pi Server nicht erforderlich sind.

```sh
systemctl --type=service --state=active
```

Beispiel-Ausgabe des Befehls 'systemctl --type=service --state=active'

```ini
 UNIT                                                        LOAD   ACTIVE SUB     DESCRIPTION
  alsa-restore.service                                        loaded active exited  Save/Restore Sound Card State
  avahi-daemon.service                                        loaded active running Avahi mDNS/DNS-SD Stack
  bluetooth.service                                           loaded active running Bluetooth service
  bthelper@hci0.service                                       loaded active exited  Raspberry Pi bluetooth helper
  console-setup.service                                       loaded active exited  Set console font and keymap
  cron.service                                                loaded active running Regular background program processi>
  dbus.service                                                loaded active running D-Bus System Message Bus
  dhcpcd.service                                              loaded active running DHCP Client Daemon
  dphys-swapfile.service                                      loaded active exited  dphys-swapfile - set up, mount/unmo>
  fake-hwclock.service                                        loaded active exited  Restore / save the current clock
  getty@tty1.service                                          loaded active running Getty on tty1
  hciuart.service                                             loaded active running Configure Bluetooth Modems connecte>
  ifupdown-pre.service                                        loaded active exited  Helper to synchronize boot up for i>
  keyboard-setup.service                                      loaded active exited  Set the console keyboard layout
  kmod-static-nodes.service                                   loaded active exited  Create list of static device nodes >
  ModemManager.service                                        loaded active running Modem Manager
  networking.service                                          loaded active exited  Raise network interfaces
  polkit.service                                              loaded active running Authorization Manager
  raspi-config.service                                        loaded active exited  LSB: Switch to ondemand cpu governo>
  rc-local.service                                            loaded active exited  /etc/rc.local Compatibility
  rng-tools-debian.service                                    loaded active running LSB: rng-tools (Debian variant)
  rpi-eeprom-update.service                                   loaded active exited  Check for Raspberry Pi EEPROM updat>
  rsyslog.service                                             loaded active running System Logging Service
  ssh.service                                                 loaded active running OpenBSD Secure Shell server
  systemd-fsck-root.service                                   loaded active exited  File System Check on Root Device
  systemd-fsck@dev-disk-byx2dpartuuid-4fc4c4a7x2d01.service loaded active exited  File System Check on /dev/disk/by-p>
  systemd-journal-flush.service                               loaded active exited  Flush Journal to Persistent Storage
  systemd-journald.service                                    loaded active running Journal Service
  systemd-logind.service                             ufw-firewall-application-profiles-erstellen-teil-3-uncomplicated-firewall/         loaded active running User Login Management
  systemd-modules-load.service                                loaded active exited  Load Kernel Modules
  systemd-random-seed.service                                 loaded active exited  Load/Save Random Seed
  systemd-remount-fs.service                                  loaded active exited  Remount Root and Kernel File Systems
  systemd-sysctl.service                                      loaded active exited  Apply Kernel Variables
  systemd-sysusers.service                                    loaded active exited  Create System Users
  systemd-timesyncd.service                                   loaded active running Network Time Synchronization
  systemd-tmpfiles-setup-dev.service                          loaded active exited  Create Static Device Nodes in /dev
  systemd-tmpfiles-setup.service                              loaded active exited  Create Volatile Files and Directori>
  systemd-udev-trigger.service                                loaded active exited  Coldplug All udev Devices
  systemd-udevd.service                                       loaded active running Rule-based Manager for Device Event>
  systemd-update-utmp.service                                 loaded active exited  Update UTMP about System Boot/Shutd>
  systemd-user-sessions.service                               loaded active exited  Permit User Sessions
  triggerhappy.service                                        loaded active running triggerhappy global hotkey daemon
  user-runtime-dir@1000.service                               loaded active exited  User Runtime Directory /run/user/10>
  user@1000.service                                           loaded active running User Manager for UID 1000
  wpa_supplicant.service                                      loaded active running WPA supplicant

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.
45 loaded units listed.
```

#### Raspberry Pi WiFi-Dienst deaktivieren

Um den WiFi-Dienst 'wpa\_supplicant' zu deaktivieren gibt ihr den folgenden Befehl in das Terminal-Fenster ein:

```sh
sudo systemctl disable --now wpa_supplicant.service
```

### Raspberry Pi absichern | SSH-Zugriff nur für einen bestimmten User erlauben

Weiter haben wir noch die Möglichkeit, den SSH-Zugriff nur auf einen oder mehrere User festzulegen. Hierfür bearbeiten wir die 'sshd\_config-Datei' um hier den oder die User festzulegen.

##### Aufrufen und bearbeiten der 'sshd\_config-Datei'

```sh
sudo nano /etc/ssh/sshd_config
```

Nun fügt ihr den folgenden Eintrag in den Editor ein:

```sh
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

### Raspberry Pi absichern | Bruteforce-Attacken abwehren mit Fail2Ban

Gerade bei Geräten die mit dem Internet verbunden sind (Webservices, Smart Home, etc.) ist es sehr ratsam, dass Gerät vor Bruteforce-Attacken zu schützen.

Hierfür hat sich die Anwendung 'fail2ban' sehr bewährt. Diese Anwendung ist hervorragend dazu geeignet Anmeldevorgänge zu überwachen und bei zu vielen fehlgeschlagenen Anmeldeversuchen, die zugreifende IP-Adresse zu verbannen.

In meinem Beispiel werden wir die Anmeldungen auf den SSH-Server überwachen. Natürlich könnt ihr fail2ban auch für andere Zugänge wie zum Beispiel sftp, https und noch viele weitere Dienste, verwenden.

#### Installation von fail2ban auf einen Raspberry Pi

```sh
sudo apt install fail2ban -y
```

Um die Konfigurations-Datei 'jail.local' im Nano-Editor zu bearbeiten / erstellen führt ihr den folgenden Befehl aus:

```sh
sudo nano /etc/fail2ban/jail.local
```

Um nun ungültige Anmeldeversuche per SSH-Verbindung zu bannen, erstellen wir die folgenden Einträge im Editor-Fenster

`AccessDenied`Access DeniedJKVMKXZQ7F0FEHKNqaneApO8pi9uJDCrxivN8sM7gSZlLivgOY/fQAZrbpydlLzTfHrFlGu6XbZqC46jNf0OzVZqVig=

### Debian 12 und fail2ban

Ab Debian Version 12 wird die Log-Datei **/var/log/auth.log** nicht mehr vom OS unterstützt, da Debian 12 zum Loggen Journald nutzt. Daher habe ich in der **jail.local** als backend '**systemd**' eingetragen

```sh
[DEFAULT]
bantime = 3600
backend = systemd

[sshd]
enabled   = true
filter    = sshd
banaction = ufw
backend   = systemd
maxretry  = 3
findtime  = 600
bantime   = 3600
ignoreip  = 127.0.0.1/8
```

Wenn die Eintragungen vorgenommen wurden, dann wie immer per STRG+O den Speicherdialog aufrufen, diesen mit Y bestätigen und mit STRG-X den Editor verlassen.

#### Den Dienst fail2ban auf dem Raspberry Pi aktivieren

Nachdem jetzt die Konfiguration für das Bannen von IP-Adressen bei Falschanmeldung per SSH-Verbindung fertig gestellt ist, kann nun die Aktivierung von fail2ban erfolgen.

```sh
# Aktivieren fail2ban

sudo systemctl enable --now fail2ban
```

#### SSHD-Dienst neu starten

Als letztes muss der Dienst SSHD ebenfalls neu gestartet werden, damit fail2ban seiner Aufgabe nachgehen kann. Hierzu gibt ihr diesen Befehl ein:

```sh
sudo systemctl restart sshd
```

## Raspberry Pi absichern | Zusammenfassung

Mit all den vorangegangenen Konfigurationen haben wir den Raspberry Pi für einen sicheren Betrieb gut aufgestellt und haben durch die automatisch durchgeführten Updates tagesaktuell ein sicheres System.

Ich hoffe, ich konnte euch mithilfe von diesem Tutorial ' **Raspberry Pi absichern** ' ein wenig bei eurem vorhaben einen sicheren Raspberry Pi zu betreiben, weiterhelfen.

Sollte euch ein Fehler auffallen oder habt ihr noch Ergänzungen für dieses Anleitung, dann schreibt mir gerne ein Kommentar.

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->