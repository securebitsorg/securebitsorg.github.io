---
title: “AdGuardHome Setup - Basic Configuration”
descripton: “AdGuardHome Setup | Configure and set up AdGuardHome correctly to protect your network.”
hero: /images/posts/adguard/Thumbnail.png
date: 2022-09-19
menu:
  sidebar:
    name: AdGuardHome Setup – Basic Configuration
    identifier: adguard-config
    parent: adguard
categories:
- “Linux”
- “Network”
- ‘Security’
- “Tutorials”
- “Video”
tags:
- “adguard”
- “linux”
- “network”
- “security”
- ‘tutorials’
- “video”
---
## AdGuardHome Setup - Configure to protect your network from ads and trackers
In today's tutorial, ‘**Configuring AdGuard**’, I would like to show you how to perform the **basic AdGuard configuration** on your Raspberry Pi after installing AdGuard ([here for instructions](https://secure-bits.org/adguard-raspberry-pi-installation-2022/)).
In this tutorial video, I will show you how to configure the following settings.
- Configure DNS
- Create block lists
- Network-wide blocking of applications (social networks and other services)
- Understand protocols
- And much more
    
### Video tutorial - Configuring AdGuardHome setup | Basic configuration
**You can watch the video tutorial on my YouTube channel here.**
**Just click on the image below.**
{{< youtube M-O00xQ23mk >}}
### Looking for an alternative to ‘AdGuard Raspberry Pi Installation’?
Then take a look at my step-by-step guide on how to install the DNS server **Pi-hole** on a Raspberry PI.
Go to tutorial
## Step by step | Install AdGuard Raspberry Pi
### Installing AdGuard on a Raspberry Pi
Here you will find step-by-step instructions for installing AdGuard Home on a Raspberry Pi.
Go to tutorial
## Summary - AdGuard Raspberry Pi Installation
With this basic AdGuard configuration, your AdGuard DNS server is now set up.
I will show you further configurations such as DNS over https and so on in separate videos/posts.
## Blacklist recommendations - AdGuard Raspberry Pi installation
I have had very good experiences with the blacklists presented here and would therefore like to recommend them.
### Blacklist SteveBlack
This list is very comprehensive and currently contains around 150,000 entries.
Categories:
- Porn
- Adware
- Malware
- Fake news
- Gambling (suspicious hosts)
- Social+
[https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts](https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts)
### Blacklist adaway.org
Ad blocker
[https://adaway.org/hosts.txt](https://adaway.org/hosts.txt)
### Blacklist SmartTV tracking
The name says it all
[https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt](https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt)
### Blacklist EasyPrivacy
Tracking and telemetry
[https://v.firebog.net/hosts/Easyprivacy.txt](https://v.firebog.net/hosts/Easyprivacy.txt)
# Hardware recommendations - AdGuard Raspberry Pi installation
**Raspberry Pi 4 Bundle**
**SD card reader**
**SD card**
### Blacklist EasyList
Ad blocker
[https://v.firebog.net/hosts/Easylist.txt](https://v.firebog.net/hosts/Easylist.txt)
### Blacklist Telemetry Microsoft / Windows
Prevent telemetry collection by Microsoft products
[https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt](https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt)
### Further links on this topic
**Raspberry Pi OS Imager**
[https://downloads.raspberrypi.org/imager/imager\_latest.exe](https://downloads.raspberrypi.org/imager/imager_latest.exe)
## Trusted DNS servers - AdGuard Raspberry Pi installation
Here is a list of privacy-compliant DNS server providers that do not log data and are censorship-free.
**For security reasons, I would personally prefer a DNS server with DoT (DNS over TLS).**
_Thanks to [privacy-handbuch.de](https://www.privacy-handbuch.de/) for the list of DNS servers._
### Freifunk München (normal DNS, DNS-over-TLS, and DNS-over-HTTPS)
```sh
IPv4: 5.1.66.255
IPv6: 2001:678:e68:f000::
Server name: dot.ffmuc.net
IPv4: 185.150.99.255
IPv6: 2001:678:ed0:f000::
Server name: dot.ffmuc.net
```
### Digital Society (CH) (DNS-over-TLS and DNS-over-HTTPS!)
```sh
IPv4: 185.95.218.42
IPv6: 2a05:fc84::42
Server name: dns.digitale-gesellschaft.ch
IPv4: 185.95.218.43
IPv6: 2a05:fc84::43
Server name: dns.digitale-gesellschaft.ch
```
### Censurfridns Denmark (aka. UncensoredDNS)
# Hardware recommendations - AdGuard Raspberry Pi installation
**Raspberry Pi 4 bundle**
**SD card reader**
**SD card**
```sh
IPv4: 91.239.100.100
IPv6: 2001:67c:28a4::
IPv4: 89.233.43.71
IPv6: 2a01:3a0:53:53::
(with DNS-over-TLS)
```
