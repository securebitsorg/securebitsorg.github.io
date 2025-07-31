---
title: How does a firewall work?
date: 2018-08-09
categories:
- Network
- Security
- Tutorials
tags:
- firewall
- network
- security
- tutorials
draft: false
description: How does a firewall work and what types of firewalls are there?
preview: ../../../assets/images/posts/it-security/UTM-Firewall-Hardware.png
hero: /images/posts/it-security/UTM-Firewall-Hardware.png
menu:
  sidebar:
    name: How do firewalls work and what different types are there?
    identifier: function-firewall
    parent: security
---
## What is a firewall and how does it work?
In this article, I would like to answer the question “**How does a firewall work**” with the help of the OSI layer model, among other things. In order to ensure security in a network, it is of course extremely important to understand how a firewall works. In this article, I will therefore attempt to explain the individual functions of a firewall in a way that is easy to understand. This will enable you to control data traffic optimally according to your requirements.
If we want to explain how a firewall works, we should first take a closer look at the OSI layer model.
### How does a firewall work – OSI layer model
![The OSI layer model](/images/posts/it-security/osi-modell.jpg)
OSI layer model – How does a firewall work?
[The OSI model](https://de.wikipedia.org/wiki/OSI-Modell) is divided into seven layers, of which only layers 3, 4, and 7 are relevant to firewalls.
### OSI model layer 3 – network layer
The network layer is responsible for switching connections (performance-oriented services) and, in the case of packet-oriented services, for forwarding data packets. It is important that packets do not enter other layers, but are forwarded from node to node. If the “sender” and “receiver” cannot be reached directly, the packets are always assigned a new intermediate destination (node) until the actual destination is reached.
The task of the network layer is to assign addresses to the packets, negotiate and ensure a certain quality of service, update the routing tables, and establish the routing itself.
#### Hardware used in this layer:
- Router
- Layer 3 switch
#### Protocols used in this layer:
- IP, IPsec, ICMP, X25 (WAN), CLNP
### OSI model Layer 4 - Transport layer
The transport layer is responsible for segmenting the data stream and preventing congestion.
The segments are called service data units and are transported at the fourth layer. For addressing purposes, the data segment is assigned a fourth layer address, which is then the port. This data segment is then encapsulated in a data packet and enters the third layer (network layer). 
#### Protocols:
- TCP, UDP, SCTP, DCCP
### OSI model layer 7 – Application layer
The application layer provides functions for applications (their communication). This is where connections to the lower layers are established and where data is entered and outputted.
#### Applications (apps):
- Email programs, messaging (e.g., Facebook, Twitter, etc.), browsers
## What is a firewall?
A firewall is a security system that uses rules to protect a network area from unauthorized access. The firewall itself is not able to detect attacks on the network independently, as it only works on a rule-based system.
 
## Basic functions of a firewall
The basic function of a firewall is to use packet filters. These packet filters work according to static rules and check each data packet individually, but cannot establish connections to previous packets.
An advanced form of packet filtering is known as stateful inspection. This type of packet filtering recognizes and checks individual relationships between the monitored data packets.
 
## How packet filtering works
In packet filtering, data packets are identified by a network address and either forwarded to their destinations or blocked. To implement these guidelines, the header information of the individual data packets is evaluated and handled according to these rules. Packet filtering thus operates in the transport layer (layer 4, port), network layer (layer 3, IP address) and, in some stateful firewalls, also in the application layer (layer 7, here the user data) of the OSI model. 

## How stateful inspection packet filtering works
Stateful inspection is a dynamic type of packet filtering. Here, each connection request is specified in more detail. Relationships to requested data packets and transmitted data packets are examined, allowing the permitted data packets to be assigned more accurately. This ensures that only the communication partners involved can access the connection.
## How does a firewall work – types of firewalls
### Personal firewall
A personal firewall, also known as a desktop firewall, is security software that monitors the communication of a single computer. Personal firewalls are available individually or as part of many antivirus security solutions from well-known manufacturers. Whether this type of security solution is recommended from the point of view of your computer's security is open to question. I wrote an article on this topic some time ago. In the
### External firewall
An external firewall, also known as a hardware firewall, monitors communication, depending on the hardware configuration, either on an internal network (LAN, e.g. company network) or between several subnets and other network segments (WAN, e.g. the Internet) to prevent unauthorized access.
For the sake of clarity, the term **hardware firewall** is a little misleading here. This is because a firewall is always based on software. Hardware firewall only describes the fact that this security software is housed on separate hardware.

<!-- FM:Snippet:Start data:{"id":"Visit Help-page","fields":[]} -->
> ## Questions and answers
> 
> If you have any questions or feedback about this blog or YouTube channel, please use my help page. Here you will find questions and answers about the various posts. You are also welcome to ask your own question here.
>
> [**Visit the Help-page**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->