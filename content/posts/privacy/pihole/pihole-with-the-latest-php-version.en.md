---
title: Pihole PHP 8.3 | Pihole always with the latest PHP version
descripton: Pihole PHP 8.3 | Pihole always with the latest PHP version | In this tutorial, I will show you how to install Pihole with the latest PHP version.
hero: /images/posts/pihole/pihole-raspberry-php.png
date: 2024-03-06
menu:
  sidebar:
    name: Pihole always with the latest PHP version
    identifier: pihole-php
    parent: pihole
categories:   
    - "Hardware"
    - "Linux"
    - "Network"
    - "Tutorials"
    - "Video"
tags:   
  - "security"
  - "network"
  - "pi-hole"
  - "tutorials"
  - "video"

---
## Installing Pihole with PHP 8.3 on Raspberry Pi OS
In this tutorial, ‘**Installing Pihole with PHP 8.3**’, I would like to show you how to securely install a Pihole DNS server with the latest version of PHP on your Raspberry Pi in 2024.
### Background to this tutorial
During a test installation of Pihole with Debian 11 on my Raspberry Pi, I noticed during the installation process that the installation routine on the Raspberry Pi OS lite installs PHP 7.4, which has not been provided with security updates since mid-2023 and is therefore EOL (end of life).
Further information on support for individual PHP versions can be found here:
[https://www.php.net/supported-versions.php](https://www.php.net/supported-versions.php)
Therefore, I thought I would create a new and updated tutorial ([my last one was from 2022](https://secure-bits.org/pi-hole-auf-einen-raspberry-pi-installieren/)) so that the PHP installation used is always provided with the latest security updates.
I will also show you how to install and set up a firewall for the Raspberry Pi. And how to automatically update the system with new updates.
## Video on the topic ‘Installing Pihole in 2024’
As usual, I have also published a video tutorial on this topic on my YouTube channel. Feel free to check it out and subscribe.

{{< youtube OwFPGSXQMj0 >}}

## Installing Pihole on a Raspberry Pi
First, here is a list of the requirements we need for the installation:
- **Raspberry Pi with power supply, SD card, and case**
- **SD card reader**
- **SD card with adapter**
- **The ‘Raspberry Pi Imager’ software**
### Installing Raspberry Pi Imager


First, we need to provide our Raspberry Pi with a current Raspberry Pi OS, so the first step is to write the Raspberry Pi OS image to an SD card using the Raspberry Pi Imager.

**[Download Raspberry Pi OS Imager](https://www.raspberrypi.com/software/)**

After downloading the latest Raspberry Pi Imager, you can easily install the application on your system.
The Imager is available for Windows, macOS, Ubuntu, or can be installed on an existing Raspberry Pi OS with the following command.

```bash
# Install Raspberry Pi Imager on Raspberry Pi OS (I have not tested this yet)
sudo apt install rpi-imager
```
### Write Raspberry Pi OS to the SD card
The GIF below shows the configuration of the Raspberry Pi Imager for a Raspberry Pi OS on a Raspberry Pi 3. Always select the Raspberry Pi OS 32-bit lite version for writing to the SD card! This will install a minimal version of the OS, which is sufficient for running Pihole.

> ### A little tip for Raspberry Pi 3B models
>
> **If you want to install Debian 12 “bookworm” with PHP 8.2 included on your Raspberry Pi 3B, please select Raspberry Pi 4 under ‘Raspberry Pi model’. Here you can then select Raspberry OS based on Debian 12. According to Raspberry Pi, Debian 12 is compatible with model 3B, and I can confirm this.**
>
> **When selecting the model, only Debian version 11 “bullseye” is listed under the Raspberry Pi 3B model.**
> ### Please note!
>
> Instead of SSH authentication via password, you should prefer login via key pair. You can also set this up after installation. **For more information, see the article Securing Raspberry Pi from A to Z**.
>
> [**Go to the tutorial Securing Raspberry Pi**](https://secure-bits.org/raspberry-pi-absichern-von-a-z-2023/)

#### After completing the image writing of Raspberry Pi OS
Once the SD card has been written, remove the card and insert it into your Raspberry Pi.
After inserting the network cable into the Raspberry Pi and, in this example, into the Fritzbox, power up the Raspberry Pi.
The Raspberry Pi will now boot up and after a short time, you will be able to see the device in the Fritzbox under Network Connections.

### Connecting to the Raspberry Pi via SSH
To establish a connection with the Raspberry Pi, I am using Microsoft Terminal for the SSH connection in this example. Of course, you can also use Putty or, on macOS and Linux, the familiar terminal.
To establish an SSH connection, we log in to the Raspberry Pi via SSH with the following commands.

```bash
# Command to establish the SSH connection
sudo ssh username@IP address (from the Pi)
# When connecting for the first time, you must accept the fingerprint.
# Confirm this with ‘yes’
```
### Update Raspberry Pi OS
Before we can start installing PHP 8.3, we first need to update the Raspberry OS to the latest version. We do this with the following command.

```bash
# Check Raspberry OS for new packages
sudo apt update
# Update available packages and dependency changes
sudo apt full-upgrade -y
# The installation may take some time!
# After the update is complete, the system must be restarted
sudo reboot
```
> ### Important for PHP installation
>
> It is important that PHP 8.3 is installed before installing Pihole (especially on Debian 11), otherwise PHP 7.4 will be installed with the Pihole installation, which we want to avoid.


### Pihole PHP | Installing PHP 8.3 on the Raspberry OS
Now we can start installing PHP 8.3 on the Raspberry Pi.
To do this, we first need to install a package and add a repository to the sources.list.

```bash
# Install required package
sudo apt -y install lsb-release apt-transport-https ca-certificates
# Install security key for the “Sury repository”
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
```
```bash
# Install the package for PHP 8.3
sudo echo “deb https://packages.sury.org/php/ $(lsb_release -sc) main” | tee /etc/apt/sources.list.d/php.list
# Update available packages
sudo apt update
# Install PHP 8.3
sudo apt install php8.3 -y
```
#### Installing sqlite3 for PHP 8.3
After installing PHP 8.3, we still need to install the additional module sqlite3 so that Pihole will work properly under PHP 8.3 later on.
To install the PHP module ‘sqlite3’ on our Raspberry Pi OS, enter the following command in the Bash:
```bash
# Installation of the PHP module sqlite3 for running Pihole
sudo apt install php8.3-sqlite3
```
#### Follow-up work after installing PHP 8.3 for Pihole
Before we can continue with the installation of Pihole, we first need to get rid of the web server ‘apache2’ that was installed along with it. The reason for this is that Pihole uses the slim web server ‘lightptd’ for the admin web interface, so we do not need the Apache web server, which would also cause errors as it would already occupy port 80.
```bash
# Stop the Apache2 service
sudo systemctl stop apache2
# Uninstall Apache2
sudo apt purge apache2
# After uninstalling, the operating system must be restarted
sudo reboot
```
## Pihole PHP | Installing Pihole with PHP 8.3

> ### Note
>
> I **have described the installation of Pihole on a Raspberry Pi** **in great detail in my other tutorial**. Therefore, I will skip the individual steps here and **refer you to my previous tutorial or to my video on this post** here:
>
> [Installing Pihole on Raspberry Pi’](https://secure-bits.org/pi-hole-auf-einen-raspberry-pi-installieren/#pihole-installieren)

### More videos and tutorials on Pihole
I have published many other posts and videos on the topic of ‘Pihole’ here and on YouTube.
Maybe one or two of them will help you with your Pihole project! Just click on the links!
**[Setting up Pihole](https://secure-bits.org/pi-hole-einrichten-konfigurieren/)**

**[Pihole and Unbound](https://secure-bits.org/pi-hole-unbound-jetzt-richtig-installieren-in-2023/)**

[**Creating a Pihole backup**]()

[**Using Pihole on the go on your smartphone**](https://secure-bits.org/pihole-vpn-mit-pivpn-und-wireguard/)
