---
hero: /images/posts/linux/traceroute.png
preview: ../../../assets/images/posts/linux/traceroute.png
title: The traceroute command in Linux
description: The traceroute command in Linux | Comprehensive guide with examples
menu:
    sidebar:
        name: The traceroute command in Linux with omprehensive instructions and examples
        identifier: traceroute
        parent: linux
date: 2025-07-30T09:18:12.930Z
lastmode: 2025-07-30T09:18:16.581Z
keywords:
    - traceroute
    - traceroute command
tags:
    - linux
    - network
    - tutorials
categories:
    - Linux
    - Tutorials
    - Network
---
## The traceroute command in Linux with comprehensive instructions and examples
The `traceroute` command is an indispensable network diagnostic tool for IT security managers and system administrators. It allows you to trace the path that data packets take from your system to a destination on the network, helping you to identify and resolve network problems.
In this article, I would like to give you a closer look at the functionality of **traceroute**.
## What is traceroute?
**traceroute** is a command line tool that determines the transport path of IP data packets between the local computer and a selected remote station. It measures the response time of the routers passed through, which helps identify delays and network problems.
## How traceroute works
The tool cleverly uses the **Time-to-Live (TTL)** field in IP packets:
1. **First probe**: traceroute sends a packet with TTL=1 to the destination.
2. **Router response**: The first router reduces TTL to 0 and sends back a “Time Exceeded” message.
3. **Identification**: traceroute notes the IP address of this router.
4. **Repetition**: The TTL value is increased by 1 and the process is repeated.
5. **Destination reached**: This continues until the destination is reached or the maximum of 30 hops is reached.
By default, traceroute sends **three probe packets** per hop and displays the response times in milliseconds.
## Installing traceroute
Traceroute is not installed by default on all Linux distributions. It can be installed using the package manager:
### Ubuntu/Debian-based systems:
```bash
sudo apt update
sudo apt install traceroute
```

### CentOS/RHEL/Fedora:
```bash
sudo yum install traceroute
# or on newer systems:
sudo dnf install traceroute
```

### Checking the installation:
```bash
traceroute --version
```

## Basic usage
### Simple traceroute command:
```bash
traceroute google.com
```
**Example output:**
```bash
traceroute to google.com (172.217.23.14), 30 hops max, 60 byte packets
 
1  10.8.8.1 (10.8.8.1)  14.499 ms  15.335 ms  15.956 ms
2  h37-220-13-49.host.redstation.co.uk (37.220.13.49)  17.811 ms  18.669 ms/images/posts/linux/traceroute.png  19.346 ms
3  92.zone.2.c.dc9.redstation.co.uk (185.20.96.137)  19.096 ms  19.757 ms  20.892 ms
```

### Interpretation of the output:
- **First line**: Destination host, IP address, maximum hops (30), packet size (60 bytes)
- **Each hop line**: Hop number, host name/IP address, three response times in milliseconds

## Practical application examples
### 1. Force traceroute with IPv4:
```bash
traceroute -4 google.com
```

### 2. Traceroute with IPv6:
```bash
traceroute -6 google.com
```

### 3. Use ICMP packets (instead of UDP):
```bash
traceroute -I google.com
```

### 4. TCP-based traceroute (for firewall bypass):
```bash
traceroute -T -p 80 google.com
```

### 5. Without name resolution (faster):
```bash
traceroute -n google.com
```

### 6. Limit maximum number of hops:
```bash
traceroute -m 15 google.com
```

### 7. Change number of probes per hop:
```bash
traceroute -q 1 google.com
```

### 8. Adjust wait time:
```bash
traceroute -w 3 google.com
```

### 9. Use specific interface:
```bash
traceroute -i eth0 google.com
```

### 10. MTU detection:
```bash
traceroute --mtu google.com
```

## Differences between various traceroute methods
### UDP (default under Linux):
- Uses “unlikely” ports (33434-33534)
- Target host responds with “ICMP Port Unreachable” when reached

### ICMP (with -I option):
- Uses ICMP Echo Request packets
- Similar to ping, but with TTL manipulation

### TCP (with -T option):
- Uses TCP SYN packets
- Useful for bypassing firewalls
- Default port: 80 (HTTP)

## Overview of all traceroute options
![Overview of all available traceroute options with descriptions and examples](/images/posts/linux/traceroute.png)
Overview of all available traceroute options with descriptions and examples
## Troubleshooting and common problems
### Asterisk (*) in the output:
- Meaning: No response within the timeout period
- Possible causes: Firewall, router configuration, overload

### Additional annotations:
- **!H**: Host unreachable
- **!N**: Network unreachable
- **!P**: Protocol unreachable
- !F**: Fragmentation needed
- !X**: Communication administratively prohibited
### Performance optimization:
```bash
# For more stable results with problematic connections:
traceroute -N 1 -w 5 google.com
# For faster results without DNS resolution:
traceroute -n google.com
```

## Differences from Windows tracert
While Linux uses `traceroute` **UDP packets** by default, Windows uses `tracert` **ICMP packets**. To achieve the same behavior on Linux as on Windows, use:
```bash
traceroute -I google.com
```

## Advanced use for IT security
### AS path lookups for routing analysis:
```bash
traceroute -A google.com
```

### Firewall tests with different ports:
```bash
traceroute -T -p 443 bank-website.com  # HTTPS
traceroute -T -p 25 mail-server.com    # SMTP
```

### Check network segmentation:
```bash
traceroute -s 192.168.1.100 internal-server.com
```

## Best practices for IT security managers
1. **Combine traceroute with other tools**: Use ping and mtr for comprehensive diagnostics
2. **Document baselines**: Save normal traceroute results for comparison
3. **Monitor critical paths**: Regular traceroute tests to important servers
4. **Be aware of data protection**: traceroute can reveal network structures
5. Use different methods: TCP, ICMP, and UDP for a complete view
## Conclusion | traceroute on Linux
The traceroute command is a powerful tool for network diagnostics and should be part of every IT security toolkit. By understanding its various options and uses, you can efficiently identify and resolve network issues.

<!-- FM:Snippet:Start data:{"id":"Visit Help-page","fields":[]} -->
> ## Questions and answers
> 
> If you have any questions or feedback about this blog or YouTube channel, please use my help page. Here you will find questions and answers about the various posts. You are also welcome to ask your own question here.
>
> [**Visit the Help-page**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->

