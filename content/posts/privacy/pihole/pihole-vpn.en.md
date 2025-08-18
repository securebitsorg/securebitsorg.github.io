---
title: Use Pihole VPN with Wireguard in 2024
date: 2024-02-27
hero: /images/posts/pihole/pihole-raspberry-vpn.png
menu:
  sidebar:
    name: Pi-hole with WireGuard and piVPN
    identifier: pihole-vpn
    parent: pihole
categories:
  - Security
  - Tutorials
  - Video
tags:
  - network
  - pi-hole
  - privacy
  - tutorials
description: Use Pihole VPN with Wireguard | In this tutorial, I will show you how you can use Pihole on the go with the help of VPN.
keywords:
  - pihole vpn
preview: ../../../../assets/images/posts/pihole/pihole-raspberry-vpn.png
---
## Pihole VPN - No ads on your smartphone
In this tutorial, ‘**pihole VPN with Wireguard**’, I would like to show you how you can use the ‘**PiVPN**’ application to access your **Pihole** on your **smartphone, tablet, or laptop** and thus enjoy the benefits of Pihole, namely surfing without annoying ads, even when you're **on the go**.
I'll show you how it all works in my video on my YouTube channel!


### Prerequisites for this tutorial
To make setting up a VPN server with Pi-hole as easy as possible, your setup must meet the following requirements.

> ### Note
>
> **If you do not meet these requirements, you can recreate the individual requirements here:**
>
> - [Install Pi-hole](https://secure-bits.org/pi-hole-auf-einen-raspberry-pi-installieren/ “Install Pihole on a Raspberry Pi”)
>
> - [Pi-hole and Fritzbox](https://secure-bits.org/fritzbox-pi-hole-fritzbox-konfigurieren/ “Configure Fritzbox for Pihole”)
>
> - DynDNS with DuckDNS
> - Optionally, I would recommend securing SSH access
Secure SSH access
- **A finished and running Pi-Hole instance on a Raspberry Pi or similar (VM, Banana Pi, etc.).**
- **The Pi-hole is set up as an internal DNS server on your Fritzbox.**
- **You have set up a DynDNS address in your Fritzbox (e.g., DuckDNS).**
Optional:
- **Secure SSH access**
## Video tutorial on ‘pihole VPN with Wireguard’.
{{< youtube 4N0fkV7nS6k >}}
## Commands for setting up Pi-hole, PiVPN, and WireGuard
All commands I use in the video to install PiVPN and configure Pi-hole and WireGuard are listed here in chronological order.
### Please note!
This blog post only summarizes the commands for installing and setting up PiVPN with Pi-hole. **You can see the individual setup steps in the video!**
### Pihole VPN - Installing the UFW firewall
To secure the Raspberry Pi with Pi-hole and PiVPN, the UFW firewall is installed and configured on the system.
```bash
# Installing the UFW firewall
sudo apt install ufw
# Configuring the UFW firewall
sudo ufw allow 80,53,67/tcp
# Only allow SSH access from your internal network area. Important!!! Adjust the IP address range (in this example 192.168.178.0/24) to your network area if necessary
sudo allow from 192.168.178.0/24 to any port 22/tcp<figcaption>
sudo ufw allow 53,67,58120/udp # 51820 is the port for WireGua<figcaption>
# When using IPv6
sudo ufw allow 546:547/udp
# Activating the firewall
# Please note that the correct port for SSH is specified above in the rules! Otherwise, you will lock yourself out via SSH!
sudo ufw enable 
```
### Pihole VPN - Installing and setting up PiVPN on the Raspberry Pi
Here are the commands for installing PiVPN on the Raspberry Pi.
```bashPihole VPN jetzt mit Wireguard nutzen | In diesem Tutorial zeige ich euch, wie ihr Pihole mit Hilfe von VPN auch von Unterwegs aus nutzen könnt
# Command to install PiVPN
sudo curl -L https://install.pivpn.io | bash
```
#### PiVPN WireGuard - Command list
Here is a list of all commands for configuring WireGuard under PiVPN as well as the PiVPN package itself.
```bash
# List of all commands for PiVPN WireGuard
pivpn -a   -> Create client
pivpn -c   -> List all connected clients
pivpn -d   -> Start a debugging session for troubleshooting
pivpn -l   -> List all configured clients
pivpn -qr  -> Display a QR code for configuring a mobile client (e.g., cell phone, tablet with the WireGuard app)
pivpn -r   -> Delete a client
pivpn -h   -> Display the help dialog
pivpn -u   -> Uninstall PiVPN
pivpn -up  -> Update PiVPN
pivpn -bk  -> Create a backup of the VPN configurations and user profiles
```
### Additional information on the topic ‘Pi-hole VPN’
For more information on this topic, I have compiled some links here:

**Everything about WireGuard:**

- [https://www.wireguard.com/](https://www.wireguard.com/)

**Everything about PiVPN:**

- [https://docs.pivpn.io/](https://docs.pivpn.io/)

- [https://github.com/pivpn/pivpn](https://github.com/pivpn/pivpn)

<!-- FM:Snippet:Start data:{"id":"Visit Help-page","fields":[]} -->
> ## Questions and answers
> 
> If you have any questions or feedback about this blog or YouTube channel, please use my help page. Here you will find questions and answers about the various posts. You are also welcome to ask your own question here.
>
> [**Visit the Help-page**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->