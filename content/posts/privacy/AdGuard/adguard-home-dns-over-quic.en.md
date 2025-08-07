---
title: AdGuard Home DNS encryption
description: AdGuard Home DNS encryption | In this video, I'll show you how to set up DNS over Quic.
hero: /images/posts/adguard/Video-AdGuard-Raspberry-Pi-Installation.png
date: 2022-12-27
menu:
  sidebar:
    name: AdGuard DNS encryption with DNS over QUIC
    identifier: adguard-dns-over-quic
    parent: adguard
categories:
- “linux”
- “network”
- ‘security’
- “tutorials” 
- “video”
tags:
- adguard
- network
- security
- tutorials
- video
---
## AdGuard Home DNS encryption with DNS over QUIC
In this video tutorial on [**my YouTube channel**](https://www.youtube.com/channel/UCr-cuwB555JmAm4F412KZ2Q), I show you step by step how you can encrypt external DNS requests from AdGuard Home using the “new” encryption protocol ‘**DNS over QUIC**’.
### AdGuard Home DNS encryption - Video
{{< youtube mog1eFUUc3Y >}}
### Installing AdGuard Home
If you want to know how to install AdGuard Home on a Raspberry Pi, for example, you can check out this [**guide**](https://secure-bits.org/adguard-raspberry-pi-installation-2022/) or this [**video**](https://youtu.be/PF2WH2llwSg).
## Public recursive DNS servers that support DNS over QUIC
Here are some public recursive DNS servers that I know of that support the DNS over QUIC protocol. You can use these for AdGuard Home DNS encryption.
#### Public DNS servers from AdGuard
- Unfiltered DNS queries for free

```sh
quic://unfiltered.adguard-dns.com
```
##### DNS servers with customizable filtering for up to 300,000 requests free of charge
If you would prefer to protect your requests from advertising, tracking, and malware using a DNS filter, AdGuard DNS offers an easy way to configure your own DNS server for your requests.
Here you can select block lists, block services, activate “child protection” if necessary, and configure several other settings.
Filtering DNS requests using your custom filter is free for up to 300,000 requests per month. Once the request limit is reached, the DNS server will continue to function, but the configured filter will no longer be active. If you want to continue using the filter, you can purchase a license for $19.99 per year and get 10,000,000 requests per month.
Users with an AdGuard VPN subscription have the DNS server included in their subscription, including 10,000,000 DNS requests.
[https://adguard-dns.io/de/welcome.html](https://adguard-dns.io/?aid=33604)
#### Public DNS server from NextDNS
[https://nextdns.io](https://nextdns.io/?from=rgjtxk2k)
As with AdGuard DNS, DNS filters can be freely configured for each device.
With NextDNS, you can try it out for free for 7 days without registering. After that, you can either subscribe for $1.99/month or $19.90/year, or you can use 300,000 requests per month for free.
- Free DNS server (up to 300,000 requests)
- Free access for 7 days, then further DNS server use without filtering and protection
- Subscription with unlimited DNS requests for €19.90/year
#### Public DNS server from dnsforge
German private public DNS server from adminforge. This service is funded by donations and should also be supported [**by a donation**](https://adminforge.de/unterstuetzen/).
##### DNS server with advertising/tracking protection and protection against malware domains
```sh
quic://dnsforge.de:853
```
##### DNS server with additional youth protection filter
```sh
quic://clean.dnsforge.de:853
```
#### DNS server from BlahDNS
Free public recursive DNS server based on [**donations**](https://blahdns.com/#donate).
- Provides protection against ad tracking, malware, and CNAME cloaking
Please change the **default port from 853 to 784** in the AdGuard Home encryption settings for BlahDNS.
##### BlahDNS DNS server in Germany
```bash
quic://dot-de.blahdns.com:784
```
