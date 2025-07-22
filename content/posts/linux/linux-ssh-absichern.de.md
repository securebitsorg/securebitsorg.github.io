---
title: Linux SSH-Zugang absichern
date: 2025-07-05
descripton: Tutorial | Jetzt Linux SSH absichern / hardening | In diesem Tutorial zeige ich euch, wie ihr einen SSH-Zugang richtig und vor allem sicher absichert.
hero: /images/posts/linux-ssh/SSH-absichern.png
menu:
  sidebar:
    name: Linux SSH-Zugang absichern
    identifier: linux-ssh
    parent: linux
tags: ["linux", "security", "video", "debian"]
categories: ["Tutorials", "Linux", "Video", "Security"]

---
## Linux SSH Zugang richtig absichern

Das A und O wenn ihr einen Linux-Server betreibt, ist es meistens für die Administration erforderlich, einen sichereren Zugang via SSH zu etablieren.

Dieses Tutorial soll euch helfen, den Linux SSH Zugriff erfolgreich gegen Angriffe zu schützen.

Natürlich ist das Absichern des SSH-Zugangs nur ein Modul, um euren Server vor Angriffe zu schützen. Weitere Möglichkeiten findet ihr im Tutorial „Raspberry Pi absichern von A-Z“ welches ich hier im Blog veröffentlicht habe.

## Video-Tutorial zum Thema ‚Linux SSH absichern‘

{{< youtube iCPRIR6FDW0 >}}

### Weitere Videos zum Thema Linux Server absichern

Dieses Tutorial ist ein Bestandteil einer Video-Serie rund um das Thema ‚Linux Server absichern‘.

Gerne könnt ihr auch auf YouTube die vollständige Playlist zum Thema anschauen. Hier werden regelmäßig immer neue Videos zur Thematik hinzugefügt.

**Zur Playlist** <https://www.youtube.com/playlist?list=PLknVEQKqt1ln-5HL8aG_Xk0bDeitgt0j>_

## HowTo – Linux SSH-Zugang richtig absichern

SSH ist ein beliebtes Protokoll, um sich auf entfernten Servern anzumelden und Befehle auszuführen. Doch wie kann man sicherstellen, dass nur berechtigte Personen Zugriff auf den SSH-Dienst haben? In diesem Tutorial möchte ich euch einige Tipps und Tricks vorstellen, wie man seinen SSH-Zugang richtig absichern kann.

### Schritt 1 Linux SSH absichern – Standard-Port des SSH-Diensts ändern

Die meistens Angriffe auf den SSH-Port (Port 22) finden automatisiert statt. Daher kann entsprechend einer Port-Änderung des SSH-Ports diese Angriffsmethode ein wenig erschwert werden. Daher zeige ich euch, wie ihr entsprechend den Standard-SSH-Port ändern könnt.

Um den Standard-SSH-Port ändern zu können, ist es erforderlich diesen in der Config-Datei des SSH-Dienstes abzuändern.

Hierzu öffnet ihr wie in diesem Beispiel mit dem Editor ‚Nano‘ die Konfigurationsdatei die sich auf dem Pfad ‚/etc/ssh/sshd_config‚ befindet.

---
> **WICHTIG! Firewall-Regeln anpassen!**
>
> Solltet ihr schon Firewall-Regeln auf eurem Server aktiviert haben, müsst ihr diese entsprechend eurem gewählten Port um diese Regel ergänzen! Ansonsten sperrt ihr euch aus und **habt keinen Zugriff** mehr via SSH!
---

```bash
# Öffnen der SSH-Config-Datei
sudo nano /etc/ssh/sshd_config
```

Nachdem aufrufen des oben genannten Befehls, sollte sich ein Editor-Fenster mit folgendem Inhalt öffnen:

{{< figure
  src="/images/posts/linux-ssh/sshd_config.png"
  alt="Linux Datei sshd_config"
  caption="Linux Datei sshd_config"
>}}

In der Zeile **'#Port 22‘** entfernt ihr das #-Zeichen (dadurch wird die Funktion / Ziele aktiviert) und ersetzt die Standard-Portnummer durch eure gewählte Portnummer. In diesem Fall ist es **Port 2223**. Jetzt noch die Änderung mit der Tastenkombination **'STRG+O'** speichern und den Editor mit **'STRG+X'** verlassen.

Damit die Änderungen übernommen werden, muss der **SSH-Service neu gestartet** werden.

```bash
# SSH-Service neustarten

sudo systemctl restart ssh

# Status und Port des SSH-Service überprüfen

sudo systemctl status ssh

# Hier muss jetzt erscheinen, dass der Service 'enabled' ist und weiter unten in der Ausgabe wird dann der Listening-Port angegeben
```

### Überprüfung der Möglichkeit einer SSH-Anmeldung auf dem neuen Port

Hierzu öffnet ihr ein neues Terminalfenster und meldet euch per SSH unter Angabe des neuen Ports auf dem Server an.

```bash
# Anmeldung SSH mit Portangabe
ssh root@IP-Adresse -p 2223 
# Der Port sowie die IP-Adresse müssen durch eure entsprechenden und gewählten Angaben ergänzt werden.
```

---
> **Geänderter SSH-Port nicht erreichbar**
>
> Sollte die SSH-Port-Änderung nicht funktionieren, also der SSH-Zugang ist über den neuen Port nicht erreichbar, dann bitte die folgenden Befehle eingeben.
> Dieser Fehler kann beispielsweise bei einem Debian-Proxmox-Container auftauchen. Hier wird bei der Änderung des Ports in der sshd_config nicht automatisch übernommen und der Zugriff über den Standard-Port 22 ist immer noch möglich.
>
> ```bash
> systemctl  disable  ssh.socket
> systemctl  stop  ssh.socket
> reboot
> ```
>
---

**Eine Liste der standardisierten sowie dynamischen Ports findet ihr zum Beispiel hier im entsprechenden Wikipedia-Post:**

<https://de.wikipedia.org/wiki/Liste_der_standardisierten_Ports>

### Schritt 2 Linux SSH absichern – SSH-Schlüsselpaar erzeugen

---
> :warning:
> **WICHTIGER HINWEIS!**
>
> Vorab sei erwähnt, dass ihr nur die beiden Methoden RSA 4096 bit (ab 3072 bit oder höher) sowie Ed25519 zur Schlüsselerzeugung nutzen solltet. Ich persönlich nutze immer Ed25519 (basierend auf einer elliptischen Kurve) zusammen mit einem extra Passphrase (zusätzliches Passwort) als zweiten Faktor und würde es auch so empfehlen.
---

#### SSH-Schlüsselpaar unter Linux und macOS erzeugen

Öffne ein Terminalfenster und gebe hier den folgenden Befehl ein um eine Schlüsseldatei mittels Ed25519 mit zusätzlichem Passwort sowie mit zusätzlichem Schutz vor Brute Force-Attacken zu erstellen und zu schützen.

---

```bash
# Erstellen eines Schlüsselpaars basierend auf Ed25519 + Passwort und Brute-Force-Schutz
ssh-keygen -o -a 100 -t ed25519
# Ausgabe:
Generating public/private ed25519 key pair.
Enter file in which to save the key (/root/.ssh/id_ed25519):
Enter passphrase (empty for no passphrase): (hier euer gewünschtes Passwort vergeben)
Enter same passphrase again: (hier das Passwort wiederholen)

# Dann wird das Schlüsselpaar erzeugt, und ist über den Pfad '/root/.ssh/id_ed25519' für den privaten Schlüssel, sowie den public_key unter '/root/.ssh/id_ed25519.pub', zu finden. 
```

---
> :warning: **WICHTIGER HINWEIS!**
>
> Der Schlüssel mit der Endung id_ed25519 ist der private Schlüssel und darf niemals herausgegeben werden!
>
>Den privaten Schlüssel bitte sicher aufbewahren und zum Beispiel im Passwort-Manager ‚Bitwarden‘ ablegen, oder auf einen verschlüsselten USB-Stick abspeichern und sicher aufbewahren. Ohne diesen privaten Schlüssel habt ihr bei Verlust, keinen Zugriff mehr auf euren Server!
>
>Zum Exportieren ist nur die Schlüsseldatei mit der **Endung .pub** zu verwenden!!!
---

#### SSH-Schlüsselpaar unter Windows erzeugen

Ab Windows 10 in Version 1809, ist ein SSH-Client standardmäßig installiert und ihr könnt somit gleich mit der Schlüsselerzeugung loslegen.

Hierzu gibt ihr in der **PowerShell** oder auch im **Microsoft Terminal** (welches ich auch immer in den Videos nutze), mit Administrationsrechte, den folgenden Befehl in der Kommandozeile ein:

```bash
# Erstellen eines Schlüsselpaars basierend auf Ed25519 + Passwort und Brute-Force-Schutz unter Windows
ssh-keygen -o -a 100 -t ed25519
# Ausgabe:
Enter passphrase (empty for no passphrase): <hier euer sicheres Passwort eingeben>
Enter same passphrase again: <Passwort bestätigen>
Your identification has been saved in C:Usersusername/.ssh/id_ed25519. <username = Ersetzen durch euren Benutzername>
Your public key has been saved in C:Usersusername/.ssh/id_ed25519.pub. <username = Ersetzen durch euren Benutzername>
The key fingerprint is:
Beispiel: SHA256:OIzc1yE7joL2Bzy8!gS0j8eGK7bYaH1FmF3sDuMeSj8 username@LOCAL-HOSTNAME
```

### Schritt 3 Linux SSH absichern – SSH-Public_key auf den Remote-Server kopieren

Damit in Zukunft eine Anmeldung auf dem Linux-Server mit einem Schlüsselpaar möglich ist, muss der public_key auf dem Remote-Server zunächst kopiert / mitgeteilt werden.

Gespeichert wird dieser public_key bei dem anzumeldenden Nutzer in der Datei ‚.ssh/authorized_keys‘. Diese findet ihr im Wurzelverzeichnis ‚cd .ssh‘.

> Sollte das Verzeichnis ‚.ssh/‘ nicht vorhanden sein, dann bitte auf dem Remote-Server mit dem folgenden Befehl anlegen:

`mkdir .ssh/`
>
> Voraussetzung um den Public_Key auf den Remote-Server zu installieren ist es, dass ihr berechtigt seid, dass ihr euch mit Benutzername und Passwort auf dem Remote-Server anmelden könnt!
**public_key in die Datei ‚.ssh/authorized_keys‘ kopieren unter Windows-Powershell / Microsoft Terminal**

Um den Kopiervorgang des public_key auf den Remote-Server zu starten, gibt ihr bittags: ["Linux"]
categories: ["Tutorials"]te den folgenden Befehl ein:

```bash
# Key via Powershell auf einen Remote-Server kopieren
type $env:USERPROFILE.sshid_ed25519.pub | ssh remoteuser@IP-AdresseRemote-Server "cat >> .ssh/authorized_keys"
# Der <remoteuser> wird durch den User auf dem Remote-Server ersetzt, mit dem ihr euch dort Anmelden wollt
# Die <IP-AdresseRemote-Server> wird durch die IP-Adresse von eurem Remote-Server ersetzt
```

**public_key in die Datei ‚.ssh/authorized_keys‘ kopieren unter Linux / macOS**

> **TIPP!**
>
> Voraussetzung um den Public_Key auf den Remote-Server zu installieren ist es, dass ihr berechtigt seid, dass ihr euch mit Benutzername und Passwort auf dem Remote-Server anmelden könnt!

Um unter Linux und macOS (basiert ja auch auf ein Unix-System) den public_key auf den Remote-Server zu kopieren, öffnet ihr ein Terminalfenster und gibt den folgernden Befehl ein:

```bash
# Das Attribut -p gibt den SSH-Port des Remote Server an
ssh-copy-id -i .ssh/id_ed25519.pub -p 2223 remoteuser@IP-AdresseRemote-Server
```

#### Überprüfung der authorized_keys auf dem Remote-Server

Zu guter Letzt, müssen wir unbedingt die Datei ‚authorized_keys‘ auf dem Remote-Server überprüfen, ob hier auch wirklich der öffentliche Schlüssel als Eintrag hinzugefügt wurde!

Dazu meldet ihr euch per Benutzer + Passwort auf dem Remote-Server an und ruft den Inhalt der Datei ‚authorized_keys‘ mit folgendem Befehl auf:

```bash
# Inhalt der Datei 'authorized_keys' anzeigen
nano .ssh/authorized_keys
# Ausgabe:
Die Ausgabe des Editor-Fenster sollte wie folgt aussehen beziehungsweise beginnen:
ssh-ed25519 AAAAC3N........
```

### Schritt 4 Linux SSH absichern – SSH-Anmeldung via SSH-Schlüssel aktivieren

Nachdem der Public_Key auf dem Remote-Server erfolgreich kopiert sowie überprüft wurde, können wir jetzt die Anmeldemethode via Schlüsselpaar auf diesem Server aktivieren.

Hierzu werden wir die Config-Datei ’sshd_config‘ entsprechend anpassen.

```bash
# Anpassen der SSH-Config-Datei auf dem Remote-Server
# Öffnen der sshd-config
sudo nano /etc/ssh/sshd_config
# Nun im Editor-Fenster die folgende Zeile auf 'Yes' setzen und da #-Zeichen entfernen
PubkeyAuthentication yes
# Des Weiteren muss noch überprüft werden, ob der richtige Pfad zu der Datei 'authorized_keys' angeben und auch aktiviert ist
# Hierfür muss die Zeile für diese Datei wie folgt aussehen sowie das Zeichen '#' entfernt sein:
AuthorizedKeysFile      .ssh/authorized_keys
# Dann die Datei mit 'STRG+O' die Eingaben speichern und mit 'STRG+X' das Editor-Fenster verlassen.
```

Nach diesen Veränderungen an der ’sshd_config‘ muss noch der SSH-Dienst neu gestartet werden:

```bash
# SSH-Service neu starten, um die Änderungen zu übernehmen
sudo systemctl restart ssh
# Bei Red-Had-basierenden Distributionen wie CentOS, Fedora, Rocky Linux usw. ist der Service 'sshd' neu zu starten
sudo service sshd restart
```

### Schritt 5 Linux SSH absichern – SSH-Anmeldung mit Schlüsselpaar überprüfen

Um jetzt den SSH-Zugang via SSH-Schlüssel zu überprüfen, melden wir uns an dem Remote-Server genauso wie gewohnt an:

```bash
# Anmeldung via SSH-Schlüssel an den Remote-Server
ssh benutzer@IP-AdresseRemoteServer
# Solltet ihr euch zum ersten Mal mit diesem Benutzer am Remote-Server anmelden, erhaltet ihr die folgende Abfrage:
The authenticity of host 'IP-Adresse des Remote-Server' can't be established.
ED25519 key fingerprint is SHA256:ElsjpajVayeK.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])?
# Hier müsst ihr dann mit 'yes' bestätigen und dann den Passphrase (euer Passwort zum oben erstellten SSH-Schlüssel) eingeben
Enter passphrase for key 'C:Usersmarcel/.ssh/id_ed25519': <Passwort für den SSH-Schlüssel eingeben>

# Nun solltet ihr mit dem Remote-Server verbunden sein
```

---

### Schritt 6 Linux SSH absichern – Linux SSH absichern durch Deaktivieren der Anmeldung durch Passwort
>
> **ACHTUNG!**
>
>Diesen Schritt nur durchführen, wenn die Anmeldung via SSH-Schlüssel funktioniert hat und ihr einen weiteren Benutzer mit erhöhten Rechten wie im Beitrag ‚Raspberry Pi absichern von A -Z‚ angelegt habt!
>
> **Ansonsten sperrt ihr euch vom Server aus!**
---

Nach erfolgreicher Anmeldung mit dem SSH-Schlüssel können wir nun endlich die unsichere Anmeldung mittels Passworts beim Remote-Server deaktivieren.

Dazu müssen wir wieder eine Anpassung an der ’sshd_config‘ vornehmen und auch gleichzeitig wie im nächsten Abschnitt beschrieben, die Anmeldung als ‚root-user‘ deaktivieren.

```bash
# SSH-Anmeldung mittels Passworts am Remote-Server deaktivieren
sudo nano /etc/ssh/sshd_config # sshd_config-Datei zum Bearbeiten öffnen
# Die folgende Zeile '#PasswordAuthentication yes' in 'PasswordAuthentication no' abändern
# Und mit 'STRG+O' speichern und mit 'Strg+X' den Editor verlassen
# SSH-Dienst neu Starten
sudo systemctl restart ssh
```

**Natürlich könnt ihr die Änderungen vom nächsten Absatz in diesem Tutorial gleich mit ändern, aber zur Verständlichkeit werde ich extra alle Schritte einzeln durchführen!**

### Schritt 7 Linux SSH absichern – Anmeldung als Root-User via SSH deaktivieren

Ein wirklich wichtiger Sicherheitsaspekt bei der Absicherung des SSH-Zugangs ist es, dass der volle root-Zugang via SSH-Zugang deaktiviert wird! Dieses gilt nicht nur für die Anmeldung via SSH-Schlüssel auf dem Remote-Server wie wir es in diesem Tutorial gelernt haben, sondern sollte immer in der ’sshd_config-Datei‘ deaktiviert werden.

Ein fremder Nutzer der sich mit zum Beispiel gestohlenen Anmeldedaten auf eurem Server via SSH anmelden kann und dann gleich alles Privilegien für Änderungen hat, ist der absolute Alptraum!

Um diesen Alptraum zu vermeiden, öffnen wir wieder die Konfigurationsdatei für den SSH-Dienst und passen diese wie folgt an:

```bash
# Anmeldung als Root-User via SSH-Verbindung deaktivieren
sudo nano /etc/ssh/sshd_config
# Im Editor-Fenster nun die Zeile '#PermitRootLogin' in 'PermitRootLogin no' ändern
# Dann wieder die Änderungen speichern und den SSH-Dienst neustarten
sudo systemctl restart ssh
```

### Schritt 8 Linux SSH absichern – Neueste Protokolle zur Authentifizierung erzwingen

Ein weiterer Schritt um die Sicherheit der SSH-Anmeldung zu erhöhen ist es, die Erzwingung der Nutzung der neuesten Protokolle (SSH-Protocol-Version 2) zur Anmeldung zu nutzen.

Hierfür muss natürlich wieder die SSH-Config-Datei angepasst werden und der SSH-Dienst neu gestartet werden.

```bash
# Folgende Einträge sollten in der SSH-Config-Datei noch hinzugefügt bzw. angepasst werden.
ChallengeResponseAuthentication no
# und
UsePAM no
# Dann wieder den SSH-Dienst neu starten
sudo systemctl restart ssh
```

---

## Fazit – Linux SSH absichern

Wir haben in diesem Tutorial gelernt, wie wir den SSH-Zugang zu einem Linux-Server effektiv und nach neustem Stand der Technik vor Angriffe schützen können.

Ich kann nur jedem ans Herz legen, alle SSH-Zugänge (auch im internen Netzwerk) so abzusichern! Weiterhin habt ihr noch die Möglichkeit Brute Force-Attacken auf den SSH-Service mit zum Beispiel ‚Fail2ban‘ zu schützen. Wie das funktioniert, habe ich euch ja schon in dem Tutorial ‚Raspberry Pi absichern von A-Z | 2023‚ (funktioniert bei allen debian-basierten Systemen) gezeigt und habe auf eine Wiederholung in diesem Tutorial darauf verzichtet.

Wichtig ist noch zu erwähnen, dass diese in diesem Tutorial behandelte Methode nur eine Möglichkeit widerspiegelt, einen Linux-Server richtig abzusichern. Also nur ein Baustein in der IT-Sicherheit ist!

Sollte euch dieses Tutorial ein wenig gefallen haben, so würde ich mich über ein Abo von meinem YouTube-Kanal sehr freuen!
