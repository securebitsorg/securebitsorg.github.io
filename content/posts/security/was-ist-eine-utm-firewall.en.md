---
title: What is a Unified Threat Management Firewall?
date: 2025-07-25T05:22:28.741Z
categories:
- Network
- Security
- Tutorials
- Firewall
tags:
- firewall
- network
- security
preview: ../../../assets/images/posts/it-security/UTM-Diagramm.png
hero: /images/posts/it-security/UTM-Diagramm.png
menu:
  sidebar:
    name: What is a UTM firewall?
    identifier: utm
    parent: security
keywords:
- Unified Threat Management
description: In this article, you will learn what a Unified Threat Management Firewall (UTM for short) is.
slug: what-is-a-unified-threat-management-firewall
---
## Unified Threat Management Appliances (UTM Firewall)
In my article “[How does a firewall work?](https://secure-bits.org/en/posts/security/wie-funktioniert-eine-firewall/)", I described how a firewall is structured and the differences between the various types of firewalls.
In this article, I would like to give you a closer look at how a Unified Threat Management (UTM or UTM firewall) works and explain the individual functions and technical terms.
## What is the difference between a UTM firewall and a normal firewall?
There is a clear definition of this term, which specifies the designation of a security component (security appliance). For example, a pure firewall is referred to as a Specialized Security Appliance (SSA), as this network security component performs a clearly defined task in the security system. In this case, it is to prevent network connections according to a defined set of rules.
UTMA / UTM refers to security network components that combine several security components (Specialized Security Appliances (SSA)) of a network. You can find out what these are in the next paragraph.
## What does a unified threat management system include?
A network security system that can be called a UTM must have several features or functions. This range of functions was defined by Charles Kolodgy of the International Data Corporation in 2004.
This definition specifies the features that a unified threat management appliance (UTMA) must include.


![UTM diagram](/images/posts/it-security/UTM-Diagramm.png)
## Unified Threat Management – Features and functions:
- Internet gateway
- [Firewall](https://secure-bits.org/en/posts/security/wie-funktioniert-eine-firewall/)
- Virtual Private Network Gateway (VPN)
- Virus protection
- Intrusion Detection System
- Content filter
- Spam protection
- Surf protection
- Authentication
- Quality of Service (QoS)
- Reporting
### Intrusion detection and intrusion protection systems explained
### What is an intrusion detection system?
An intrusion detection system (IDS) is an attack detection system that uses filters and signatures as well as static analysis to detect and log attacks on the network.
Unlike an intrusion prevention system (IPS), an intrusion detection system only detects attacks on a computer network and logs them.
  
As already mentioned, an intrusion prevention system (IPS) not only detects and logs attacks on the network, but also defends against or blocks them.
Since both systems work on the basis of filters and signatures, the use of such a network security system is very resource-intensive and requires powerful hardware depending on the size of the data volumes to be processed.
Furthermore, there are also two system variants that not only perform their tasks using filters and signature rules, but also check unknown attacks using heuristic methods.
In most unified threat management systems, the IPS or IDS systems are activated manually by the administrator and the filters are administered.
- There are three common types of IDS systems:
- Hybrid IDS systems
- Network-based IDS systems (NIDS)
- Host-based IDS systems (HIDS)
### Surf protection / web content filter
Another feature that a UTM firewall must provide according to the definition of a unified threat management appliance is the functionality of so-called surf protection or a web content filter.
#### Simple content filter
Here, content is filtered according to surfing protection rules when Internet requests are made. This filtering takes place in various ways. In simple terms, character strings are checked in advance, usually via a web proxy (in the case of a central network content filter), using specific character filters (sex, hate, etc.) and only passed on to the respective client after a successful non-positive check. Certain ports can also be blocked.
One disadvantage of this method is that content containing part of these character strings in their character string is also blocked. For example, the filter word “law” also blocks content such as law studies.
#### Intelligent content filter
Intelligent content filters are characterized by the fact that they achieve a better hit rate using heuristics and weighting. For example, plausibility checks are used to weigh up whether the content to be searched is a website that can be blocked. 
Here, a distinction is made between right-wing extremist sites (their content) and sites about law, for example.
Some UTMA systems also use artificial intelligence-supported processes or offer them as add-on applications.
**Further links on this topic:**
[Content filter – Wikipedia](https://de.wikipedia.org/wiki/Contentfilter)
### Internet gateway
An internet gateway is the interface that enables the internal network to connect to the internet.
Some systems (UTM firewalls) offer modem functionality for various types of internet connections to replace service provider routers.
### Virtual Private Network Gateway (VPN)
A secure virtual private network connection is essential for securely connecting remote workstations to the company network, for example, or for securely controlling your smart home infrastructure at home.
This purely software-based technology uses a virtual network area to integrate a remote network into your existing network. It should be noted that this VPN connection is not inherently encrypted. Encryption is only provided by the use of various VPN protocols, which ensure a tap-proof connection between the VPN gateway of your Unified Threat Management firewall and the client or other VPN gateway.
 
#### Most commonly used VPN protocols for unified threat management firewalls:
- SSL VPN
- IPsec
- TLS/SSL
- SSH
- Wireguard
- SSTP
- L2TP
- getVPN
### Authentication UTM firewall
A Unified Threat Management / UTM firewall also includes an authentication feature. This feature allows users to authenticate themselves to the system or the service being used, providing an additional layer of security so that only known clients can connect to the gateway via a VPN connection, for example.
Depending on the manufacturer, various authentication services are available.
#### Here is a selection of authentication services:
- Radius server
- Database-based authentication
- LDAP authentication
- Active Directory
### Virus protection
Virus protection in a Unified Threat Management System refers to an antivirus security solution that is permanently implemented in the UTM firewall and checks data blocks for malicious code using signatures.
Open source firewalls such as **OPNSense**, **IPFire**, or **pfsense** use **ClamAV** as their antivirus solution. Firewall distributions from paid providers often use their own scan engine or solutions from well-known antivirus manufacturers.
 For example, the manufacturer Sophos uses its own antivirus solution engine in its [Sophos UTM product](https://www.sophos.com/de-de/products/unified-threat-management.aspx) and the engine from Avira as an additional scanning solution.

<!-- FM:Snippet:Start data:{"id":"Visit Help-page","fields":[]} -->
> ## Questions and answers
> 
> If you have any questions or feedback about this blog or YouTube channel, please use my help page. Here you will find questions and answers about the various posts. You are also welcome to ask your own question here.
>
> [**Visit the Help-page**](https://help.secure-bits.org/help)
<!-- FM:Snippet:End -->