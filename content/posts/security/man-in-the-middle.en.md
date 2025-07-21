---
title: “Understanding Man-in-the-Middle Attacks”
description: “Man-in-the-middle attack – definition | This attack tactic is often mentioned in the press and other publications. But what exactly is it and how does it work?”
draft: true
hero: /images/posts/it-security/Man-in-the-Middle-Angriffe-abwehren.jpg
date: 2021-01-25
menu:
  sidebar:
    name: Understanding Man-in-the-Middle Attacks
    identifier: man-in-the-middle
    parent: security
categories:
- “Network”
- “Security”
tags:
- “firewall”
- "network"
- “security”
---

## Man-in-the-middle attack – definition
Today's post is about **man-in-the-middle attacks**. This attack tactic is often mentioned in the press and other publications. But in this article, I would like to explain exactly what it is and how it works.

> If anything is unclear or you have further questions on this topic, please contact me via the [contact form](mailto:ticket@secure-bits.org).

![Man in the Middle Sniffing](/images/posts/it-security/ManintheMiddle-Sniffing.png)    

### What is a man-in-the-middle attack?
A man-in-the-middle attack is a scenario in which a communication path (see image above) between two communication partners is intercepted by a third party or the data stream is redirected via the third party's attack computer.
This scenario can be carried out at various points in the communication path's network. The network points can be compromised network or user devices, for example.  
Famous examples of such attacks include the so-called Bundestrojaner, which is once again the talk of the town due to the debate about breaking the encryption of encrypted messenger services, and the interception of Internet service provider nodes by the friends of the National Security Agency (Wikipedia) (https://de.wikipedia.org/wiki/National_Security_Agency), which became known to the general public through the Snowden leaks.
### How does a man-in-the-middle attack work?
There are basically two types of attack scenarios. In these scenarios, the attacks are divided into two methods.

- **Method 1 refers to eavesdropping/recording the communication path**
- **Method 2 refers to redirecting a communication path to, for example, an attacker's computer.**
### Method 1 – Eavesdropping/recording a communication path (sniffing)

![Man in the Middle Bypass](/images/posts/it-security/ManintheMiddle-Umleitung)     

In sniffing, a network sniffer or mirror port is used to record or eavesdrop on the communication between two communication partners on the communication path.
By using a software tool such as **[Wireshark](https://www.wireshark.org/)** (there are countless other software tools available), the data stream of the communication path can be compromised. To do this, the attacker must compromise a network point (end device, network device, or server) in the communication path using the sniffing tool. Furthermore, a mirror port can be used on the switch to mirror the port and thus the data packets of the connected computer to be compromised to the attacker's computer.
By eavesdropping, ports, IP addresses, protocols, and communication forms can be analyzed in detail, which is why this method is often used to scout and prepare an attack.
Types of attacks include password attacks, detecting unauthorized communication between two communication partners, determining the type of applications used on the communication devices, identifying forms of attack that can be used later through security vulnerabilities, and skimming access data.
The advantage of this passive eavesdropping method is that it is difficult to detect and therefore difficult to defend against.

### Method 2 – Redirecting data packets / classic man-in-the-middle attack
With this method, the attacker uses various redirection methods to prevent data from being sent via the intended communication path and instead redirects the data packets.
In this case, the hacker's point of attack (e.g., proxy server) pretends to be the other communication partner when two endpoints are communicating and can thus compromise the connection.
As already mentioned, several methods can be used for this purpose. The most common methods are the following.
On the one hand, the user device is redirected to the attacker's device and forwarded to the other endpoint of the communication path (web server, end device, etc.). On the other hand, the redirection is not routed via the network's intended standard gateway, but via a proxy server or by redirection to the other communication partner (see Figures 1 and 2 below).

![Man in the Middle Proxy](/images/posts/it-security/ManintheMiddle-Umleitung-proxy.png)

One disadvantage of this active method is that it is easier to detect, as it actively interferes with the communication path.
In contrast to sniffing, not only can data packets or the communication of participants be intercepted/collected, but the communication can also be intercepted/modified so that the other participant is unaware of this. This means that the problems are more diverse and can cause massive damage.

**Examples include:**

- Theft of access data
- Interception of tokens such as TANs for online banking
- Exchange of information, for example to redirect bank transfers to a different bank account
- Theft of credit card data
- And many other scenarios

## Conclusion on man-in-the-middle attacks
This article is only a brief introduction to how a man-in-the-middle attack works, as this topic is very comprehensive.
I will explore this topic in more detail in future articles, giving you an even deeper insight into this subject.
But first, I would like to make one thing clear: Please make sure that all your communications are encrypted in future. This encryption should not only apply to communication on the Internet via protocol 443 or 8443, but also to other types of communication.
Examples include messenger services (Signal, Matrix, Threema), file exchange via sftp or ssh, use of encrypted VPN connections, and so on...
## Protection against man-in-the-middle attacks
Find out how you can protect yourself and your network from such attacks in the next article.
