---
title: Change FritzBox DNS server
hero: /images/posts/fritzbox/Video-FritzBox-Teil-3.png
descripton: Change FritzBox DNS server | In this video, I'll show you how to change the public DNS server of a Fritzbox.
menu:
  sidebar:
    name: Change the public DNS server/resolver on a Fritzbox
    identifier: fritzbox-dns-resolver
    parent: fritzbox
date: 2022-06-20
categories:
  - “Network”
  - “Tutorials”
tags:
  - tutorials
---
## Video tutorial - Protect your privacy with the FritzBox
In this video, “**Change FritzBox DNS server**,” I show you how you can prevent your internet provider from tracking your internet usage by using public DNS servers that comply with data protection regulations.
{{< youtube Q2b0VrDqluY >}}
Feel free to subscribe to my YouTube channel so you don't miss any new content.
### List of DNS servers used in the video
Here you will find an overview of the DNS servers I use, whose operators are committed to protecting the privacy of their users.
**For security reasons, I would personally prefer a DNS server with DoT (DNS over TLS).**
#### digitale-gesellschaft.ch
```sh
IP address IPv4: 185.95.218.42
```
```sh
IP address IPv6: 2a05:fc84::42
```
```sh
DNS resolver DoT: dns.digitale-gesellschaft.ch
```
#### Freifunk Munich
```sh
IP address IPv4: 5.1.66.255
```
```sh
IP address IPv6: 2001:678:e68:f000::
```
```sh
DNS resolver DoT:   dot.ffmuc.net
```
### DNS leak test
To check the DNS configuration for DNS leaks after configuring your FritzBox, you can simply use the DNS leak test from Perfect Privacy.
[http://dns-leak.com/](http://dns-leak.com/)


