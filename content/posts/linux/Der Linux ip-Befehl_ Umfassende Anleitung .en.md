---
title: "The Linux ip command: Instructions for network configuration"
description: The modern Linux IP command for network configuration under Linux.
date: 2025-07-29T08:09:53.919Z
preview: ../../../assets/images/posts/linux/compressed-ip-befehl.png
tags:
    - linux
    - tutorials
    - network
categories:
    - Network
    - Tutorials
    - Linux
hero: /images/posts/linux/compressed-ip-befehl.png
menu:
    sidebar:
        name: The Linux IP configuration command 'ip'
        identifier: ip-en
        parent: linux
lastmode: 2025-07-29T08:11:29.722Z
keywords:
    - ip command
---
## The modern Linux IP command for network configuration under Linux
The `ip` command is the central tool for network configuration under Linux and has established itself as a modern replacement for outdated commands such as `ifconfig`, `route`, and `arp`. As part of the iproute2 collection, it provides a unified interface for all aspects of network management and is available by default in all modern Linux distributions.
## What is the ip command?
The `ip` command is a versatile network configuration tool from the iproute2 collection, originally developed by Alexey Kuznetsov and now maintained by Stephen Hemminger. It uses the Linux Netlink interface for direct communication with the kernel, providing advanced functionality not available with the classic net tools.
## Basic syntax and structure of the IP command
### General syntax
The basic syntax of the `ip` command follows this pattern:
```
ip [OPTIONS] OBJECT {COMMAND | help}
```
The individual components stand for:
- **OPTIONS**: Additional parameters for modifying the command behavior
- **OBJECT**: The network area to be managed
- **COMMAND**: The action to be performed
- **help**: Displays help information
### Important options
| Option | Description                            |
|:------ |:--------------------------------------- |
| `-4`   | Display IPv4 addresses only      |
| `-6`   | Display only IPv6 addresses      |
| `-c`   | Enable colored output    |
| `-s`   | Display statistics          |
| `-d`   | Output detailed information |
| `-j`   | JSON-formatted output          |
| `-h`   | Use human-readable values   |
| `-br`  | Brief output              |
## Main objects of the ip command
### address (addr, a) - IP address management with the IP command
The `address` object manages IPv4 and IPv6 addresses on network interfaces.
#### Basic commands:
| Command       | Description                             | Example                               |
|:------------ |:---------------------------------------- |:-------------------------------------- |
| `show/list`  | Display IP addresses                     | `ip addr show` or `ip a`             |
| `add`        | Add IP address                    | `ip addr add 192.168.1.10/24 dev eth0` |
| `del/delete` | Remove IP address                     | `ip addr del 192.168.1.10/24 dev eth0` |
| `flush`      | Delete all IP addresses of an interface | `ip addr flush dev eth0`               |
#### Practical examples:
```bash
# Display all IP addresses
ip addr show
# Only IPv4 addresses of a specific interface
ip -4 addr show dev eth0
# Add IP address with broadcast address
sudo ip addr add 192.168.1.100/24 broadcast 192.168.1.255 dev eth0
# Add temporary IPv6 address
sudo ip -6 addr add 2001:db8::1/64 dev eth0
```
### link (l) - Network interface management with the IP command
The `link` object manages the physical and virtual network interfaces at Layer 2 level.
#### Basic commands:
| Command       | Description                    | Example                                      |
|:------------ |:------------------------------- |:--------------------------------------------- |
| `show/list`  | Display network interfaces    | `ip link show` or `ip l`                    |
| `set`        | Change interface properties  | `ip link set eth0 up`                         |
| `add`        | Add virtual interface | `ip link add veth0 type veth peer name veth1` |
| `del/delete` | Delete interface               | `ip link del veth0`                           |
#### Practical examples:
```bash
# Display all network interfaces
ip link show
# Activate/deactivate interface
sudo ip link set eth0 up
sudo ip link set eth0 down
# Change MTU
sudo ip link set eth0 mtu 1500
# Change MAC address
sudo ip link set eth0 address aa:bb:cc:dd:ee:ff
# Create VLAN interface
sudo ip link add link eth0 name eth0.100 type vlan id 100
# Create bridge
sudo ip link add name br0 type bridge
```
### route (r) - Routing management with the IP command
The `route` object manages the system's routing tables.
#### Basic commands:
| Command       | Description                    | Example                                  |
|:------------ |:------------------------------- |:----------------------------------------- |
| `show/list`  | Display routing table        | `ip route show` or `ip r`               |
| `add`        | Add route                | `ip route add 10.0.0.0/8 via 192.168.1.1` |
| `del/delete` | Remove route                 | `ip route del 10.0.0.0/8`                 |
| `get`        | Find route to specific destination | `ip route get 8.8.8.8`                    |
#### Practical examples:
```bash> Schreibt mir!
> 
> Wenn hierzu noch Fragen habt, euch etwas nicht gefällt oder ihr habt Fehler entdeckt, dann hinterlasst einen Kommentar. Gerne könnt ihr mir auch Fragen über das Kontaktformular zukommen lassen.
# Display routing table
ip route show
# Set default gateway
sudo ip route add default via 192.168.1.1
# Add specific route
sudo ip route add 172.16.0.0/16 via 192.168.1.254 dev eth0
# Route via specific interface
sudo ip route add 10.0.0.0/8 dev eth1
# Blackhole route (discard traffic)
sudo ip route add blackhole 192.168.100.0/24
```
### neighbor (neigh, n) - ARP/neighbor management
The `neighbor` object manages the ARP table (Address Resolution Protocol) and NDISC cache.
#### Basic commands:
| Command       | Description                  | Example                                                     |
|:------------ |:----------------------------- |:------------------------------------------------------------ |
| `show/list`  | Display ARP/neighbor table | `ip neigh show` or `ip n`                                  |
| `add`        | Add ARP entry        | `ip neigh add 192.168.1.1 lladdr aa:bb:cc:dd:ee:ff dev eth0` |
| `del/delete` | Remove ARP entry         | `ip neigh del 192.168.1.1 dev eth0` |
#### Practical examples with the IP command:
```bash
# Display ARP table
ip neigh show
# Add static ARP entry
sudo ip neigh add 192.168.1.10 lladdr 00:11:22:33:44:55 dev eth0
# Clear ARP cache for interface
sudo ip neigh flush dev eth0
# Display IPv6 neighbor discovery
ip -6 neigh show
```
### maddress (maddr, m) - Multicast management
The `maddress` object manages multicast addresses on network interfaces.
#### Basic commands:
| Command       | Description                 | Example                                  |
|:------------ |:---------------------------- |:----------------------------------------- |
| `show/list`  | Display multicast addresses  | `ip maddr show`                           |
| `add`        | Add multicast address | `ip maddr add 01:00:5e:00:00:01 dev eth0` |
| `del/delete` | Remove multicast address  | `ip maddr del 01:00:5e:00:00:01 dev eth0` |
### rule (ru) - Policy Routing
The `rule` object manages rules for policy-based routing.
#### Basic commands:
| Command       | Description                   | Example                                    |
|:------------ |:------------------------------ |:------------------------------------------- |
| `show/list`  | Display policy routing rules | `ip rule show`                              |
| `add`        | Add routing rule       | `ip rule add from 192.168.1.0/24 table 100` |
| `del/delete` | Remove routing rule        | `ip rule del from 192.168.1.0/24`           |
### tunnel (t) - Tunnel management
The `tunnel` object manages different types of network tunnels.
#### Basic commands:
| Command       | Description     | Example                                      |
|:------------ |:---------------- |:--------------------------------------------- |
| `show/list`  | Display tunnel  | `ip tunnel show`                              |
| `add`        | Create tunnel | `ip tunnel add tun0 mode gre remote 10.0.0.1` |
| `del/delete` | Remove tunnel | `ip tunnel del tun0`                          |
#### Tunnel modes:
- **GRE**: Generic Routing Encapsulation
- **IPIP**: IP-in-IP tunnel
- **SIT**: Simple Internet Transition (IPv6-over-IPv4)
- **VXLAN**: Virtual eXtensible Local Area Network
### xfrm (x) - IPSec management
The `xfrm` object manages IPSec transformations and policies[^6].
#### Basic commands:
| Command   | Description           | Example         |
|:-------- |:---------------------- |:---------------- |
| `state`  | Display IPSec status  | `ip xfrm state`  |
| `policy` | Manage IPSec policy | `ip xfrm policy` |
### Other important objects
#### monitor - Monitor network events with the IP command
```bash
# Monitor all network events
ip monitor all
# Monitor address changes only
ip monitor address
# Monitor route changes only
ip monitor route
```
#### netns - Network Namespaces
Network Namespaces enable the isolation of network stacks.
| Command       | Description                 | Example            |
|:------------ |:---------------------------- |:------------------- |
| `list`       | List network namespaces | `ip netns list`     |
| `add`        | Create network namespace  | `ip netns add myns` |
| `del/delete` | Delete network namespace    | `ip netns del myns` |
## Comparison of the IP command with classic network tools
### ip vs. ifconfig
| Task                | ip command                              | ifconfig command                 |
|:---------------------- |:-------------------------------------- |:------------------------------- |
| Display interfaces    | `ip link show`                         | `ifconfig`                      |
| Display IP addresses   | `ip addr show`                         | `ifconfig -a`                   |
| Set IP address      | `ip addr add 192.168.1.10/24 dev eth0` | `ifconfig eth0 192.168.1.10/24` |
| Activate interface   | `ip link set eth0 > Schreibt mir!
> 
> Wenn hierzu noch Fragen habt, euch etwas nicht gefällt oder ihr habt Fehler entdeckt, dann hinterlasst einen Kommentar. Gerne könnt ihr mir auch Fragen über das Kontaktformular zukommen lassen.up`                  | `ifconfig eth0 up`              |
| Deactivate interface | `ip link set eth0 down`                | `ifconfig eth0 down`            |
### ip vs. route
| Task                  | ip command                                 | route command                               |
|:------------------------ |:----------------------------------------- |:------------------------------------------ |
| Display routing table | `ip route show`                           | `route -n`                                 |
| Set default gateway  | `ip route add default via 192.168.1.1`    | `route add default gw 192.168.1.1`         |
| Add route         | `ip route add 10.0.0.0/8 via 192.168.1.1` | `route add -net 10.0.0.0/8 gw 192.168.1.1` |
### ip vs. arp
| Task                | ip command                                                    | arp command                             |
|:---------------------- |:------------------------------------------------------------ |:-------------------------------------- |
| Display ARP table   | `ip neigh show`                                              | `arp -na`                              |
| Add ARP entry | `ip neigh add 192.168.1.1 lladdr aa:bb:cc:dd:ee:ff dev eth0` | `arp -s 192.168.1.1 aa:bb:cc:dd:ee:ff` |
## Advanced functions and use cases of the IP command
### VLAN configuration with the IP command
```bash
# Create VLAN interface
sudo ip link add link eth0 name eth0.100 type vlan id 100
# Assign IP address for VLAN
sudo ip addr add 192.168.100.1/24 dev eth0.100
# Activate VLAN interface
sudo ip link set eth0.100 up
```
### Bridge configuration with the IP command
```bash
# Create bridge
sudo ip link add name br0 type bridge
# Add ports to the bridge
sudo ip link set eth0 master br0
sudo ip link set eth1 master br0
# Activate bridge
sudo ip link set br0 up
```
### Quality of Service (QoS) with tc
Although `tc` is technically a separate tool, it is often used in conjunction with `ip`:
```bash
# Set up traffic shaping
sudo tc qdisc add dev eth0 root handle 1: htb default 30
sudo tc class add dev eth0 parent 1: classid 1:1 htb rate 100mbit
```
### Network namespaces in practice
```bash
# Create namespace
sudo ip netns add test-ns
# Create interface in namespace
sudo ip netns exec test-ns ip link add veth0 type veth peer name veth1
# Execute command in namespace
sudo ip netns exec test-ns ip addr show
```
## Tips for IT security managers using the IP command
### Network segmentation with the IP command
```bash
# Isolated network areas with VLANs
sudo ip link add link eth0 name dmz type vlan id 10
sudo ip addr add 10.0.10.1/24 dev dmz
# Check routing between segments
sudo ip route add 10.0.20.0/24 via 10.0.10.254 dev dmz
```
### Monitoring and logging with the IP command
```bash
# Monitor network events in real time
ip monitor all > /var/log/network-events.log &
# Log routing tables regularly
watch -n 60 ‘ip route show > /var/log/routing-$(date +%Y%m%d-%H%M%S).log’
```
### Security analysis IP command
```bash
# Identify suspicious ARP entries
ip neigh show | grep -E “(FAILED|INCOMPLETE)”
# Detect routing anomalies
ip route show table all | grep -v “dev lo”
```
## Troubleshooting and debugging for the IP command
### Common problems and solutions 
#### Connectivity problems
```bash
# Check route to a destination
ip route get 8.8.8.8
# Check interface status
ip -s link show eth0
# Diagnose ARP problems
ip neigh show | grep FAILED
```
#### Performance problems
```bash
# Detailed interface statistics
ip -s -s link show
# Routing table performance
time ip route show table all
```
#### Configuration errors under the IP command
```bash
# Check all configured addresses
ip addr show | grep -E “inet|inet6”
# Identify routing conflicts
ip route show | sort
```
## Best practices IP command
### Persistent configuration
Since `ip` commands only make temporary changes, permanent configurations should be saved in the appropriate system files:
- **Debian/Ubuntu**: `/etc/network/interfaces` or Netplan
- **Red Hat/CentOS**: `/etc/sysconfig/network-scripts/`
- **systemd-networkd**: `/etc/systemd/network/`
### Security
```bash
# Administrator rights only when necessary
# Display commands usually do not require sudo rights
ip addr show
ip route show
# Always use sudo for changes
sudo ip link set eth0 up
sudo ip route add default via 192.168.1.1
```
### Backup and restore
```bash
# Back up current configuration
ip addr show > network-config-backup.txt
ip route show > routing-backup.txt
# Create script for restoration
#!/bin/bash
# Restore basic configuration
ip addr flush dev eth0
ip addr add 192.168.1.100/24 dev eth0
ip route add default via 192.168.1.1
```
## Integration into automation scripts
### Bash scripting
```bash
#!/bin/bash
# Network health check
# Check interface status
if ip link show eth0 | grep -q “state UP”; then
    echo “Interface eth0 is active”
else
    echo “WARNING: Interface eth0 is inactive”
    exit 1
fi

# Check gateway availability
GATEWAY=$(ip route | grep default | awk ‘{print $3}’)
if ping -c 1 “$GATEWAY” > /dev/null 2>&1; then
    echo “Gateway $GATEWAY is available”
else
    echo “ERROR: Gateway $GATEWAY not reachable”
    exit 1
fi
```
### JSON output for automation
```bash
# JSON-formatted output for further processing
ip -j addr show | jq ‘.[] | select(.ifname==“eth0”) | .addr_info.local’
# All active interfaces as JSON
ip -j link show | jq ‘.[] | select(.operstate==“UP”) | .ifname’
```
## Summary of the most important commands
### Daily administration
```bash
# Quick overview of the system
ip -c -br addr show    # All IP addresses (colored, short)
ip -c -br link show    # All interface statuses (colored, short)
ip route show          # Routing table
ip neigh show          # ARP table
```
### Troubleshooting
```bash
# Detailed diagnosis
ip -s link show eth0           # Interface statistics
ip route get 8.8.8.8          # Route to specific destination
ip neigh show dev eth0         # ARP entries for interface
ip monitor all                # Live monitoring
```
### Configuration
```bash
# Temporary changes
sudo ip addr add 192.168.1.10/24 dev eth0
sudo ip link set eth0 up
sudo ip route add default via 192.168.1.1
sudo ip neigh add 192.168.1.1 lladdr aa:bb:cc:dd:ee:ff dev eth0
```
## Further resources
### Documentation IP command
- **Man pages**: `man ip`, `man ip-address`, `man ip-link`, `man ip-route`
- **Help system**: `ip help`, `ip addr help`, `ip link help`
- **Online documentation**: Linux Foundation iproute2 Wiki
### Related tools
- **ss**: Replacement for `netstat` for socket analysis
- **tc**: Traffic control for QoS and bandwidth management
- **bridge**: Special bridge management
- **ethtool**: Hardware-specific Ethernet configuration
## Conclusion | IP command
The `ip` command is a powerful and versatile tool that covers all aspects of Linux network management. With its consistent syntax and extensive functionality, it is indispensable for every system administrator and IT security manager. Continuous development and full IPv6 support make it the first choice for modern network configuration on Linux.

<!-- FM:Snippet:Start data:{"id":"Visit Help-page","fields":[]} -->
> ## Questions and answers
> 
> If you have any questions or feedback about this blog or YouTube channel, please use my help page. Here you will find questions and answers about the various posts. You are also welcome to ask your own question here.
>
> [**Visit the Help-page**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->