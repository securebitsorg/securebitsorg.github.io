---
title: "Raspberry Pi absichern von A-Z | 2023"
date: 2023-02-08
descriton: "Securing Raspberry Pi - In this tutorial, I will show you how to protect your Raspberry Pi from attacks in just a few steps."
hero: /images/posts/pihole/Video-Raspberry-Pi-absichern-von-A-Z.png
menu:
  sidebar:
    name: Secure Raspberry Pi from A - Z
    identifier: secure raspberry pi
    parent: security
categories: 
  - "linux"
  - "netzwerk"
  - "security"
  - "tutorials"
  - "video"
tags: 
  - "firewall"
  - "linux"
  - "netzwerk"
  - "security"
  - "tipps-tutorials"
  - "video"
coverImage: "Video-Raspberry-Pi-absichern-von-A-Z.png"
---

## Securing Raspberry Pi – Operating Raspberry Pi securely

In this new video on my [**YouTube channel**](https://www.youtube.com/channel/UCr-cuwB555JmAm4F412KZ2Q), I show you how you can operate your Raspberry Pi securely with the help of various adjustments and thus protect it from attacks.

We keep reading and hearing about hacking attacks on IoT devices. This is mostly because IoT devices are poorly protected against attacks of any kind.

The Raspberry Pi is often used as the basic platform for IoT applications.

It's not without reason that it's one of the most popular single-board computers and, with its wide range of applications, ensures that this device can be used flexibly for many different IoT scenarios.

Unfortunately, many manufacturers of such products don't take the security of their products very seriously! Although it's easy to secure the Raspberry Pi OS or other Linux variants used.

You can find out how to secure your Raspberry Pi in this video tutorial:

## Video tutorial on securing Raspberry Pi

As this topic is very comprehensive, I have divided the tutorial into several videos. This means that more videos will be added from time to time.

{{< youtube _Xk0bDeitgt0j >}}

Playlist of the video series | Securing/hardening Linux servers

## Commands used in this video

All commands I used in the video tutorial ‘Securing Raspberry Pi’ are listed here in chronological order.

### Prerequisites

The following prerequisites should/must be met so that you can carry out the individual configurations on the Raspberry Pi:

- **User = pi (or replace the listed commands with your username accordingly)**
- **Access via SSH to the Raspberry Pi is possible**
- **SSH client (Putty, Terminal)**

### Step 1 Secure Raspberry Pi | Log in via SSH and update Raspberry Pi OS:

```bash
# Establish SSH connection

ssh pi@IP address of the Pi
```

#### Update Raspberry OS:

```bash
# Update Raspberry Pi OS

sudo apt update && apt upgrade -y
```

### Step 2 Secure Raspberry Pi | Change root user password

Of course, it is highly recommended to secure the default user password with a truly secure password. Even though we will disable the default user ‘pi’ in the next step, I still recommend assigning a secure password here first. It can happen quickly that the default user is reactivated for some reason or that old systems are used (here, the default password was ‘raspberry’), and then it is easy to gain access to the system.

**In my opinion, logging in with a public key is even more secure. I will publish a tutorial on this in the near future and link to it here.**

#### Changing the root user password to a secure password.

It is best to use a password generator from a password manager you trust, such as [**KeePass**](https://keepass.info/download.html) or [**Bitwarden**](https://bitwarden.com/de-DE/), to generate the password and save the generated password in this password manager.

```bash
# Renew password

passwd
```

### Step 3 Secure Raspberry Pi | Change default user Pi

If you did not change the default user ‘pi’ when creating the Raspberry Pi OS with the [**Raspberry Pi Imager**](https://www.raspberrypi.com/software/), then this default user should definitely be replaced with a new user and the user ‘pi’ should be deactivated later on.

#### Install the sudo program

To add a new user to the ‘sudo’ group and thus grant them root privileges, we must first install the ‘sudo’ program .

```bash
# Install the sudo program

apt install sudo
```

#### Create a new user:

```bash
sudo adduser NewUserName

#### Add the new user to the administrators group:

sudo gpasswd -a NewUserName adm


#### Add the new user to the superuser group:


sudo gpasswd -a NewUserName sudo
```

Before deactivating the user ‘pi’, first check that the new user has all the necessary rights!

You will find out how to do this in step 4.

### Step 4 Secure Raspberry Pi | Test the new user account

Before the old standard account ‘pi’ can be deactivated, we first check its rights.

To do this, open a separate terminal instance (terminal window). Log in with the newly created user and check the permissions with the following commands.

#### Check which permissions the newly created user has:

```sh
sudo whoami

# Then enter the assigned user password


# The answer must be ‘root’
```

#### Deactivate the old user account ‘pi’:

After successfully checking the permissions of the new username, the user ‘pi’ can now be deactivated, meaning that it is no longer possible to log in with this username.

```sh
sudo passwd -l pi
```

### Secure SSH access

Securing access via SSH is an absolute must when securing a Linux server!

I have written a detailed tutorial on this topic here on SecureBits:

Learn how to set up secure SSH access to your remote server.

[Linux SSH absichern | SecureBits](https://secure-bits.org/tutorial-linux-ssh-absichern-hardening-in-2024/)

### Step 5 Secure Raspberry Pi | Firewall: Installation and configuration

In this example, we will use the UFW firewall (Uncomplicated Firewall) as an easy-to-use firewall.

In this tutorial, I will only briefly describe the configuration of the UFW firewall using the example of a firewall rule for SSH access.

I have published a detailed tutorial on this topic here on SecureBits, and I have also created several video tutorials on this topic. In these tutorials, you will learn how to configure additional rules for access to the server.

### Securing Raspberry Pi | Blog posts about the UFW firewall:

- [**UFW firewall installation on a Raspberry Pi**](https://secure-bits.org/ufw-firewall-raspberry-pi/)
- [**UFW firewall basics**](https://secure-bits.org/ufw-firewall-grundlagen/)
- [**UFW firewall – Multiple ports, ports and services**](https://secure-bits.org/ufw-firewall-mehrere-ports-portbereiche-und-dienste-freigeben/)
- [**UFW firewall – Creating application profiles**](https://secure-bits.org/ufw-firewall-application-profiles-erstellen-teil-3-uncomplicated-firewall/)

### Securing Raspberry Pi | Video posts on my YouTube channel

- [**UFW firewall installation on a Raspberry Pi**](https://youtu.be/Dh3A1Idktmg)
- [**UFW firewall basics**](https://youtu.be/BumaXOYey1c)
- [**UFW firewall – Opening multiple ports, ports, and services**](https://youtu.be/Gwbq6F1N3xo)
- [**UFW firewall – Creating application profiles**](https://youtu.be/TDKaLgWd12A)

#### Install UFW firewall

The Uncomplicated Firewall is installed by entering the following command:

```sh
sudo apt install ufw
```

#### Create firewall rule for SSH access

After successfully installing the UFW firewall, it is inactive.

**Before the firewall can be activated**, **you must** first **create a firewall rule for SSH access**, otherwise you will no longer have access to the Raspberry Pi via SSH when you activate the firewall!

```sh
sudo ufw allow 22/tcp comment “SSH”
```

#### Further restrict SSH access

You can also further restrict access via SSH connection.

For example, you can restrict access to a specific IP address range:

```sh
sudo ufw allow from <example range=192.168.178.0/24> to any port 22
```

Or you can restrict access to a single IP address (from a computer or a public static IP address):

```sh
sudo ufw allow from <fixed IP address=192.168.178.30> to any port 22
```

Please make sure that you specify the correct IP address range or the correct fixed IP address when assigning addresses. Otherwise, you will lock yourself out!

##### SSH access – limit login attempts for incorrect logins

You can also limit incorrect logins via SSH access using a firewall rule or use the Fail2Ban service, which I will show you how to configure later in this tutorial.

First, I will show you how this works using a UFW firewall rule. The default setting is 6 failed logins within 30 seconds.

```sh
sudo ufw limit 22/tcp
```

#### Enable UFW firewall and display activated rules

Once you have created the rules for the ‘SSH’ service, you can now activate the firewall.

```bash
sudo ufw enable
```

To get an overview of the UFW rules you have created, you can use this command

```bash
sudo ufw status verbose
```

### Step 6 Secure Raspberry Pi – Configure automatic installation of important updates

Almost every day, you can read in the news about hacker attacks on servers on the Internet! This is usually because security vulnerabilities are exploited for attacks, even though security updates have been available for some time, but these updates have not been installed on the system.

With Linux, it is easy to install these security updates automatically, for example every night, and thus close any security gaps in the system. And all this without the administrator having to do anything each time!

#### Installing the service for automatic updates

```bash
sudo apt install unattended-upgrades -y
```

#### Configuring automatic updates

First, we need to configure the ‘unattended-upgrades’ config file and adapt this service to the Raspberry Pi OS.

##### Open the ‘50unattended-upgrades-config’ file with the Nano editor

```bash
sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
```

The following output should be displayed in the Nano editor window:

```bash
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
Unattended-Upgrade::Package-Blacklist {
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
// candidates of related packages to help APT's resolver in finding a solution
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

##### Edit the ‘50unattended-upgrades-config’ file

###### First, we need to replace the following two lines so that updates from the release channel for -Raspberry OS are updated and downloaded.

```bash
#Entfernen der folgenden Zeile:

//      "origin=Debian,codename=${distro_codename},label=Debian";

# Wird ersetzt durch:

"origin=Raspbian,codename=${distro_codename},label=Raspbian";
"origin=Raspberry Pi Foundation,codename=${distro_codename},label=Raspberry Pi Foundation";

# und die '//' werden vor den hinzugefügten sowie von folgenden Zeilen für Security-Updates entfernt:

        "origin=Debian,codename=${distro_codename},label=Debian-Security";
        "origin=Debian,codename=${distro_codename}-security,label=Debian-Security";
```
Once all changes have been made to the config file, you can save the changes using the following key combinations and exit the editor:

**CTRL+O**, confirm with **Y**, and exit the editor with **CTRL+X**.

##### Enable automatic updates

To activate the service and ensure that it runs daily, we need to check the ‘20auto-upgrades’ configuration file and enter the following instructions if it does not exist.

###### Open the ‘20auto-upgrades’ configuration file in the editor

```sh
sudo nano /etc/apt/apt.conf.d/20auto-upgrades
```

Add the following entries

```sh
APT::Periodic::Update-Package-Lists “1”;

APT::Periodic::Unattended-Upgrade “1”;
```

Then save the changes with the above key combinations and exit the editor.

### Step 7 Secure the Raspberry Pi | Disable unnecessary services

To achieve greater security on the system, services that are not required for operation should be disabled. Which services should be disabled here depends, of course, on the application you want to use the Raspberry Pi.

In this example, we will disable the WiFi service.

#### Display active services on the Raspberry Pi

With the following command, you can display all active services on the Raspberry Pi OS and then look for services that are not required for the operation of your Raspberry Pi server.

```sh
systemctl --type=service --state=active
```

Example output of the command ‘systemctl --type=service --state=active’

```init
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
  systemd-logind.service                                      loaded active running User Login Management
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

#### Disable Raspberry Pi WiFi service

To disable the WiFi service ‘wpa_supplicant’, enter the following command in the terminal window:

```sh
sudo systemctl disable --now wpa_supplicant.service
```

### Secure Raspberry Pi | Allow SSH access only for a specific user

We also have the option of restricting SSH access to one or more users. To do this, we edit the ‘sshd_config file’ to specify the user or users.

##### Open and edit the ‘sshd_config file’

```sh
sudo nano /etc/ssh/sshd_config
```

Now add the following entry to the editor:

```sh
AllowUsers <username you want to allow>

# You can allow multiple users as follows:

AllowUsers user1 user2
```

Then save the changes in the editor with CTRL+O and Y and close the editor with CTRL+X.

##### Restart the SSH service

After changing the ‘sshd_config’ file, the SSH service must be restarted to apply the changes.

```sh
sudo systemctl restart ssh
```

### Secure Raspberry Pi | Defend against brute force attacks with Fail2Ban

Especially for devices connected to the Internet (web services, smart home, etc.) it is highly advisable to protect the device against brute force attacks.

The ‘fail2ban’ application has proven very effective for this purpose. This application is ideal for monitoring login attempts and banning the accessing IP address after too many failed login attempts.

In my example, we will monitor logins to the SSH server. Of course, you can also use fail2ban for other access points such as sftp, https, and many other services.

#### Installing fail2ban on a Raspberry Pi

```sh
sudo apt install fail2ban -y
```

To edit/create the configuration file ‘jail.local’ in the Nano editor, execute the following command:

```sh
sudo nano /etc/fail2ban/jail.local
```

To ban invalid login attempts via SSH connection, create the following entries in the editor window

> **Access Denied**
>
> ### Debian 12 und fail2ban**
>
> Starting with Debian version 12, the log file **/var/log/auth.log** is no longer supported by the OS, as Debian 12 uses Journald for logging. Therefore, I have entered **‘systemd’** as the backend in **jail.local**.

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
Once the entries have been made, call up the save dialog as usual with CTRL+O, confirm with Y and exit the editor with CTRL-X.

#### Activate the fail2ban service on the Raspberry Pi

Now that the configuration for banning IP addresses in the event of incorrect login via SSH connection is complete, fail2ban can be activated.

```sh
# Activate fail2ban

sudo systemctl enable --now fail2ban
```

#### Restart the SSHD service

Finally, the SSHD service must also be restarted so that fail2ban can perform its task. To do this, enter the following command:

```sh
sudo systemctl restart sshd
```

## Securing the Raspberry Pi | Summary

With all the previous configurations, we have set up the Raspberry Pi for secure operation and have a secure system that is updated daily thanks to the automatic updates.

I hope this tutorial on ‘Securing Raspberry Pi’ has helped you a little with your plans to run a secure Raspberry Pi.

If you notice any errors or have any additions to this guide, please feel free to leave me a comment.
