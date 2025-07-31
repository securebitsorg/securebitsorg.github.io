---
title: MAC address – what is it?
date: 2019-02-15
categories:
  - Network
  - Tutorials
tags:
  - firewall
  - network
  - security
  - tutorials
description: What is a MAC address and what is it used for?
preview: ../../../assets/images/posts/it-security/mac_adressen.jpg
hero: /images/posts/it-security/mac_adressen.jpg
menu:
  sidebar:
    name: What is a MAC address and what is it used for?
    identifier: mac
    parent: security
keywords:
  - mac address
lastmode: 2025-07-28T14:26:58.650Z
---
## MAC addresses
What is a **MAC address** and what is it used for? In this article, I would like to explain these questions and other terms and functions related to MAC addresses.
## What is a MAC address?
The **MAC address** is used to identify a network-enabled device (host) in a network. This address is actually unique (more on this later) and ensures that a device can be addressed unambiguously.  
## Structure
This address consists of a 48-bit address and should be unique worldwide. This address is assigned to layer 2 (data link layer) in the OSI model to ensure addressing in the network.
  

![MAC address structure](images/posts/it-security/Unbenanntes-Diagramm.jpg)

Structure of a MAC address


The first 24 bits are permanently assigned to the various manufacturers (manufacturer identification) and are allocated by the IEEE (Institute of Electrical and Electronics Engineers). This manufacturer identification is also called the Organizationally Unique Identifier (OUI) and can be found online in a manufacturer database. 
The last 24 bits are referred to as the Organizationally Unique Address (OUA) and can be assigned freely by the manufacturer, but only once for each device class.
## Broadcast address
A broadcast address is a pseudo-address where all 48 bits are set to “1”.

**Broadcast MAC address:**

```sh
ff-ff-ff-ff-ff-ff and in bit form 11111111 11111111 11111111 11111111 11111111 11111111 
```
and is sent to all devices in the LAN, but cannot be sent to other LANs.
### Link to the IEEE manufacturer database:
[https://regauth.standards.ieee.org/standards-ra-web/pub/view.html#registries](https://regauth.standards.ieee.org/standards-ra-web/pub/view.html#registries)
## Display your own MAC address
To display the address of your device, there are different commands depending on your operating system that you can enter in the command line (CMD, Powershell, Shell). The commands for displaying the address are as follows for the individual systems:
### Windows physical address
First, open the command line (CMD) with the key combination Windows key+R and then enter the following command:

```msdos
ipconfig /all
```
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen.  Sie können dort auch gerne Ihre eigene Frage stellen.


### Display your own address under FreeBSD
```sh
ipconfig -a
```
### Display your own address under Linux
```sh
ip a
ip link show <device>
```
It is important to select the correct network device, as computers usually have multiple network adapters (e.g., Wi-Fi).
If you are unable to read the IP address using the above commands, use a crossover cable to connect the two computers. This will place both devices in the same network segment, allowing you to use the following commands:
#### Windows
```msdos
arp -a
```
#### FreeBSD
```sh
arp -a
```
#### Linux
```sh
arp -a
ip neigh
```

## Changing a MAC address
Changing the address can be useful in some situations. For example, if you want to use a high-availability scenario, changing the address can be very useful. If a server fails in a redundancy network, changing the MAC address on the replacement server can save you the hassle of reconfiguring the system. You can also change other replacement devices in the network in the same way.
### You can use the following commands for this
#### Windows
```msdos
Change the registry entry or, if offered, in the Control Panel
```
#### Linux
```sh
ifconfig <Device> hw ether <New MAC address>
```
#### FreeBSD
```sh
ifconfig <Device> link <New MAC address>
```
## ARP spoofing (malicious modification)
Last but not least, I will discuss the malicious modification of a MAC address. This method is used in man-in-the-middle attacks.
Here, the address is also set in the ARP cache, and a manipulated ARP message is sent from host A to host B. Host B is thus given the address of the attacking device, which in turn sends all future packets to the attacker's device instead of to host A as intended.
A compromised ARP cache is easily recognizable by the fact that all IP addresses point to one MAC address. You can see an example in the next section.
### Example of ARP spoofing in the ARP cache
```sh
RE1:~# arp -a
? (192.168.1.10) on 00:2c:33:2f:7e:88 [ether] on eth0
? (192.168.1.11) on 00:2c:33:2f:7e:88 [ether] on eth0
? (192.168.1.12) on 00:2c:33:2f:7e:88 [ether] on eth0
? (192.168.1.13) on 00:2c:33:2f:7e:88 [ether] on eth0
```

<!-- FM:Snippet:Start data:{"id":"Visit Help-page","fields":[]} -->
> ## Questions and answers
> 
> If you have any questions or feedback about this blog or YouTube channel, please use my help page. Here you will find questions and answers about the various posts. You are also welcome to ask your own question here.
>
> [**Visit the Help-page**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->