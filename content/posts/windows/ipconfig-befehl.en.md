---
title: ipconfig-command
description: Master the ipconfig command to troubleshoot network issues and optimize your internet connection effortlessly.
date: 2025-07-23T07:50:18.409Z
preview: ../../../assets/images/posts/windows/ipconfig_all.png
draft: false
tags:
    - windows
    - cmd
    - powershell
    - tutorial
categories:
    - Tutorial
    - Windows
    - Network
hero: /images/posts/windows/ipconfig_all.png
keywords: ipconfig
slug: ipconfig-command
menu:
    sidebar:
        parent: windows
        identifier: ipconfig
        name: The ipconfig command overview
---
You can find an **overview of all CMD commands** in **[**this article**](https://secure-bits.org/cmd-befehle-unter-windows-im-ueberblick/)**
## ipconfig commands at a glance
If you often make changes to your IP address or DNS resolution, for example because you use multiple DNS servers, you will be familiar with the problem that configuring the network adapter using the standard board tools (GUI) is not exactly convenient. The command line (CMD or Powershell) is ideal for this purpose. This overview shows which commands, including the **ipconfig** command, are available for the individual actions to change the settings of the network adapters.  
In this overview, the **CMD** command prompt is used. This command prompt is called up by typing ‘cmd’ in the Windows search field. The fastest way to access the search field is by pressing the **Windows key + R**.
### ipconfig /all
To get an overview of the physical addresses, the IP addresses used, the DHCP server, and the DNS server used for the individual network adapters, use the command **ipconfig /all**.
![ipconfig_all](/images/posts/windows/ipconfig_all.png)
### ipconfig /flushdns
This command clears the DNS resolution cache. This function is useful if, for example, there are problems with DNS resolution because the DNS server settings have been changed. This command initiates a new query of the DNS server settings.
![ipconfig_flushdns](/images/posts/windows/ipconfig_flushdns.png)

### ipconfig /renew
The command **ipconfig /renew** is used for IPv4 address ranges and the command **ipconfig /renew6** for IPv6 address ranges to request a new IP address for the network adapters connected via the TCP/IP protocol.
![ipconfig_renew](/images/posts/windows/ipconfig_renew.png)
<figure>
<figcaption>
ipconfig /help
### Ipconfig /release
To release existing IP addresses of the network adapters, this command is used for IPv4 address ranges or **ipconfig /release** for IPv6. To then obtain a new IP address via DHCP, use the previous command <**ipconfig /renew**\>.
![ipconfig_release](/images/posts/windows/ipconfig_release.png)

### ipconfig /displaydns
This command is used to display the contents of the DNS resolution cache.
![ipconfig_displaydns (Excerpt from the output window)](/images/posts/windows/ipconfig_displaydns.png)

### Addressing network adapters
Most ipconfig commands also allow you to address individual network adapters directly. To do this, append the name of the network adapter to the basic command after the actual ipconfig command (example: `ipconfig /renew Name\_Network adapter`). If there are multiple network adapters, they can also be limited by adding `\*Net\` (executes the command on all network adapters that have “Net” in their name) or `Ne\*` (executes the command on all network adapters that begin with “Ne” in their name).
An overview of all variants available with the ipconfig command is listed with the commands **ipconfig /help** or **ipconfig /?**.
![ipconfig_help](/images/posts/windows/ipconfig_help.png)

