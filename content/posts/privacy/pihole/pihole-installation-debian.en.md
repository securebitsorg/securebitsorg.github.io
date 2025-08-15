---
title: Pihole Installation Debian - Protect your home network
date: 2021-03-07
categories:
  - Linux
  - Privacy
  - Tutorials
  - Network
tags:
  - linux
  - network
  - pi-hole
  - privacy
  - tutorials
keywords:
  - pihole installation debian
description: In this tutorial, we will install and set up Pihole on Debian
menu:
  sidebar:
    name: Pihole Installation on Debian-based operating systems
    identifier: pihole-debian
    parent: pihole
preview: ../../../../assets/images/posts/pihole/pi-hole-installation-beendet.jpg
hero: /images/posts/pihole/pi-hole-installation-beendet.jpg
lastmode: 2025-07-26T07:51:27.040Z
---
## Pihole Installation Debian - Protect your network from tracking and advertising
> **PLEASE NOTE!!!**
>
> These instructions refer to the installation of Pihole version **5** and not the current version **6**.
>
> **The differences between VERSION 5 and VERSION 6** are not really different in terms of the process. Version 6 is no longer based on PHP and does not use a lighthtp instance.
>
> I will also publish a tutorial for version 6 of Pihole here soon.
If you want to declare war on trackers, in-app advertising, and advertising messages on your home network, you should take a look at Pihole.
Of course, some of you will now think, “I use an ad blocker when surfing, so why do I need an extra device for such services?!” I can understand this question, but the answer is quite simple.
A Pihole installation Debian / Server protects you centrally from advertising and trackers, as Pi-hole acts as a central DNS server in the network and thus not only protects computers from annoying snooping tools, but also other devices in the network. For example, smart TVs, advertising in apps on your smartphone, and it also functions as a “parental control.” This ensures that your children are protected when surfing the Internet.
### How does Pihole work?
This system provides a DNS server in the home network, which can be used to resolve domain queries from the connected devices in the network.
  
Based on exclusion lists (blacklists) of domains known as tracking or advertising domains, if there is a positive match, the requesting device on the network is given an unusable IP address. This means that the unusable IP address cannot be resolved and the device cannot resolve the domain.
  
Furthermore, the Pi-hole DNS server also allows you to track the history of visited domains, which is a data protection decision that each user must make for themselves.
The use of blacklists also limits this system. By processing this list, only the domains contained therein can be checked. Other domains not included in the list cannot be checked due to the lack of content analysis functionality and can therefore be accessed.  
Furthermore, the check only takes place using the domain check mentioned above. Access via direct entry of the domain's IP address is not checked.
### Who is a Pihole Debian installation intended for?
A Pihole installation Debian is ideal for anyone who wants to centrally protect their home network from advertising on end devices and trackers.
The installation effort is minimal and operation with a Raspberry Pi is economical in terms of power consumption.
## Hardware requirements for Pihole installation Debian
As mentioned, the requirements are minimal and affordable for any budget.
You can install Pi-hole either in a permanent virtual environment, on a single-board computer such as the Raspberry Pi, or on other mini-computers. You are also welcome to use my favorite board, APU4D4, for this task. You can find a post about this board here.
### Hardware requirements
- Minimum 512 MB RAM, preferably 1 GB
- Minimum 2 GB free hard disk space, preferably 4 GB
### Supported operating systems
- As a Docker container
Or as an installation on the following supported operating systems:

| **Distribution** | **Version**        | **Architecture**      |
| ---------------- | ------------------ | -------------------- |
| Raspberry Pi OS  | Bullseye / Bookworm | ARM                  |
| Ubuntu           | 23.x / 24.x / 25.x | ARM / x86\_64        |
| Debian           | 11 / 12            | ARM / x86\_64 / i386 |
---
Selection of supported Debian-based operating systems

## HowTo - Pihole Installation Debian
In this HowTo, I will show you how to install the Pi-hole DNS server on a virtual Debian 9 instance. The installation shown here is the same as the installation on a Raspberry Pi.
**Now let's move on to the installation of our little Pi-hole DNS server.**
### Prerequisites - Pihole Installation Debian
The prerequisite for this is a virtual instance of Debian 11 or 12 in a virtual environment, in my case on a Proxmox server. Other virtualizations such as VMWare, Virtual-Box, etc. work just as well.
**You can find out how to install Pi-Hole on a Raspberry Pi in this tutorial:**
[Go to tutorial]([/posts/privacy/pihole/install-pihole-on-a-raspberry-pi/](https://secure-bits.org/posts/privacy/pihole/pihole-auf-einen-raspberry-pi-installieren/))
#### Required tools and prerequisites:
- putty or other SSH client
- Debian-based OS
### Step 1 - Pihole installation Debian:
![Install Pihole Debian Image 1](/images/posts/pihole/pi-hole-Bild-1.jpg)


Install Pihole Debian - Image 1

---
![pihole Installation Debian Image 2](/images/posts/pihole/pi-hole-Bild-2.jpg)


Install Pihole Debian - Image 2

---
![pihole Installation Image 3](/images/posts/pihole/pi-hole-Bild-3.jpg)


Pihole Installation Debian Image 3

---
![pi-hole Installation Image 4](/images/posts/pihole/pi-hole-Bild-4.jpg)


Pihole installation Debian image 4

---
Connect the SSH client to your Debian instance as a user with root privileges and then enter the following command in your terminal window.


```sh
sudo -s root@<IP address instance>
wget -O basic-install.sh https://install.pi-hole.net
```

Then enter the following command:
```sh
bash basic-install.sh
```


If you receive an error message stating that you do not have the necessary rights, you are not logged in as root user.
Then please precede the command “bash basic-install.sh” with the command “sudo”.
It should then look like this:
```sh
sudo bash basic-install.sh
```


If the Pi-Hole installation was successful, you should see the Pi-Hole installation routine GUI as shown in the following image.


![pi-hole Installation Image 5](/images/posts/pihole/pi-hole-Bild-5.jpg)


GUI Pihole Installation Debian

---
### Step 2 - Pihole Installation Debian:
In this step, we will configure the Pihole installation DebianPiHole DNS server. This configuration is done entirely through the GUI installation routine.
Here, we need to specify which external DNS server your Internet provider uses, which IP address your Pi-hole should listen to later, and the configuration of the default gateway used.
#### Default gateway
In most cases, the default gateway should be the router provided to you by your Internet provider. Therefore, you must enter the IP address of your router as the IP address for the default gateway. For most routers, this should be 192.168.178.1 (Fritz-Box) or 192.168.2.1 (Telekom).
  
If you have a hardware firewall between your internet provider's router and your network, you will need to enter the IP address of your hardware firewall.

![pi-hole installation image 6](/images/posts/pihole/pi-hole-Bild-6.jpg)


(Image 7) Select the external DNS server for this by simply entering the IP address of your router, as this is usually responsible for the external resolution of external domains.

![pi-hole installation image 7](/images/posts/pihole/pi-hole-Bild-7.jpg)


Image 7 - **Select external DNS server**

---
(Image 8) Select the blacklist based on ads and tracking codes to be blocked. These lists can be replaced or edited after installation.


![pi-hole Installation Image 8](/images/posts/pihole/pi-hole-Bild-8.jpg)


Image 8 - **Selecting the blacklist (can also be replaced by others after installation)**


---
(Image 9) Select the IP protocols (IPv4, IPv6) for which ads and tracking codes are to be blocked. It is best to select both protocol types here.


![pihole Installation Image 9](/images/posts/pihole/pi-hole-Bild-9.jpg)


Image 9 - **Select the protocol in which ads should be blocked**

---
(Image 10) In the next step, you will see the current IP configuration that has been assigned to your Pi-hole installation and which you can now adjust according to your requirements. Please be sure to use a static IP address for this, as you will then need to store this in the DNS assignment for your clients in the network, which will then use Pi-hole for DNS resolution. If this IP address does not match the IP address assigned to the Pi-hole DNS server, you will encounter massive DNS resolution problems later during operation and will not be able to access any domains on the Internet.


![pi-hole Installation Image 10](/images/posts/pihole/pi-hole-Bild-10.jpg)


Image 10 - **Overview of the current IP configuration of the Pi-hole DNS server**

---
(Image 11) We can leave the preselection for installing the Pi-hole web interface as it is. This allows you to access the web interface via your favorite browser by entering the Pi-hole IP address / pi-hole (example http://172.16.16.61/admin) or http://pi-hole/admin, so that you can conveniently carry out further configurations.


![pi-hole installation image 11](/images/posts/pihole/pi-hole-Bild-11.jpg)


Image 11 - **Confirm installation of the Pihole web interface**

### Step 3:
(Image 12) Confirm the preselection to install a lighttpd server, as you will need this for the Pihole web interface.


![pi-hole Installation Image 12](/images/posts/pihole/pi-hole-Bild-12.jpg)


Image 12 - **Confirm installation of the lighttpd server**

---
(Image 13) In the next step, I would also recommend that you enable log queries to be recorded. These are used later during operation to store violations, for example, and make it easier for you to make adjustments to the configuration.


![pi-hole installation image 13](/images/posts/pihole/pi-hole-Bild-13.jpg)


Image 13 - **Enable Pihole logging**


---
(Image 14) - Pihole offers several options for logging the domains and IP addresses visited. You can decide for yourself which logging level you want to select here.


![pi-hole Installation Image 14](/images/posts/pihole/pi-hole-Bild-14.jpg)


Image 14 - **‘Privacy mode’ setting**

---
(Images 15, 16, and 17) In the next window, you will now find an overview of your configuration, the IP address you can use to log in (if you change the IP address, you must restart the instance), and the password for logging in to the web interface. You can change this password later. More on this in the next step.


![pi-hole installation image 15](/images/posts/pihole/pi-hole-Bild-15.jpg)


Image 15 - **Notification that the Pihole installation is complete**

---

![pi-hole installation image 16](/images/posts/pihole/pi-hole-Bild-16.jpg)


Image 16 - **Display of the password for logging into the web interface**

---
### Step 4 - Pihole installation Debian :

(Image 17) Now open your browser and enter the IP address displayed earlier followed by /admin in the browser address bar and press Enter. The login screen of your Pi-hole DNS server's web interface should now be displayed. Enter the password you entered earlier to log in and you will be welcomed by the Pihole dashboard.


![Dashboard / Pihole web interface](/images/posts/pihole/pi-hole-installation-beendet.jpg)


Image 17 - **Pihole dashboard** | Pihole installation Debian 

---
### Step 5 - Pihole installation Debian:
In the last step, you must ensure that all devices can use the Pi-hole DNS server for DNS resolution on the Internet.
To do this, simply log in to your router, provided that it is also responsible for DHCP on your network, and enter the IP address of your Pi-hole DNS server in the network settings (DHCP server settings) under “DNS server.”
However, the newly assigned DNS server will only be used after the DHCP lease has been renewed and will therefore not be noticed by the clients on their own. The easiest way is to disconnect your device from the network and reconnect it. The new configuration will then be loaded and the devices should appear in the device overview in Pi-hole.


> **How a domain query works in conjunction with Pi-hole in > Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen.  Sie können dort auch gerne Ihre eigene Frage stellen.
this example:**
>
> Client (end device) -> Pi-hole -> Router
> **INFO**
>
> In this scenario, only the end devices use Pi-hole as the DNS server, but **not** the router itself.


## Important commands for your PiHole installation Debian :
### Change Pihole password:
To do this, you must be logged in as superuser in the terminal and then enter the following command:


```sh
pi-hole -a -p
```

### Pihole installation Debian - Perform update:
To do this, you must be logged in as superuser in the terminal and then enter the following command:


```sh
pi-hole -up
```

![pi-hole installation Debian - Image 17](/images/posts/pihole/pi-hole-Bild-17.jpg)


### More on Pihole
You can find illustrated instructions on setting up a FritzBox and configuring other types of Pi-hole installations in the Pi-hole project documentation.

[Visit website pihole.net](https://docs.pi-hole.net/routers/fritzbox-de/)

> ## Questions and answers
> 
> If you have any questions or feedback about this blog or YouTube channel, please use my help page. Here you will find questions and answers about the various posts. You are also welcome to ask your own question here.
>
> [**Visit the Help-page**](https://help.secure-bits.org)

<!-- FM:Snippet:Start data:{"id":"Visit Help-page","fields":[]} -->
