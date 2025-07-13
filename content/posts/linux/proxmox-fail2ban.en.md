---
title: “Secure Proxmox VE with fail2ban”
date: 2025-02-18
descripton: “Learn how to secure your Debian 12-based Proxmox VE instance against brute force attacks with fail2ban in this tutorial.”
hero: /images/posts/proxmox-fail2ban/proxmox_und_fail2ban.png
menu:
  sidebar:
    name: Proxmox and fail2ban
    identifier: proxmox-fail2ban
    parent: linux
    weight: 10
tags: [“linux”, “security”, “proxmox”, “video”]
categories: [“Tutorials”, “Linux”, ‘Video’, “Security”]
---
## Secure Proxmox VE based on Debian 12 with fail2ban
One way to secure a public Proxmox server against brute force attacks is to use the tool ‘fail2ban’.
In this short tutorial, I will show you how to use fail2ban to secure access to the ‘SSH’ service and port ‘8006’ of the dashboard.
Starting point
In this scenario, we are dealing with a Proxmox server that is hosted as a dedicated server at Hetzner and can be reached via the public Internet using an IPv4 and IPv6 address.
In general, the use of fail2ban should only be considered as part of a set of security measures to secure your server. Feel free to consult further security measures here on my blog.

> **Voucher**
>
> If you would also like to operate a VPS/root/dedicated server, I can offer you a 20 euro voucher. To use this voucher, click on the link below.
> The 20 euro voucher can only be used for new registrations on the Hetzner website!
>
> **Link to the voucher: <https://hetzner.cloud/?ref=OBFauh7A1Ru8>**
---
## Installing fail2ban on Debian 12

> **IMPORTANT NOTE!**
>
> Please note that all commands executed below require elevated privileges!
>
> You can obtain these rights by executing the following command once for the existing SSH session:
>
> `sudo -s`
---
Since Proxmox VE is based on the Debian distribution, fail2ban is installed in the same way as a classic Debian installation.
There are two ways to set up fail2ban on the Proxmox system.
- **Setup via the Proxmox dashboard.**

To set up via the Proxmox dashboard, click on the Proxmox node, select “Shell,” and then enter the appropriate configuration information.

- **Setup via terminal using an SSH connection to the Proxmox server.**
      
In my example, we will connect to the Proxmox server via a terminal using SSH. The advantage of this is greater convenience, e.g. when using copy & paste.
To set up via the Proxmox dashboard, click on the Proxmox node, select ‘Shell’ and then enter the relevant information for the configuration.

{{< img src="/images/posts/proxmox-fail2ban/dashboard-proxmox.png" >}}

### SSH connection via terminal with the Proxmox server
First, we establish a connection via SSH with the Proxmox server. Depending on your operating system, you can use a terminal window, Putty, or similar.
```bash
# Establish SSH connection
ssh root@<IP address of Proxmox server>
```
### Update the operating system and install fail2ban
```bash
# Update the system
sudo apt update && apt upgrade -y
# Install fail2ban
sudo apt install fail2ban
```
### Adjust the fail2ban configuration for Proxmox VE
As described in the introduction to this tutorial, we want to protect the standard SSH port (22) and port 8006 for the Proxmox VE dashboard interface from brute force attacks.
First, we create a local jail config file in the fail2ban directory, in which we then store the adjustments for our project.
```bash
# First, we will 
# call up the fail2ban directory, where the future and other configuration files are located
cd /etc/fail2ban
# Create the configuration file for fail2ban
nano jail.conf
```
In the next step, we add the configuration for securing the SSH connection and securing **port 8006**.

```bash
# Configuration for fail2ban – securing SSH (standard port 22) and Proxmox dashboard access (port 8006)
# Default settings for fail2ban

[DEFAULT]
allowipv6 = auto
bantime = 3600
backend = systemd
ignoreip = 127.0.0.1/8

# Config for SSH

[sshd]
mode = aggressive
port = ssh
logpath = %(sshd_log)s
banaction = nftables-multiport
banaction_allports = nftables-allports
backend = systemd
enabled = true
maxretry = 2
findtime = 3600
bantime = 3h

# Config for Proxmox

[proxmox]
enabled = true
port = https,http,8006
filter = proxmox
backend = systemd
maxretry = 3
findtime = 3600
bantime = 3h
```
Now save the configuration file ‘jail-local’ with CTRL + O and close the Nano editor with CTRL + X.
> **Ignore IP**
>
> Under ‘**ignoreip**’, you can add IP addresses and subnets as exceptions to prevent yourself from being locked out, for example.

## Create Proxmox filter for fail2ban
A filter configuration for SSH is included in fail2ban by default. We first need to create the filter configuration for Proxmox.
To do this, we switch to the directory ‘/etc/fail2ban/filter.d’ and create the filter configuration for Proxmox with ‘nano proxmox.conf’.
```bash
# Filter configuration proxmox
[Definition]
failregex = pvedaemon\[.*authentication failure; rhost=<HOST> user=.* msg=.*
ignoreregex =
journalmatch = _SYSTEMD_UNIT=pvedaemon.service
```
Save this file with CTRL + O and exit the editor with CTRL + X.
### Start and check the fail2ban service
Now that we have created the necessary configuration files, we can proceed and start fail2ban on the system.
```bash
# Enable fail2ban autostart, start service
systemctl enable fail2ban
systemctl start fail2ban
# Check fail2ban status
systemctl status fail2ban
```
The output should then look something like this:

{{< img src="/images/posts/proxmox-fail2ban/fail2ban-service-status.png" >}}

Here are a few commands that allow you to ‘control’ fail2ban.

### Display the banned IP addresses
```bash
# Banned IP addresses for SSH
fail2ban-client status sshd
# Banned IP addresses for Proxmox
fail2ban-client status proxmox
```
Here is an example output of the banned IP addresses that have attempted to log in via SSH.

{{< img src="/images/posts/proxmox-fail2ban/fail2ban-status-sshd.png" >}}

### Remove banned IP address from the jail list
```bash
# Remove IP address from the list of banned IP addresses
# For SSH
fail2ban-client set sshd unbanip <IP address>
# For Proxmox
fail2ban-client set proxmox unbanip <IP address>
```
## Conclusion – Securing Proxmox VE with fail2ban
As seen in this tutorial, securing a Proxmox server against brute force attacks is actually quite trivial and, once in operation, provides very good protection.
Furthermore, fail2ban can also be used to secure other services such as nginx, apache2, your own Bitwarden instance, etc., or you can create your own filter configuration as done in this tutorial for Proxmox.
> **My personal opinion on fail2ban**
>
>For me personally, using fail2ban to secure a server instance is a clear “must” and, when used in conjunction with the security layer principle, ensures the secure operation of public services.

### Alternative to fail2ban
An alternative to fail2ban is offered by the application ‘crowdsec’. Crowdsec works in principle the same as fail2ban, but is supplemented by centrally managed dynamic lists. The disadvantage here, however, is that a public connection to this service is established.
Further information on ‘crowdsec’ can be found here:

<https://www.crowdsec.net/>

I hope this tutorial is useful for some of you and helps you secure your Proxmox server instance!
Feel free to leave me feedback in the forum or here in the comments.
### Further information on fail2ban
<https://wiki.ubuntuusers.de/fail2ban/>

<https://de.wikipedia.org/wiki/Fail2ban>
