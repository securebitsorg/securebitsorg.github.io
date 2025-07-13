---
title: “Update AdGuard Home manually”
description: “Update AdGuard Home manually | In this tutorial, I will show you how to update AdGuard Home manually.”
hero: “/images/posts/adguard/Thumbnail-AdGuard-Home-Update.png”
description:
date: 2022-11-21
menu:
  sidebar:
    name: Manually update AdGuard Home
    identifier: adguard-home-manual-update
    parent: adguard
categories:
- “linux”
- “network”
- “security”
- “tutorials”
- “video”
tags:
- “adguard”
- “linux”
- “network”
- ‘security’
- “video”
---
## If the automatic AdGuard Home update fails
In this post, ‘**Update AdGuard Home manually**’, and the accompanying video tutorial, I will show you how to perform a manual update on an AdGuard Home instance.
### Why update AdGuard Home manually?
Some AdGuard Home updates fail to update automatically, for example, version “**AdGuard Home v0.107.17**.” Therefore, it is necessary to perform a manual update via the command line.
## Video tutorial on ‘Updating AdGuard Home manually’
I have also published a video tutorial on my [YouTube channel](https://www.youtube.com/@secure_bits).
In this video, I show you step by step how to perform a manual update on a Linux-based AdGuard Home installation.
{{< youtube T4Dp8DDVjHM >}}
## The terminal commands required to ‘manually update AdGuard Home’
In this example, I will show you how to perform a manual update on Debian / Raspberry OS.
### Please note
Please adjust the path to your AdGuard Home installation directory according to your specific setup! The same applies to the corresponding AdGuardHome executable file.
### Logging in via SSH connection to our AdGuard Home instance
Establish an SSH connection to your AdGuard Home host (Raspberry Pi, VM, etc.) via Terminal, Putty, or Windows Terminal (or PowerShell).
In this example, I am using Windows Terminal on Windows 11. You can get this from the [Microsoft App Store**](https://www.microsoft.com/store/productId/9N0DX20HK701), for example.
```sh
ssh user@IP address host
# In my case
ssh root@172.16.16.217
```
### Update the host system
Before we start updating AdGuard Home, we first update the host system on which AdGuard Home was installed.
```sh
# Update the host system on which AdGuard Home is running
sudo apt update && apt upgrade -y
```
### Download the latest release of AdGuard Home
The next step is to download the latest release of AdGuard Home. To do this, you need to find the download path on the AdGuard Home repository.
To do this, visit the **[AdGuard Home project/download page](https://github.com/AdguardTeam/AdGuardHome/wiki/Platforms)** and search for the appropriate entry/hyperlink in the table according to your host system/hardware. hardware in the table, then right-click on the corresponding link address in the context menu that opens and click on ‘Copy link address’ (see GIF image below).
In my case, the host system is an x86 architecture and a Linux distribution


{{< img src="/images/posts/adguard/firefox_fOZpTqWH3X-1.gif" >}}


Once you have copied the link address, switch back to the terminal window, enter the command ‘wget+space’ and paste the link after the command using the key combination ‘CTRL+V’.
```sh
# Switch to the root directory
cd
# Download the latest release of AdGuard Home
wget <insert link address of the latest AdGuard Home release>
# In this example, use this link
wget https://static.adguard.com/adguardhome/release/AdGuardHome_linux_386.tar.gz
```
### Unpack the AdGuard Home release file
```sh
# Unpack the downloaded release file
sudo tar xvf AdGuardHome_linux_386.tar.gz
```
### Stop the running AdGuard Home instance
```sh
# Switch to the AdGuard directory. In my case, this is the following
cd /opt/AdGuardHome/
# Stop AdGuard Home instance
sudo ./AdGuardHome -s stop
# Output
AdGuard Home, version v0.107.18
service: control action: stop
service: action stop has been done successfully on linux-systemd
```
### Backup the AdGuard Home data
Before we perform the manual AdGuard Home update, we will first back up the data and the configuration file ‘AdGuardHome.yaml’. These can then be used again after updating the AdGuardHome instance.
```sh
# Create the storage location for the backup. For example:
mkdir -p ~/AdGuardBackup/
# Back up the data and configuration file from AdGuard Home
cp -r ./AdGuardHome.yaml ./data ~/AdGuardBackup/
# Check whether the files have been backed up
cd
cd AdGuardBackup
ls
Output ls:
AdGuardHome.yaml data
```
### Manually update AdGuard Home
```sh
# Switch to the root directory
cd
#Replace the old AdGuard Home executable file with the new one
cp AdGuardHome/AdGuardHome /opt/AdGuardHome/AdGuardHome
# Restart the ADGuardHome instance
cd /opt/AdGuardHome/
./AdGuardHome -s start
```
### Remove the AdGuard Home release archive
Finally, we need to remove the AdGuardHome release archive and the directory in the root directory.
```sh
# Remove archive
cd
rm AdGuardHome_linux_386.tar.gz
# Remove directory
rm -r AdGuardHome
```
## Summary - Manually update AdGuard Home
In this tutorial, ‘**Manually updating AdGuard Home**’, we have now manually updated AdGuard Home and created a backup of the configuration file ‘AdGuardHome.yaml’ and the data.
If you want to know how to install AdGuardHome on a Raspberry Pi and secure the Raspberry Pi with a UFW firewall, you can watch these two tutorials with accompanying videos.
- **[Install AdGuardHome on a Raspberry Pi](https://secure-bits.org/adguard-raspberry-pi-installation-2022/)**
- **[Secure Raspberry Pi with UFW firewall](https://secure-bits.org/ufw-firewall-raspberry-pi/)**
    
I hope this tutorial has been helpful. Feel free to subscribe to my YouTube channel so you don't miss any more interesting tutorials.

- **[Subscribe to SecureBits' YouTube channel](https://www.youtube.com/@secure_bits)**
