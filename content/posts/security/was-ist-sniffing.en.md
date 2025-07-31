---
title: Network Sniffing – Secure Communication in Networks
date: 2018-08-26
categories:
- Network
- Security
- Tutorials
tags:
- network
- security
- tutorials
description: In this article, I describe what network sniffing is and how you can protect yourself against it.
preview: ../../../assets/images/posts/it-security/yarn-phone-2091195_640.png
hero: /images/posts/it-security/yarn-phone-2091195_640.png
menu:
  sidebar:
    name: What is network sniffing?
    identifier: sniffing-en
    parent: security
lastmode: 2025-07-28T12:24:15.525Z
keywords:
- network sniffing
---
## How can you protect yourself against network sniffing?
Most of you have probably read or heard somewhere that everyone is talking about secure communication. But what is secure communication and why can normal communication channels be intercepted (sniffed)? In this article, I would like to address the topic of “sniffing” and show you how you can protect yourself against such sniffing attacks.
Following Edward Snowden's revelations, you are probably all familiar with the concept of communication channels being tapped. Tapping or sniffing can be done on both a small and large scale. Secret services use entire nodes of our ISPs (Internet Service Providers) for tapping, and on a smaller scale, this can of course also be done in your company or at home.
There are, of course, several measures that can be taken to compromise a communication channel. In this article, however, I would like to focus on what is known as “sniffing.”
## What is sniffing?
Sniffing refers to the interception or recording of data packets in a communication connection. For example, the clients of one of the two communication partners are compromised with malware containing a sniffing tool, and the data packets sent and received are then recorded.
If these data packets are transmitted unencrypted, they may also contain passwords, which are then transmitted in plain text and can be read and used by the attacker.

> **Please note!** None of the measures shown here offer 100% protection against attacks!
## What measures help against network sniffing?
### Network components
First, it is important to divide a network into its components (network components) in order to implement appropriate protective measures for these network components.
The network components are divided into two groups:> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen.  Sie können dort auch gerne Ihre eigene Frage stellen.

- **Active network components**
- **Passive network components**
## What are active network components?
Active network components are devices that actively process and amplify signals and require a power supply to do so.
Active network components include:
- [Firewalls](https://secure-bits.org/die-funktionsweise-einer-firewall/)
- **Switches**
- **Hubs**
- **Routers**
- **Access points**
- **Network cards**
- **ISDN cards**
- **etc.
## What are passive network components?
Passive network components are components in the network that do not require a power supply.
**Passive network components include:**
- **Network cabling**
- **Patch cables**
- **Network connection sockets**
- **etc.
## Measures to protect active network components from network sniffing attacks
#### Access control
To protect active network components, access to the administration interface (SSH or web browser) should be securely protected, and unused ports should be disabled on managed switches. For example, unused ports on a switch should be protected against unauthorized access by external influences.
### Monitoring endpoints in the network (client and server)
High priority for protection against sniffing is above all that the endpoints in the network are protected by suitable monitoring tools (protection against malware by antivirus software, IPS, etc.). Sniffing tools are particularly dangerous for reading network traffic at endpoints, as encryption can be easily circumvented at the endpoints of a data connection, for example by using the “https - Hypertext Transfer **Protocol** Secure” protocol (end-to-end encryption).
Furthermore, it cannot be emphasized enough that it is essential to install security patches for the operating system and software used in a timely manner and that this should be done conscientiously. It is easy for attackers to take control of a system riddled with security vulnerabilities by using > Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen.  Sie können dort auch gerne Ihre eigene Frage stellen.
exploits and other scripts! Therefore, I would like to emphasize this point:
**Please note!** Always install security updates for your operating system and the software you use! This procedure cannot be emphasized enough!
Furthermore, you should not work with administrative privileges, but assign restricted user rights for daily work on your PC. You can ensure this in Windows, for example, by using a standard user account. This minimizes the risk of accidentally installing malicious programs.
## Network sniffing – encryption of communication
A really important and highly recommended security measure is to use encrypted connections whenever possible. These encrypted connections, such as **“https”**, **“sftp”**, “SSH” and the use of VPN connections in public Wi-Fi networks protect you from attacks by ‘sniffing’ and also from “man-in-the-middle attacks”. However, it should be noted that security is only guaranteed with end-to-end encryption, i.e. from computer to computer or computer to server.
End-to-end encryption should also be used for messaging apps to prevent third parties from eavesdropping. The messaging apps Signal, Wire and Threema (Telegram only encrypts “secure chats” to a limited extent) use end-to-end encryption to protect connections, making these messengers the clear choice for secure communication over competitors such as WhatsApp or similar standard messenger apps!
Furthermore, when selecting Wi-Fi networks, you should also ensure that they use a secure encryption standard.
## Measures to protect passive network components from network sniffing attacks
To protect passive network components, you should, for example, ensure that access to the server room in companies is restricted so that only authorized personnel can enter this room. Network distribution cabinets in other parts of the building should also be lockable and secured against unauthorized access.
Unused network connections can be secured with mechanical locks, known as port locks (e.g., [these ones from Lindy](https://amzn.to/2wr1YQ9)).
In general, it is recommended that only managed switches be used for data packet distribution in corporate networks, as these actively prevent unauthorized access by third parties by disabling unused network ports.
## Conclusion – Network sniffing attacks
If you follow and implement the security tips I have listed in this article, the risk of your data connections being spied on, eavesdropped on, or read should be minimized.
 
However, the greatest danger in an IT network is and remains the user themselves. Most attacks on a computer network are caused by careless actions. This danger can only be minimized by educating users and should be a high priority when eliminating sources of danger in your computer network infrastructure. A good example of this is the famous abandoned USB stick that is quickly plugged into a computer. Raising awareness of this issue is the first rule in a secure IT environment. 
However, one thing should be clear: there is no such thing as absolute protection!
> Write to me!
>
> If you have any questions, don't like something, or have found any errors, please leave a comment. You are also welcome to send me questions using the contact form.

<!-- FM:Snippet:Start data:{"id":"Visit Help-page","fields":[]} -->
> ## Questions and answers
> 
> If you have any questions or feedback about this blog or YouTube channel, please use my help page. Here you will find questions and answers about the various posts. You are also welcome to ask your own question here.
>
> [**Visit the Help-page**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->