---
title: Pi-hole Raspberry Pi Installation
date: 2022-03-30
hero: /images/posts/pihole/pi-hole-installation.png
descripton: Pi-hole Raspberry Pi | In this tutorial, we will install Pihole on a Raspberry Pi
menu:
  sidebar:
    name: Install Pihole on a Raspberry Pi
    identifier: pihole-raspberry
    parent: pihole
categories: 
- “Hardware”
- “Linux”
- “Network”
- “Security”
- “Tutorials”
tags:
- “security”
- “linux”
- ‘network’
- “pi-hole” 
- “raspberry pi”
- "tutorials"
- “video”
---
## Install and set up Pi-hole on a Raspberry Pi
In this tutorial, ‘**Install Pi-hole on a Raspberry Pi**’, I will show you how to install the Pi-hole DNS server and set up a recursive DNS server with Unbound.
The step-by-step installation is fohttps://secure-bits.org/wp-content/uploads/2022/03/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-3.jpghtly on a Raspberry Pi in this tutorial.
In another tutorial here on SecureBits (https://secure-bits.org/pi-hole-installation/), I already showed you how to install it on a Debian system in a virtual machine and explained why and how you should use a Pi-Hole DNS server.
## Video tutorial on ‘Pi-hole Raspberry Pi’
For those of you who would prefer to watch a video tutorial on installing Pi-hole on a Raspberry Pi, I have published an installation video on my YouTube channel.
In this video, I also show you how to properly secure your internal DNS server ‘Pi-hole’ using the UFW firewall (Uncomplicated Firewall).
{{< youtube PpYwxDCDOc4 >}}
The prerequisite for the upcoming step-by-step guide is that you already have a current Raspberry OS installed on your Raspberry Pi.
For those of you who don't have Raspberry Pi OS on your little box yet, I've created a quick guide for this in the next paragraph.
Installing Pi-hole on a Raspberry Pi is quick and easy with the **Raspberry Pi Imager**.
All you need is a microSD card + a dummy slot in SD card format and an SD card reader.
You can download the Raspberry Pi Imager here:
[https://www.raspberrypi.com/software/](https://www.raspberrypi.com/software/)
#### Pi-hole on a Raspberry Pi – installation process Raspberry OS
After downloading, open Raspberry PI Imager (in this example for Windows), insert an SD card into your SD reader and select the appropriate OS for the Raspberry Pi in the Imager. Make sure that you select either the 64-bit or 32-bit version of Raspberry PI OS Lite. The Lite version is sufficient for operating Pi-hole.
After selecting the appropriate OS, select the appropriate SD card for the image and, before clicking Write, click on the gear icon on the Raspberry PI Imager interface, enable access via SSH, and assign a secure password for access.
![Installation process Raspberry OS Image 1](/images/posts/pihole/Raspberry-OS-installieren-Bild-1.jpg)
![Raspberry OS installation process image 2](/images/posts/pihole/Raspberry-OS-installieren-Bild-2.jpg)
![Raspberry OS installation process image 3](/images/posts/pihole/Raspberry-OS-installieren-Bild-3.jpg)
## Install Pihole
### Install Pi-Hole on a Raspberry Pi
First, we will install and set up Pi-hole on a Raspberry Pi.
Prerequisite for this tutorial is that you have already installed the Raspberry OS on your Raspberry Pi and that you have connected it to your network. This means connecting it to your router, turning it on, and then finding the IP address in your router's network overview.
  
We will need this IP address later to access the Raspberry Pi via SSH.
#### Device:
- A board from the Raspberry Pi 3 Model B+ series or higher is sufficient to operate a Pi-hole DNS server.
#### Requirements:
- Raspberry Pi with the latest Raspberry OS
- Connect the Raspberry Pi to your router and check which IP address has been assigned to the Raspberry Pi in your network.
#### Step-by-step guide to installing Pi-hole on a Raspberry Pi:
#### Step 1
![SSH connection to the Raspberry Pi](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-0.jpg)
First, we connect to the Raspberry Pi via SSH. To do this, open a terminal window (I use Windows Terminal on Windows) and enter the following command:
`ssh pi@<IP address of your Raspberry Pi>`
When you connect via SSH for the first time, you will be asked if you want to trust the SSH key. Confirm this question with ‘yes’.
  
You will then need to enter the password you created for login.
#### Step 2
![Update Raspberry OS](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-1.jpg)
First, we will log in as the root user permanently for this session.
  
```sh
sudo su
```
Then we update the Raspberry OS with the following command:
```sh
apt-get update && apt-get upgrade -y
```
#### Step 3
![Download Pi-hole and start the installation process](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-2.jpg)
We start the installation of the Pi-hole DNS server by entering the following command:
```sh
curl -sSL https://install.pi-hole.net | bash
```
#### Step 4
![Pi-hole installation wizard](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-3.jpg)

When the installation of Pi-hole is complete, you will be greeted by the installation wizard.
Select ‘**OK**’ and start the setup dialog.

#### Step 5

![Fixed IP address Raspberry Pi](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-4.jpg)

If you have not yet assigned a fixed/static IP address to your Raspberry Pi in your router (FritzBox, Speedport, pfsense, etc.), you can do this after the installation is complete.
In this window, select ‘Yes’ and then press the Enter key.

#### Step 6

![Display the IP address of the Raspberry Pi / Pi-hole](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-5.jpg)

The next window will display the IP address of the Pi-hole. You must then assign this IP address as a fixed address on your router / DHCP server so that the Pi-hole DNS server can be accessed later.

#### Step 7

![Select public DNS server](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-6.jpg)

Next, select an upstream DNS provider for resolving requests from your network. Here you can select one from the list; in my case, I chose OpenDNS, which also supports DNSSEC.
You can change your selection later at any time, which I would recommend doing. A list of DNS servers that are also privacy-friendly can be found further down in this tutorial.
#### Step 8
![Select Pi-hole blacklist](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-7.jpg)
In the selection window for **selecting a blacklist (filter list)**, only the **StevenBlack blacklist** is currently available. However, this filter list is definitely recommended, but can be changed or supplemented with additional lists in the Pi-hole web interface.

#### Step 9
![Web-admin dashboard](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-8.jpg)
Install the Pi-hole web admin dashboard
After clicking on ‘OK’, the configuration window for the Pi-hole web interface will appear. Please leave the default selection ‘ON’. This will allow you to administer everything in your browser later.
#### Step 10
![Pi-hole lighttpd](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-9.jpg)

To enable the use of the web interface, Pi-hole comes with its own lightweight web server called lighttpd. Here, too, you should normally leave the default setting and install this web server.
#### Step 11
![Enable Pi-hole logging](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-10.jpg)

In the current window, you can choose whether Pi-hole should create logs for events. Here, too, I would leave the default selection.
#### Step 12
![Pi-hole privacy settings](/images/posts/pihole/Pi-hole-auf-Raspberry-Pi-installieren-Schritt-11.jpg)
When selecting ‘**Privacy Mode**’, you must choose which mode is right for you. For my part, I use the **‘Show Everything’ mode in my own network**.
  
If you want to use Pi-Hole for business purposes, I would advise you to use ‘Anonymous Mode**’ in accordance with the GDPR.
#### Step 13
![First login to Pi-hole](/images/posts/pihole/Install Pi-hole on Raspberry Pi Step 12.jpg)
In the last step of the Pi-hole installation routine, you will receive the most important information for later access to the Pi-hole DNS server.
First, you will see the IP address of the Pi-hole DNS server. Then you will see the address you can use to access the Pi-hole web interface. In my case, it is `**http://172.18.18.62/admin**`  
And very importantly, you will also see the generated password, which you will need to authenticate when logging in via the shell or the web interface. Further down in this post, I will show you how to change the password.
### Pi-hole on a Raspberry Pi – tips and tricks
Here I have put together some useful tips that you will certainly find useful in your everyday life or when setting up your Pi-hole.
#### Updating Pi-hole - Pi-hole on a Raspberry Pi
In the Pi-hole web interface, you will see a notification in the footer when a new update is available. Unfortunately, the update can only be installed via an SSH connection.
To install the update, connect to the Raspberry Pi via SSH:
```sh
ssh pi@&<IP address of the Raspberry Pi>
# After entering your password, enter the following command to execute the update:
pihole -up
# After the update, the Pi-hole should be rebooted.
```
#### Change the Pi-hole password for login - Pi-hole on a Raspberry Pi
You can change the password for logging in to your Pi-hole DNS server with the following command.
```sh
# Option 1: Change password with display of new password
pihole -a -p NewPassword
# Option 2: Change password without display
pihole -a -p
# You will then be prompted to enter your new password, which, as is typical for Unix, will not be displayed when you type it.
```
#### Change Pi-hole IP address - Pi-hole on a Raspberry Pi
To change the IP address of the Pi-hole DNS server afterwards, you must edit the dhspsc.conf file via SSH.
```sh
# Connect to the Pi-hole via SSH and then enter the following command to edit the dhcpcd.conf file with the Nano editor
sudo nano /etc/dhcpcd.conf
# In the Nano editor window, change the new IP address here under ‘static-ip-address’, save your entries with CTRL+O and ENTER, and exit the Nano editor with CTRL+X. See next image
```
![Assign static IP address to Raspberry Pi](/images/posts/pihole/pi-hole-IP-Adresse-aendern.jpg)
#### Reconfigure/set up Pi-hole - Pi-hole on a Raspberry Pi
To run the Pi-hole installation setup again, you can connect to the Raspberry Pi via SSH and restart the setup with the following command
```sh
pihole -r
```
#### Uninstalling Pi-hole - Pi-hole on a Raspberry Pi
If the Pi-hole DNS server is not your thing, you can uninstall Pi-hole again with the following command.
```sh
# Uninstall Pi-hole
pihole uninstall
```
### Pi-hole on a Raspberry Pi – blacklist recommendation
In addition to the pre-installed blacklist ‘SteveBlack’, there are several other good lists that we would like to introduce to you here.
> #### Please note!
>
> Please do not use too many lists. Processing the lists has a significant impact on performance and can cause the Raspberry Pi to crash.
>
> I have had very good experiences with the blacklists presented here and would therefore like to recommend them.
#### Blacklist SteveBlack
The blacklist that we installed when installing Pi-hole is very comprehensive and should continue to be used. This list is very comprehensive and currently contains around 150,000 entries.

The following host categories are included:
- Porn
- Adware
- Malware
- Fake news
- Gambling (suspicious hosts)
- Social
[https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts](https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts)
#### Blacklist adaway.org
Ad blocker
[https://adaway.org/hosts.txt](https://adaway.org/hosts.txt)
#### Blacklist SmartTV tracking
The name says it all
[https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt](https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt)
#### Blacklist EasyPrivacy
Tracking and telemetry
[https://v.firebog.net/hosts/Easyprivacy.txt](https://v.firebog.net/hosts/Easyprivacy.txt)
#### Blacklist EasyList
Ad blocker
[https://v.firebog.net/hosts/Easylist.txt](https://v.firebog.net/hosts/Easylist.txt)
#### Blacklist AdGuardDNS
This blacklist comes from competitor AdGuard and is also very comprehensive.
[https://v.firebog.net/hosts/AdguardDNS.txt](https://v.firebog.net/hosts/AdguardDNS.txt)
#### Malicious URL Blocklist (from URLHaus)
[https://adguardteam.github.io/HostlistsRegistry/assets/filter\_11.txt](https://adguardteam.github.io/HostlistsRegistry/assets/filter_11.txt)
#### The Big List of Hacked Malware Web Sites
[https://adguardteam.github.io/HostlistsRegistry/assets/filter\_9.txt](https://adguardteam.github.io/HostlistsRegistry/assets/filter_9.txt)
#### Blacklist Telemetry Microsoft / Windows
Prevent telemetry collection from Microsoft products
[https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt](https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt)
### Trusted DNS servers - Pi-hole on a Raspberry Pi
Here is a list of privacy-compliant DNS server providers that do not log data and are censorship-free.
**For me personally, only a DNS server with DoT is currently an option for security reasons.**
_Thanks to [privacy-handbuch.de](https://www.privacy-handbuch.de/) for the list of DNS servers._
#### Freifunk München (normal DNS, DNS-over-TLS, and DNS-over-HTTPS)
```sh
IPv4: 5.1.66.255
IPv6: 2001:678:e68:f000::
Server name: dot.ffmuc.net
IPv4: 185.150.99.255
IPv6: 2001:678:ed0:f000::
Server name: dot.ffmuc.net
```
#### Digitale Gesellschaft (CH) (DNS-over-TLS and DNS-over-HTTPS!)
```sh
IPv4: 185.95.218.42
IPv6: 2a05:fc84::42
Server name: dns.digitale-gesellschaft.ch
IPv4: 185.95.218.43
IPv6: 2a05:fc84::43
Server name: dns.digitale-gesellschaft.ch
```
#### Censurfridns Denmark (aka. UncensoredDNS)
```sh
IPv4: 91.239.100.100
IPv6: 2001:67c:28a4::
IPv4: 89.233.43.71
IPv6: 2a01:3a0:53:53::
(with DNS-over-TLS)
```
## Conclusion - Pi-hole on a Raspberry Pi
Using a Pi-hole DNS server is a great and inexpensive way (except that the PI is currently difficult to obtain due to a semiconductor shortage and therefore very expensive) to protect yourself from tracking, malware, and adware.
Especially in your home network, this DNS server can be implemented wonderfully as a name server on a consumer router such as FritzBox, Speedport, and others. This provides excellent protection against tracking, advertising, malware, and phishing on all devices in the network. Of course, this protection is not 100% effective, but it is certainly better than doing nothing to protect your data privacy.
Feel free to send me any suggestions for blacklists that you use. I would really appreciate it!
