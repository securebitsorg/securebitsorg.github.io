---
title: Netstat under Windows
date: 2025-07-27T10:17:10.288Z
categories:
- Network
- Tutorials
- Windows
tags:
- cmd
- network
- tutorials
- windows
description: How does Netstat work on Windows? Netstat commands explained simply.
menu:
  sidebar:
    name: Netstat on Windows at a glance
    identifier: netstat-en
    parent: windows
lastmode: 2025-07-27T10:19:50.194Z
keywords:
- netstat
preview: ../../../assets/images/posts/windows/netstat-help.png
hero: /images/posts/windows/netstat-help.png
---
## Display TCP connections and ports in Windows with netstat
In this article, I would like to introduce you to the command/tool **netstat** in Windows and show you how you can use this command to check or display active TCP connections, open ports, and other statistics such as an IPv4 overview of the Internet protocols IP, TCP, ICMP, and UDP.
### What do I use the Netstat commands for?
When analyzing the security of an operating system, it is of course important to know which connections the operating system or installed software establishes to services on the Internet. Furthermore, malware can also be quickly detected by displaying listening ports. The netstat command can be used to list these connections and listening ports.
### What can I do with the netstat command?
You can also use the information obtained in this way to analyze connection problems caused by your firewall, server instance, or UTM. This is because even legitimate programs need a connection to the Internet for various services but are blocked by your software or hardware firewall, for example.  
When assessing the security of a system, it is important to know that most attacks on a system are carried out by creating a reverse shell. Since most standard firewalls only monitor traffic/requests from the outside to the inside and generally trust connections from the inside to the outside, attacks via a reverse shell are one of the most commonly used attack scenarios.
### How does netstat work?
To use **netstat**, you must first open the command line or start a Powershell instance.
#### Open the command line:
You can open the command line by pressing the `Windows key + s` in Windows, entering “cmd**” in the search field, **then right-clicking with the mouse pointer** on the “Command Prompt” selection and selecting “Run as administrator**.”
#### Open Powershell:
To open the Powershell console, use the key combination `Windows key + s`, enter “**powershell**,” and then right-click and select “Run **Powershell as administrator**.”
## Overview of **netstat** functions
You can get an overview of the functions and parameters of **netstat** by entering the following command in the console window:

```msdos
netstat help
```
![netstat help](/images/posts/windows/netstat-help.png)
netstat help

The overview now shows the available functions and parameters that can be combined with **netstat**. The parameters can also be combined with each other.
### Display active connections
After opening your console, you can display all active connections on your computer by entering the command

```msdos
netstat -a
```
to display all active connections on your computer.

![netstat windows](/images/posts/windows/netstat.png)
netstat windows

The table view is divided into four columns.
#### Protocol
The first column shows the protocol used for the connection.
#### Local IP address
The second column shows the locally used IP address and the port used, where the address 127.0.0.1 stands for local processes (on the same computer) that listen for internal connections and exclude external connections (Internet and other external networks).
  
The `IP address 0.0.0.0` in conjunction with a displayed port listens for all requests from all network interfaces and accepts these connections.
#### Remote IP address
The third column shows the IP address and port used by the remote address.
#### Status
Finally, the fourth column shows the current status of this connection. This status is displayed in the states “LISTENING, WAITING, ESTABLISHED, and CLOSE\_WAITING.”
### Display routing tables
It is equally important to be able to track the routing of IP packets.
The following command allows you to display the configured routing table.

```msdos
netstat -r
```
This gives you an overview of which subnets IP packets can be routed to, for example, from the subnet used by your computer to other subnets (e.g., other subdomains, Internet gateway, etc.).
### Display network interfaces
Here you can display the individual network interfaces available on your Windows device and, for example, whether and which interface is active (status).
To display the information described above, use this command.

```msdos
netstat -i
```
## Overview: netstat commands in Windows
</br>

| Command                    |Description                                                                               |
|---------------------------|--------------------------------------------------------------------------------------------|
| netstat                   | Displays all active TCP connections                                                     |
| netstat -a                | Displays all active TCP connections and the TCP/UDP ports on which the computer is listening  |
| netstat -n                | Displays connections with numeric IP addresses and ports without name resolution         |
| netstat -o                | Displays active TCP connections including process ID (PID)                                      |
| netstat -e                | Displays Ethernet statistics such as bytes and packets sent/received                        |
| netstat -s                | Displays statistics per protocol (e.g., TCP, UDP, ICMP, IP)                                  |
| netstat -p <protocol>    | Displays connections for the specified protocol (e.g., TCP, UDP, ICMP)                     |
| netstat -r                | Displays the routing table (similar to “route print”)                                  |
| netstat -b                | Displays outgoing/incoming connections and associated programs/file paths           |
| netstat -f                | Displays full domain names for foreign addresses                                         |
| netstat -x                | Displays NetworkDirect connections (Windows-specific)                                     |
| netstat -q                | Displays listening and non-listening ports                                                 |
| netstat -t                | Displays the offload status of current connections                                       |
| netstat -y                | Displays connection template information                                                  |
| netstat /?                | Displays all available parameters and a help overview                                   |
| netstat [interval]       | Repeats the display at the specified interval in seconds (e.g., netstat -n 5)               |
</br>

> - **Many parameters** can be **combined**, e.g. `netstat -ano` shows all connections with PID and without name resolution.
>
> - Some options are specific to certain protocols or network environments; **for details, refer to the help page** (`netstat /?`).

<!-- FM:Snippet:Start data:{"id":"Visit Help-page","fields":[]} -->
> ## Questions and answers
> 
> If you have any questions or feedback about this blog or YouTube channel, please use my help page. Here you will find questions and answers about the various posts. You are also welcome to ask your own question here.
>
> [**Visit the Help-page**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->