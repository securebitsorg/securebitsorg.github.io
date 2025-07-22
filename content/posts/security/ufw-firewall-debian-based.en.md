---
title: UFW Firewall Raspberry Pi Installation
descripton: UFW Firewall Raspberry Pi | In this tutorial, I will show you how to secure your Raspberry Pi with the UFW firewall.
hero: /images/posts/it-security/Thumbnail-1.png
menu:
    sidebar:
        name: Configuring the UFW Firewall using a Raspberry Pi as an example
        identifier: ufw-firewall-raspberry
        parent: security
date: 2022-09-20
categories: 
- “Linux”
- “Network”
- “Security”
- ‘Tutorials’
- “Video” 
- “Hardware”
tags:
- “raspberry pi”
- “firewall”
- “linux”
- “security”
- "tutorials"
- “video”
---
## Installing UFW Firewall (Uncomplicated Firewall) on a Raspberry Pi

In this post, '**UFW Firewall Raspberry Pi Installation**', I would like to show you how to install and set up this firewall or command line interface for **iptables** on a Raspberry Pi or any other Linux-based distribution. This means that the commands listed here are not limited to the **Raspberry Pi**, but can also be used on all other Linux-based distros.

In keeping with the tutorial ‘Installing AdGuard on the Raspberry Pi’ (https://secure-bits.org/adguard-raspberry-pi-installation-2022/)', it makes sense to install the [UFW firewall](https://wiki.ubuntuusers.de/ufw/) on the Raspberry Pi with **AdGuard Home**. This will protect the AdGuard DNS server from unauthorized access from the network.
### UFW firewall rules for AdGuard on the Raspberry Pi
You can find the rules I suggest for the UFW firewall further down in this post. But first, make sure you read the whole post so you don't lock yourself out of the Raspberry Pi.
[To the AdGuard rules](#adguard)

### What is a UFW firewall?
The UFW firewall is not actually a firewall, but rather provides an interface to make it easier to configure the rule-based firewall ‘iptables’ via the terminal. The ‘iptables’ firewall is a component of every Linux-based distribution.
With the UFW firewall, it is possible to create, change, or delete rules in ‘iptables’ using simple commands.
### Is there a graphical user interface for the UFW firewall?
There is also a graphical user interface (GUI) for the UFW firewall. This graphical user interface is called ‘gufw’ and is pre-installed on Ubuntu systems.
This extension is available for the following distributions:
- Ubuntu
- Debian
- Linux Mint
- openSuse
- archlinux
- salix

### Note on the listed commands | UFW firewall Raspberry Pi
All commands listed here work not only on a Raspberry Pi, but also on any other Linux-based distribution such as Ubuntu, Debian, archLinux, and many other systems.

### Basic instructions for handling a firewall rule
With the UFW firewall, as well as other firewalls I am familiar with, there are three methods that regulate the processing of data packets in network traffic. Understanding these methods is the absolute basis for a secure firewall configuration.

#### Method ‘allow or pass’


With the ‘allow’ or ‘pass’ method, data packets are allowed during network requests. This method is usually the default for rules created for outgoing network traffic.
Incoming network traffic is only explicitly allowed via ‘allow or pass’.
#### ‘reject’ method

The ‘**reject**’ method, on the other hand, allows data packets in network traffic to be discarded and immediately sends feedback to the sender of the network request.
Because the feedback about the rejected request to the sender is often misused for denial of service attacks, this method of handling requests is not particularly advantageous for a firewall and is therefore not used for this purpose.
‘**reject**’ is used, for example, in communication between network components to avoid a potentially high network load.

#### Method ‘deny or drop’

Unlike the ‘**reject**’ method, the ‘**deny** **or drop**’ method also rejects the network request immediately, but the sender does not receive any direct feedback and the requests are effectively ignored.
However, the disadvantage of this method is that it can result in a higher network load. **Nevertheless, this method of handling requests on a firewall is clearly preferable.**

## Installing the UFW firewall on Raspberry Pi
To begin installing the UFW firewall, you must first connect to the Raspberry Pi via SSH in the terminal window.
```shell
# Create an SSH connection to the Raspberry Pi
ssh username@IP address of the Pi
# For example: ssh pi@172.16.16.215
# Then enter your assigned password.
```
After successfully logging in, the contents of the terminal window should look like the following image.

![Login in via SSH](/images/posts/it-security/Terminal-ssh-Verbindung.png)

### Install UFW firewall on Raspberry Pi
You can install the UFW firewall on the Raspberry Pi with the following command:
```shell
# Install ufw firewall
sudo apt install ufw
```
### Activate UFW firewall service
After installation, the firewall system service may need to be started.
```shell
# Start the UFW firewall system service
sudo systemctl enable ufw --now
```
### Checking the firewall status - UFW firewall Raspberry Pi
To check the status of the firewall, enter the following command:
```shell
# Query the firewall status
sudo ufw status
# Output:
Status: inactive
```
> ### Important!
>
> **Please do not activate the UFW firewall until the end of this tutorial, otherwise you will also lock yourself out of the Raspberry Pi!**
### Create basic incoming traffic prohibition rule - UFW firewall Raspberry Pi
First, we will prohibit basic network traffic so that only explicit permissions created by us are active.
```shell
# Block basic network traffic
sudo ufw default deny incoming
```
### Create basic outgoing rule - UFW firewall Raspberry Pi
```shell
# Allow basic outgoing network traffic
sudo ufw default allow outgoing
# Of course, basic outgoing network traffic can also be blocked and individual ports can be enabled later
sudo ufw default deny outgoing
```
### Create rule for access via ssh - UFW firewall Raspberry Pi
To ensure that access to the Raspberry Pi via ssh is still possible after activating the UFW firewall, we create a rule for this.
```shell
# Create rule for ssh access. This can either be specified via ‘Port 22’ or you can select the ‘ssh’ service. A list of services recognized by the UFW firewall can be found at /etc/services 
sudo ufw allow ssh
# Allow access only from your network
sudo ufw allow from IP address range to any port 22
# This is what the rule would look like for my network
sudo ufw allow from 172.16.16.0/24 to any port 22
```
#### UFW firewall Limit login attempts for ssh
To define a limit for ssh access and thus prevent a brute force attack (also works for other ports and services), you can create a rule that sets a limit on login attempts.
With this limit, login attempts are restricted to 6 logins in 30 seconds.
You can create this rule as follows:
```shell
# Set limit for login attempts on ssh port
sudo ufw limit ssh
or
sudo ufw limit 22/tcp
```
### Known services of the UFW firewall
The UFW firewall also recognizes some ‘**services**’ by default. Services include ‘**ssh**’ for **port 22**, for example.

These ‘**services**’ can also be addressed directly when creating new firewall rules.
The image below shows the file in which the services of the UFW firewall are listed.
You can view this file using the command ‘**nano /etc/services**’.

![List of services under Debian](/images/posts/it-security/WindowsTerminal_ufw-firewall-services.png)

### Defining firewall rules using apps – UFW firewall Raspberry Pi
Another method of defining the firewall rules is to use ‘**App**’ as a definition for handling data packets.
‘**Apps**’ are applications that are running on your system and, when installed, create and store so-called ‘**profiles**’, which specify the ports used by the application.
#### Display a list of installed app profiles
```shell
# Display UFW firewall app list
sudo ufw app list
# See the image below for an example output
```
![APP list of the UFW firewall](/images/posts/it-security/sudo-ufw-app-list.png)

#### Display the app profile of an application in the UFW firewall
As mentioned in the previous paragraph, the ports used by an application are specified in the app profile of an installed application. To display this profile, enter the following command in your terminal window.
```shell
# Display app profile
sudo ufw app info <name of the app>
# Example
sudo ufw app info IMAPS
# Output: See image below
```

#### Define firewall rule using app profile
To create a firewall rule using an app profile, enter the following command in the terminal.
```shell
# Define UFW firewall rule using app profile
sudo ufw allow/deny APP profile
# Example for IMAPS
sudo ufw allow IMAPS
```
---

![App-Profil mittels UFW-Firewall anzeigen](/images/posts/it-security/sudo-ufw-app-info.png)

---
### Define your own firewall profiles - UFW firewall Raspberry Pi
Of course, you also have the option of creating your own APP profiles (similar to the ‘alias’ in OPNsense) and assigning multiple ports to your own profile. Then, when creating rules for the UFW firewall, you only need to name this profile.
These app profiles are saved under the following path:
**/etc/ufw/application.d/**
In this example, I have named the profile I created ‘eigenesprofile’.
#### Create UFW firewall app profile
```shell
# Change to the directory where the app profiles are stored
cd /etc/ufw/application.d/
# Display the existing profiles (may look different depending on the apps you have installed)
ls -l
# Output
pi@raspberrypi3:/etc/ufw/applications.d $ ls -l
total 44
-rw-r--r-- 1 root root 145 Jul  2 00:37 openssh-server
-rw-r--r-- 1 root root 349 Dec 14  2018 ufw-bittorent
-rw-r--r-- 1 root root 627 Mar 30  2018 ufw-chat
-rw-r--r-- 1 root root 513 Mar 30  2018 ufw-directoryserver
-rw-r--r-- 1 root root  89 Jan 14  2018 ufw-dnsserver
-rw-r--r-- 1 root root 358 Mar 30  2018 ufw-fileserver
-rw-r--r-- 1 root root 212 Jan 14  2018 ufw-loginserver
-rw-r--r-- 1 root root 524 Mar 30  2018 ufw-mailserver
-rw-r--r-- 1 root root 131 Jan 14  2018 ufw-printserver
-rw-r--r-- 1 root root 155 Jan 14  2018 ufw-proxyserver
-rw-r--r-- 1 root root 320 Jan 14  2018 ufw-webserver
pi@raspberrypi3:/etc/ufw/applications.d $
# Create your own profile
sudo nano ownprofile
# In the Nano editor window, enter the following (adapted to your profile)
[ownprofile]
title=Ports for your own profile
description=Ports and port ranges for your own app profile
ports=443,80,3689/tcp
# Save with CTRL+O and Enter, exit with CTRL+X
# Load the new rule
sudo ufw reload
# Activate the rule you created
sudo ufw allow ownprofile
# Check the UFW firewall rules
sudo ufw status verbose
# Output see image below
```
#### Checking the UFW firewall rules after creating your own profile

![Checking the UFW firewall rules after creating your own profile](/images/posts/it-security/Eigenes-App-Profil-ueberpruefen.png)

### Defining multiple ports as a rule
If you want to create a firewall rule for several ports at the same time according to protocol definition (UDP or TCP), there are two options.
The first option is to list the ports to be regulated with a ‘**,**’ (for example: 22,25,80,443).
The second option is to specify port ranges using the ‘**:**’ character (for example: 2000:3000).
Depending on which option you choose, enter the corresponding command in the terminal:
```shell
# Create UFW firewall rule for multiple ports of the same protocol
sudo ufw allow 22,25,80,443/tcp
# Create firewall rule using port range
sudo ufw allow 2000:3000/tcp
```
### Add rule comment - UFW firewall Raspberry Pi
If you have a comprehensive set of firewall rules, it is a good idea to add a comment to each rule explaining its function. This helps you keep track of rules or ports that cannot be clearly assigned.
```shell
# Add a comment to a rule
sudo ufw allow ssh comment “Enable ssh connection”
```
### Enable and disable the UFW firewall
You can enable or disable the firewall using the following commands.
```shell
# Enable
sudo ufw enable
# Disable
sudo ufw disable
```
### Display firewall status
There are two ways to display the status of the UFW firewall.
```shell
# Option 1, displays all rules:
sudo ufw status verbose
# Option 2, displays rules with numbering:
sudo ufw status numbered
```
### Delete rules - UFW firewall Raspberry Pi
The easiest way to delete rules is to proceed as follows.
```shell
# Display the UFW firewall rules numbered:
sudo ufw status numbered
# Example output:
pi@raspberrypi3:~ $ sudo ufw status numbered
Status: active
     To                         Action      From
     -- ------ ----
[ 1] 22                         ALLOW IN    172.16.16.0/24
[ 2] 3000                       ALLOW IN    172.16.16.0/24
[ 3] 53/tcp                     ALLOW IN    Anywhere
[ 4] 53/udp                     ALLOW IN    Anywhere
[ 5] 853/tcp                    ALLOW IN    Anywhere
[ 6] 853/udp                    ALLOW IN    Anywhere
[ 7] 67/tcp                     ALLOW IN    Anywhere
[ 8] 67/udp                     ALLOW IN    Anywhere
[ 9] 68/tcp                     ALLOW IN    Anywhere
[10] 68/udp                     ALLOW IN    Anywhere
[11] 80/tcp                     ALLOW IN    Anywhere
[12] 443/tcp                    ALLOW IN    Anywhere
# Delete the UFW firewall rule. Here is rule 3 as an example:
sudo ufw delete 3
```
### Uninstall UFW firewall
If, for hopefully good reasons ;), you want to uninstall the firewall, use the following command.
```shell
# Uninstall UFW firewall
sudo apt remove ufw --purge
```
### Notify the UFW firewall of rule changes
If you have made changes to the firewall rules, you must notify the firewall.
```shell
# Notify the firewall of rule changes
sudo ufw reload
```
## Video tutorial - Securing AdGuard with UFW firewall on Raspberry Pi
A video tutorial on ‘Securing AdGuard installation on a Raspberry Pi using UFW firewall’ will also be available soon on my [YouTube channel](https://www.youtube.com/channel/UCr-cuwB555JmAm4F412KZ2Q).
https://youtu.be/Dh3A1Idktmg
So it's best to [subscribe](https://www.youtube.com/channel/UCr-cuwB555JmAm4F412KZ2Q) to my channel right away so you don't miss any videos.
## Rules for AdGuard | UFW firewall Raspberry Pi
Now that you hopefully have a good overview of the UFW firewall rules, it's time to create the rules for our installed AdGuard on the Raspberry Pi.

```shell
# Firewall reset - This resets the UFW firewall to its original configuration after installation
sudo ufw reset
# Basic firewall rules
# Disable IPv6 - To do this, you need to change the entry ‘IPv6=yes’ to ‘no’ in the file ‘/etc/default/ufw’
# Open the configuration file with the Nano editor
sudo nano /etc/default/ufw
IPv6=no
# Save the file with CTRL+O and exit the Nano editor with CTRL+X
# Restart the UFW firewall service
sudo systemctl restart ufw
# Block all incoming traffic
sudo ufw default deny incoming
# Allow all outgoing traffic
sudo ufw default allow outgoing
# The IP address range must, of course, match the range in which the Raspberry is running | Enable SSH access via the defined IP address range
sudo ufw allow from 172.16.16.0/24 to any port 22
# Port for accessing the AdGuard dashboard (again, adjust the IP address range here)
sudo ufw allow from 172.16.16.0/24 to any port 3000
# Port for the DNS service
sudo ufw allow 53/tcp
sudo ufw allow 53/udp
sudo ufw allow 853/tcp
sudo ufw allow 853/udp
# Allow ports for DHCP service
sudo ufw allow 67/tcp
sudo ufw allow 67/udp
sudo ufw allow 68/tcp![Überprüfung der UFW-Firewall-Regeln nach Anlegung des eigenen Profils](/images/posts/it-security/Eigenes-App-Profil-ueberpruefen.png)
sudo ufw allow 68/udp
# Ports for https and http
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
# Ports for DNS over Quic
sudo ufw allow 784/udp
sudo ufw allow 8853/udp
# Ports for DNSCrypt
sudo ufw allow 5443/udp
sudo ufw allow 5443/tcp
# Ports for NTP - Timeserver:
sudo ufw allow 37/udp
sudo ufw allow 37/tcp
# Reload firewall rules
sudo ufw reload
# Activate firewall:
sudo ufw enable
```
## Summary - UFW firewall Raspberry Pi
In this tutorial, ‘UFW firewall Raspberry Pi’, we have secured the Raspberry Pi against unnecessary access using the UFW firewall.
The UFW firewall tool makes it easy to configure iptables (Netfilter) and thus ensure greater security on a Linux system.
If you're not comfortable using the terminal, you can also use the graphical user interface ‘gufw’ to do everything with a few clicks, provided, of course, that a graphical user interface is installed on your system.
I hope you enjoyed this post and that it helped some of you a little bit!
If you have any questions, please leave me a comment or send me an email.
