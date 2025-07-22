---
title: Secure Linux SSH
date: 2025-02-18
descripton: Tutorial | Secure Linux SSH now / hardening | In this tutorial, I will show you how to secure SSH access correctly and, above all, securely.
hero: /images/posts/linux-ssh/SSH-absichern.png
menu:
  sidebar:
    name: Secure Linux SSH
    identifier: linux-ssh
    parent: linux
    weight: 10
tags: ["linux", "security", "video", "debian"]
categories: ["Tutorials", "Linux", "Video", "Security"]
---
## Securing Linux SSH access correctly

When operating a Linux server, it is usually necessary for administration purposes to establish secure access via SSH.

This tutorial is designed to help you successfully protect Linux SSH access against attacks.

Of course, securing SSH access is only one way of protecting your server against attacks. You can find more options in the tutorial “Securing Raspberry Pi from A to Z” that I published here in the blog.

## Video tutorial on the topic of “Securing Linux SSH”

{{< youtube iCPRIR6FDW0 >}}

### More videos on the topic of securing Linux servers

This tutorial is part of a video series on the topic of “Securing Linux servers.”

You are also welcome to watch the complete playlist on the topic on YouTube. New videos on the topic are added here regularly.

**To the playlist** https://www.youtube.com/playlist?list=PLknVEQKqt1ln-5HL8aG_Xk0bDeitgt0j_

## HowTo – Securing Linux SSH access correctly

SSH is a popular protocol for logging into remote servers and executing commands. But how can you ensure that only authorized persons have access to the SSH service? In this tutorial, I would like to share some tips and tricks on how to properly secure your SSH access.

### Step 1 Secure Linux SSH – Change the default port of the SSH service

Most attacks on the SSH port (port 22) are automated. Therefore, changing the SSH port can make this method of attack a little more difficult. I will show you how to change the default SSH port.

To change the default SSH port, you need to modify it in the SSH service's configuration file.

To do this, open the configuration file located at ‘/etc/ssh/sshd_config’ with the ‘Nano’ editor, as shown in this example.

---

> **IMPORTANT! Adjust firewall rules!**
>
> If you have already activated firewall rules on your server, you must add this rule to your selected port! Otherwise, you will lock yourself out and **no longer have access** via SSH!
---

```bash
# Open the SSH config file
sudo nano /etc/ssh/sshd_config
```
After calling up the above command, an editor window should open with the following content:

{{< figure
  src="/images/posts/linux-ssh/sshd_config.png"
  alt="Linux file sshd_config"
  caption="Linux file sshd_config"
>}}

In the line **‘#Port 22’**, remove the # sign (this activates the function/destinations) and replace the default port number with your chosen port number. In this case, it is **Port 2223**. Now save the change with the key combination **‘CTRL+O’** and exit the editor with **‘CTRL+X’**.

The **SSH service must be restarted** for the changes to take effect.

```bash
# Restart SSH service

sudo systemctl restart ssh

# Check status and port of SSH service

sudo systemctl status ssh

# It should now show that the service is ‘enabled’ and the listening port is specified further down in the output.
```
### Checking the possibility of an SSH login on the new port

To do this, open a new terminal window and log in to the server via SSH, specifying the new port.

```bash
# Login SSH with port specification
ssh root@IP address -p 2223 
# The port and IP address must be supplemented with your corresponding and selected information.
```
---
> **Changed SSH port not accessible**
> 
> If the SSH port change does not work, i.e., SSH access is not accessible via the new port, please enter the following commands.
> This error can occur, for example, with a Debian Proxmox container. Here, the port change in sshd_config is not automatically applied and access via the standard port 22 is still possible.
> ```bash
> systemctl  disable  ssh.socket
> systemctl  stop  ssh.socket
> reboot
> ```
---

**A list of standardized and dynamic ports can be found, for example, here in the corresponding Wikipedia post:**

https://de.wikipedia.org/wiki/Liste_der_standardisierten_Ports

### Step 2 Secure Linux SSH – Generate SSH key pair

---
> :warning:
> **IMPORTANT NOTE!**
> 
> First of all, please note that you should only use the two methods RSA 4096 bit (3072 bit or higher) and Ed25519 for key generation. I personally always use Ed25519 (based on an elliptic curve) together with an extra passphrase (additional password) as a second factor and would recommend doing the same.
---
#### Generate SSH key pair on Linux and macOS

Open a terminal window and enter the following command to create and protect a key file using Ed25519 with an additional password and additional protection against brute force attacks.

---
```bash
# Create a key pair based on Ed25519 + password and brute force protection
ssh-keygen -o -a 100 -t ed25519
# Output:
Generating public/private ed25519 key pair.
Enter file in which to save the key (/root/.ssh/id_ed25519):
Enter passphrase (empty for no passphrase): (enter your desired password here)
Enter same passphrase again: (repeat the password here)

# The key pair is then generated and can be found via the path ‘/root/.ssh/id_ed25519’ for the private key and ‘/root/.ssh/id_ed25519.pub’ for the public key. 
```
---
> :warning: **IMPORTANT NOTE!**
>
> The key with the extension id_ed25519 is the private key and must never be disclosed!
>
>Please keep the private key safe and store it in the password manager ‘Bitwarden’, for example, or save it to an encrypted USB stick and keep it safe. Without this private key, you will no longer have access to your server if it is lost!
>
>Only the key file with the **extension .pub** should be used for exporting!!!
---
#### Generating an SSH key pair in Windows

Starting with Windows 10 version 1809, an SSH client is installed by default, so you can start generating keys right away.

To do this, enter the following command in the command line in **PowerShell** or **Microsoft Terminal** (which I always use in the videos) with administrator rights:

```bash
# Create a key pair based on Ed25519 + password and brute force protection on Windows
ssh-keygen -o -a 100 -t ed25519
# Output:
Enter passphrase (empty for no passphrase): <enter your secure password here>
Enter same passphrase again: <confirm password>
Your identification has been saved in C:Usersusername/.ssh/id_ed25519. <username = replace with your username>
Your public key has been saved in C:Usersusername/.ssh/id_ed25519.pub. <username = replace with your username>
The key fingerprint is:
Example: SHA256:OIzc1yE7joL2Bzy8!gS0j8eGK7bYaH1FmF3sDuMeSj8 username@LOCAL-HOSTNAME
```

### Step 3 Secure Linux SSH – Copy SSH public key to remote server

In order to be able to log in to the Linux server with a key pair in the future, the public key must first be copied/communicated to the remote server.

This public key is stored for the user logging in in the file ‘.ssh/authorized_keys’. You can find this in the root directory ‘cd .ssh’.

> If the directory ‘.ssh/’ does not exist, please create it on the remote server with the following command:

`mkdir .ssh/`
>
> To install the public key on the remote server, you must be authorized to log in to the remote server with your username and password!
Copy the public key to the file ‘.ssh/authorized_keys’ in Windows PowerShell / Microsoft Terminal

To start copying the public key to the remote server, please enter the following command:
```bash
# Copy key to a remote server via Powershell
type $env:USERPROFILE.sshid_ed25519.pub | ssh remoteuser@IP-addressRemote-Server “cat >> .ssh/authorized_keys”
# Replace <remoteuser> with the user on the remote server you want to log in to.
# Replace <IP address of remote server> with the IP address of your remote server.
```
**Copy the public_key to the file ‘.ssh/authorized_keys’ on Linux / macOS**

> **TIP!**
> 
> In order to install the public_key on the remote server, you must be authorized to log in to the remote server with your username and password!

To copy the public_key to the remote server under Linux and macOS (which is also based on a Unix system), open a terminal window and enter the following command:
```bash
# The attribute -p specifies the SSH port of the remote server.
ssh-copy-id -i .ssh/id_ed25519.pub -p 2223 remoteuser@IP-addressRemote-server
```
#### Checking the authorized_keys on the remote server

Last but not least, we must check the ‘authorized_keys’ file on the remote server to make sure that the public key has actually been added as an entry!

To do this, log in to the remote server with your username and password and call up the contents of the ‘authorized_keys’ file with the following command:
```bash
# Display the contents of the ‘authorized_keys’ file
nano .ssh/authorized_keys
# Output:
The output of the editor window should look like this or start like this:
ssh-ed25519 AAAAC3N........
```
### Step 4 Secure Linux SSH – Enable SSH login via SSH key

Once the public key has been successfully copied to the remote server and verified, we can now enable the login method via key pair on this server.

To do this, we will modify the config file ‘sshd_config’ accordingly.
```bash
# Adjust the SSH configuration file on the remote server
# Open sshd-config
sudo nano /etc/ssh/sshd_config
# Now set the following line to ‘Yes’ in the editor window and remove the # sign
PubkeyAuthentication yes
# Furthermore, you must check whether the correct path to the file ‘authorized_keys’ is specified and also activated.
# To do this, the line for this file must look as follows and the ‘#’ character must be removed:
AuthorizedKeysFile      .ssh/authorized_keys
# Then save the file with ‘CTRL+O’ and exit the editor window with ‘CTRL+X’.
```
After making these changes to ‘sshd_config’, the SSH service must be restarted:
```bash
# Restart the SSH service to apply the changes
sudo systemctl restart ssh
# For Red Hat-based distributions such as CentOS, Fedora, Rocky Linux, etc., restart the ‘sshd’ service.
sudo service sshd restart
```
### Step 5 Secure Linux SSH – Verify SSH login with key pair

To verify SSH access via SSH key, log in to the remote server as usual:
```bash
# Log in to the ### Schritt 7 Linux SSH absichern – Anmeldung als Root-User via SSH deaktivieren

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
remote server via SSH key
ssh user@IP addressRemoteServer
# If you are logging in to the remote server with this user for the first time, you will receive the following query:
The authenticity of host ‘IP address of remote server’ can't be established.
ED25519 key fingerprint is SHA256:ElsjpajVayeK.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])?
# Here you must confirm with ‘yes’ and then enter the passphrase (your password for the SSH key created above)
Enter passphrase for key ‘C:Usersmarcel/.ssh/id_ed25519’: <Enter password for the SSH key>

# You should now be connected to the remote server
```
---
### Step 6 Secure Linux SSH – Secure Linux SSH by disabling password login
> **ATTENTION!**
>
>Only perform this step if the login via SSH key worked and you have created another user with elevated privileges as described in the article ‘Securing Raspberry Pi from A to Z’!
>
> **Otherwise, you will lock yourself out of the server!**
---

After successfully logging in with the SSH key, we can now finally disable the insecure password login to the remote server.

To do this, we need to make another adjustment to the ‘sshd_config’ file and, at the same time, disable the ‘root user’ login as described in the next section.
```bash
# Disable SSH login using passwords on the remote server
sudo nano /etc/ssh/sshd_config # Open the sshd_config file for editing
# Change the following line ‘#PasswordAuthentication yes’ to ‘PasswordAuthentication no’
# Save with ‘CTRL+O’ and exit the editor with 'CTRL+X'
# Restart the SSH service
sudo systemctl restart ssh
```
**Of course, you can make the changes from the next paragraph in this tutorial at the same time, but for clarity, I will perform all steps individually!**

### Step 7 Secure Linux SSH – Disable root user login via SSH

A really important security aspect when securing SSH access is to disable full root access via SSH! This applies not only to logging in via SSH key on the remote server, as we learned in this tutorial, but should always be disabled in the ‘sshd_config file’.

An unknown user who can log in to your server via SSH with stolen login credentials, for example, and then immediately has full privileges to make changes is an absolute nightmare!

To avoid this nightmare, we open the configuration file for the SSH service again and adjust it as follows:
```bash
# Disable login as root user via SSH connection
sudo nano /etc/ssh/sshd_config
# In the editor window, change the line ‘#PermitRootLogin’ to 'PermitRootLogin no'
# Then save the changes again and restart the SSH service
sudo systemctl restart ssh
```
### Step 8 Secure Linux SSH – Enforce the latest authentication protocols

Another step to increase the security of SSH login is to enforce the use of the latest protocols (SSH Protocol Version 2) for login.

To do this, you must again modify the SSH config file and restart the SSH service.
```bash
# The following entries should be added or modified in the SSH config file.
ChallengeResponseAuthentication no
# and
UsePAM no
# Then restart the SSH service again.
sudo systemctl restart ssh
```
---

## Conclusion – Securing Linux SSH

In this tutorial, we learned how to effectively protect SSH access to a Linux server from attacks using the latest technology.

I highly recommend securing all SSH access (including on the internal network) in this way! You also have the option of protecting the SSH service against brute force attacks with, for example, ‘Fail2ban’. I have already shown you how this works in the tutorial ‘Securing Raspberry Pi from A to Z | 2023’ (works on all Debian-based systems) and have refrained from repeating it in this tutorial.

It is important to mention that the method covered in this tutorial is only one way to properly secure a Linux server. It is only one component of IT security!

If you enjoyed this tutorial, I would be very happy if you subscribed to my YouTube channel! 