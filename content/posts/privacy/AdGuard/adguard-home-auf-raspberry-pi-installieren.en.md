---
title: “AdGuard Home Raspberry Pi Installation”
descripton: “AdGuard Home Raspberry Pi Installation | In this tutorial, I will show you how to install AdGuard Home on a Raspberry Pi.”
hero: /images/posts/adguard/Video-Thumbnail.png
date: 2022-08-23
menu:
  sidebar:
    name: Install AdGuardHome on a Raspberry Pi
    identifier: adguard-raspberry-pi
    parent: adguard
categories:
- “Linux”
- “Network”
- “Security”
- “Tutorials”
- “Video”
tags:
- “adguard”
- “network”
- “security”
- “tutorials”
- "video"
- “raspberry pi”
---
## Protect your network from ads and trackers with AdGuard
In today's tutorial, ‘**AdGuard Raspberry Pi Installation**’, I would like to show you how to install the **AdGuard DNS server** on a **Raspberry Pi version 3 or higher**.
With this DNS server, similar to the pihole DNS server ([click here for the tutorial](https://secure-bits.org/pi-hole-auf-einen-raspberry-pi-installieren/)), you can ban most ads and data trackers from your home network.
If you still need hardware for your AdGuard DNS server, take a look at the end of this post. I've put together a short list there.
### Video tutorial – AdGuard Raspberry Pi Home Installation
If you'd prefer to watch the individual steps for ‘AdGuard Raspberry Pi Installation’ as a video tutorial, you can do so on my YouTube channel.
**Just click on the image below.**
{{< youtube PF2WH2llwSg >}}
### Looking for an alternative to ‘AdGuard Home Raspberry Pi Installation’?
Then take a look at my step-by-step guide on how to install the DNS server **Pi-hole** on a Raspberry PI.
[Go to tutorial]()
### Note!
There was a typo in the command to unzip the file “`sudo tar xvf AdGuardHome_linux_armv7.tar.gz`”. The ‘v’ was missing from “armv7” in this command, which meant that the file could not be unzipped! Many thanks to **Sebastian** for pointing this out!
## Step by step | AdGuard Home Raspberry Pi installation
### Step 1:
First, you need to install the Raspberry OS on your Raspberry Pi's SD card. To do this, you can download the [Raspberry Pi Imager](https://www.raspberrypi.com/software/) tool from raspberrypi.com. With this tool, you can easily install the required Raspberry Pi OS on the SD card.
### Step 2:
Once you have downloaded Raspberry Pi Imager, you can install it on your computer. After successful installation and starting the program, you will be greeted by the Raspberry Pi OS Imager dashboard, as shown in the image.
### Step 3:
Then click on the ‘Select’ button, then on ‘Raspberry Pi OS (other)’ and then on the operating system ‘Raspberry Pi OS Lite (64 bit).’
![Select Raspberry OS](/images/posts/adguard/rpi-imager_vHFGbf8SGe.png)
### Step 4:
After selecting the Raspberry Pi OS image, click on the ‘**SD card**’ button and then select the SD card that you have inserted into your SD card reader and intend to use later in the Raspberry Pi.
### Step 5:
Finally, click on the ‘gear icon (settings)’ to configure some settings for writing the image to the SD card. Adjust the following settings:
- Optionally assign a host name
- Enable SSH and assign a secure password
  
- Set language settings
- Disable telemetry
- Eject media after completion
Once all settings have been made, click on ‘Save’.

### Step 6:
After completing the previous steps, you can now click on ‘Write’ to write the Raspberry Pi OS image to the SD card. This process may take a while.
### Step 7:
After writing the image to the SD card, you can insert the card into the powered-off Raspberry Pi, connect the network cable to your router or switch, and then connect the Raspberry Pi to the power supply. After about 30 seconds, the Raspberry Pi should boot up.
### Step 8:
In the next step, we need to find out which IP address the Raspberry Pi has obtained via DHCP. You can easily check this in your router's network settings / DHCP leases. The device should then be displayed in the list. You should assign a static IP address to the device in your DHCP server/router so that no problems arise with DNS resolution in the network when using the DNS server later.
![Find out the IP address of the Raspberry Pi](/images/posts/adguard/Raspberry-Pi-IP-Adresse.png)
### Step 9:
Once you know the IP address of the Raspberry Pi, you can open a terminal window (in this example under Windows 11) or the ‘Putty’ tool. Enter the following command: `ssh pi@IP address Raspberry`
When connecting for the first time, you will need to confirm the fingerprint for the SSH connection. Answer ‘yes’ to the question (see image). You will then be asked for the password you assigned in the Raspberry Pi OS Imager settings.
![Establish SSH connection to the Raspberry Pi](/images/posts/adguard/SSH-Anmeldung-Raspberry-Pi.png)
### Step 10:
The next step is to update the Raspberry Pi OS to the latest version. You can do this with the following command.
  
`sudo apt-get update && apt-get upgrade`
This update process may take a while. If this message appears: Repository ‘http://deb.debian.org/debian bullseye InRelease’ changed its ‘Version’ value from ‘11.3’ to ‘11.4’, you can perform a distribution upgrade with the following command:
  
`sudo apt-get dist-upgrade`
When the installation process is complete, restart the system by entering `sudo reboot`.
![Perform Raspberry Pi update](/images/posts/adguard/Update-Raspberry-Pi-OS.png)
### Step 11:
After restarting the Raspberry Pi and reconnecting via SSH, we can finally install AdGuard Home on the Raspberry Pi. To do this, we first need the installation package for AdGuard Home. To download the required installation package, enter the following command in the terminal window. Download the AdGuard installation package:  
`wget https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.11/AdGuardHome_linux_armv7.tar.gz`
Unzip the installation package:
`sudo tar xvf AdGuardHome_linux_armv7.tar.gz`
  
Change to the AdGuard directory: `cd AdGuardHome`
Install AdGuard: `sudo ./AdGuardHome -s install`
![Installing AdGuardHome on a Raspberry Pi](/images/posts/adguard/Installation-AdGuard.png)

After successful installation, you can continue with the configuration via a web browser. To do this, simply enter the IP address followed by port 3000 in the address bar of your browser. `http://IP-Adresse:3000`
You should then see the AdGuard welcome dashboard shown in the image.
### Step 12:
For security reasons, the admin web interface should only be accessible via the LAN / management network. Therefore, select the interface with the IP address of your Raspberry Pi in the first pull-down menu. If you have multiple networks, guest networks, or VLANs in operation, you can leave the pull-down menu under “DNS Server” set to “All Interfaces”; otherwise, select the interface of your Raspberry Pi here as well.
![Setup AdGuardHome](/images/posts/adguard/Installationssetup-AdGuard-Bild-2.png)
### Step 13:
On the next page of the wizard, you must assign a user name and password for access to AdGuard. Please note that the password you choose must be a truly secure password to prevent misuse of the DNS server!
![Set user and password for AdGuardHome](/images/posts/adguard/Installationssetup-AdGuard-Bild-3.png)
### Step 14:
In the next window, you will see a configuration guide for various devices and an overview of the IP addresses that the AdGuard DNS server is listening to. When you click ‘Next’, you will be taken to the AdGuard Home login window.
![AdGuardHome configuration help](/images/posts/adguard/Installationssetup-AdGuard-Bild-4.png)
### Step 15:
After entering your username and password, the AdGuard Home dashboard will be displayed. Here you can evaluate the DNS server's request statistics and, of course, further configure AdGuard.
![AdGuardHome Dashboard](assets/images/posts/adguard/Installationssetup-AdGuard-Bild-5.png)
## Summary – AdGuard Raspberry Pi installation
As you can see, installing AdGuard Home on a Raspberry Pi is actually not that difficult!
Of course, you will need to configure AdGuard a little (DNS over https, assign blacklists, etc.) before it can start working properly.
I will show you how to configure AdGuard in a separate post or video on my YouTube channel.
An overview of good blacklists for AdGuard or pihole, as well as an overview of public DNS servers that are committed to data protection and security, can be found further down in this post ‘AdGuard Raspberry Pi Installation’.
**If this step-by-step guide has helped you, I would be very grateful if you would support me by subscribing to my [YouTube channel](https://www.youtube.com/channel/UCr-cuwB555JmAm4F412KZ2Q).**
## Blacklist recommendations – AdGuard Raspberry Pi installation
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
### Blacklist EasyList
Ad blocker
[https://v.firebog.net/hosts/Easylist.txt](https://v.firebog.net/hosts/Easylist.txt)
### Blacklist Microsoft / Windows telemetry
Prevent telemetry collection by Microsoft products
[https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt](https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt)
### Further links on this topic
**Raspberry Pi OS Imager**
[https://downloads.raspberrypi.org/imager/imager\_latest.exe](https://downloads.raspberrypi.org/imager/imager_latest.exe)
## Trusted DNS servers - AdGuard Home Raspberry Pi Installation
Here is a list of privacy-compliant DNS server providers that do not log data and are censorship-free.
> Thanks to [privacy-handbuch.de](https://www.privacy-handbuch.de/) for the list of DNS servers.
### Freifunk München (normal DNS, DNS-over-TLS, and DNS-over-HTTPS)
```sh
IPv4: 5.1.66.255
IPv6: 2001:678:e68:f000::
Server name: dot.ffmuc.net
IPv4: 185.150.99.255
IPv6: 2001:678:ed0:f000::
Server name: dot.ffmuc.net
```
### Digital Society (CH) (DNS over TLS and DNS over HTTPS!)
```sh
IPv4: 185.95.218.42
IPv6: 2a05:fc84::42
Server name: dns.digitale-gesellschaft.ch
IPv4: 185.95.218.43
IPv6: 2a05:fc84::43
Server name: dns.digitale-gesellschaft.ch
```
### Censurfridns Denmark (aka. UncensoredDNS)
```sh
IPv4: 91.239.100.100
IPv6: 2001:67c:28a4::
IPv4: 89.233.43.71
IPv6: 2a01:3a0:53:53::
(with DNS-over-TLS)
```

