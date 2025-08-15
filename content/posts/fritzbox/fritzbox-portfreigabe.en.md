---
title: Tip - Setting up Fritzbox port forwarding correctly
hero: /images/posts/fritzbox/Video-FritzBox-Portfreigabe.png
date: 2022-03-19
menu:
  sidebar:
    name: Set up Fritzbox port forwarding
    identifier: fritzbox-port
    parent: fritzbox
categories:
  - “Hardware”
  - “Network”
  - “Security”
  - “Tutorials”
  - ‘Video’
tags:
  - “fritzbox”
  - “network”
  - “security”
  - ‘tutorials’
  - “video”
description: Setting up port forwarding correctly on Fritzbox | In this video, I show you how to configure port forwarding on Fritzbox.
preview: ../../../assets/images/posts/fritzbox/Video-FritzBox-Portfreigabe.png
---
## Setting up FritzBox port forwarding
Today's post is about how to set up **FritzBox port forwarding** correctly, what you can use it for, and what risks arise from using port forwarding.
Follow the step-by-step instructions below to set up port forwarding in your FritzBox.
For those of you who would prefer to watch a video tutorial, there is a video entitled “Setting up port forwarding on a FritzBox” on my YouTube channel.
### Video tutorial on ‘Setting up FritzBox port forwarding’
{{< youtube dUuABciDCWs >}}

### Tutorial - Setting up FritzBox port forwarding
In this step-by-step guide, I will show you how to set up port forwarding on a FritzBox.
#### Tools:
- Internet browser.
#### What do you need?
- A FritzBox router.
### Steps for setting up FritzBox port forwarding:
#### Step 1
![Fritzbox login](/images/posts/fritzbox/FritzBox-Anmedlung.jpg)
Open the FritzBox login page. Normally, this login page can be found at **https://192.168.178.1**.
#### Step 2
![Fritzbox Dashboard](/images/posts/fritzbox/FritzBox-Dashboard.jpg)
After successfully logging in, you will be taken to the dashboard overview page of your FritzBox. This overview may look slightly different depending on your firmware.
#### Step 3
![Fritzbox Internet sharing](/images/posts/fritzbox/FritzBox-Internet-Freigaben.jpg)
In the left-hand menu, select the menu item **Internet->Sharing**.
#### Step 4
![Device for Fritzbox Internet sharing](/images/posts/fritzbox/FritzBox-Overview-Port-Sharing.jpg)
When the Internet Sharing overview window opens, click on the button **Add device for sharing**.
#### Step 5
![Set up Fritzbox device manually](/images/posts/fritzbox/FritzBox-Portfreigabe-einrichten-Geraet-auswaehlen.jpg)
First, open the Device pull-down menu and select a device for which you want to set up port forwarding, or scroll down to the bottom of the pull-down menu and select Add IP address manually.
#### Step 6
![Fritzbox create new sharing](/images/posts/fritzbox/FritzBox-Portfreigabe-Neue-Freigabe.jpg)
Once you have selected or set up a device, click on the **New sharing** button to set up a new port forwarding. A pop-up window will open to set up the sharing.
  
#### Step 7
![Fritzbox Set up port forwarding](/images/posts/fritzbox/FritzBox-Portfreigabe-Alternativ-eigenen-Port-freigeben-.jpg)
In the Set up sharing window, you can choose from various predefined port forwarding options such as https, http, ftp, etc., or you can set up your own forwarding and select Other application.
In this example, I am setting up port 22 for an SSH connection to the Playstation4 device.
  
In the pop-up window below, you must select the **Enable sharing** checkbox and select the Internet protocol (IPv4 and IPv6, IPv4, or IPv6) for which you want to enable sharing.
  
After making your selection, confirm the configuration by clicking the **OK button**.
#### Step 8
![Confirm Fritzbox port forwarding](/images/posts/fritzbox/FritzBox-Portfreigabe-Eingerichtete-Freigaben-bestaetigen.jpg)
In the Device sharing overview, you will now see the previously configured sharing at the bottom. To confirm this, complete the sharing setup by clicking on the **OK button**.
  
#### Step 9
![Fritzbox Enable sharing](/images/posts/fritzbox/FritzBox-Portfreigabe-Ueberpruefung-der-angelegten-Portfreigaben.jpg)
To activate the created share, you must click on the Apply button in the Shares window. The **sharing** is now marked as **active** in the overview.  
### Exposed Host - Sharing
![Fritzbox Exposed Host Sharing](/images/posts/fritzbox/FritzBox-Portfreigaben-Anmerkung-Portfreigaben.jpg)
As shown in the image above, it is also possible to enable all ports for a device (Exposed Host).
This general enabling of all ports for a device is used, for example, when a hardware firewall is operated behind the FritzBox.
> #### Security note Exposed Host
>
> The use of port forwarding for all ports for a device (Exposed Host) should only be carried out by operators who have expert knowledge of the use of Internet protocols and firewall configuration. By selecting this setting, the forwarded device is accessible from the Internet without protection and is therefore vulnerable to attack.

### Independent port forwarding UPnP
The Universal Plug and Play (UPnP) function, which is found in routers in general and not only in the FritzBox, is used for communication between IP-based communication participants in a network and enables devices, among other things, to negotiate independent port forwarding with the router (FritzBox).
Unfortunately, this feature is often exploited to allow devices in the home network to open ports in the firewall independently, which can then be misused for DDos attacks or denial of service attacks.
In general, port forwarding should only be set up manually to ensure the best possible overview of open doors in the firewall.

### Important information about port forwarding
What is a port?

[https://de.wikipedia.org/wiki/Port\_(Protocol)](https://de.wikipedia.org/wiki/Port_\(Protocol\))

What is port forwarding / port sharing?

[https://de.wikipedia.org/wiki/Portweiterleitung](https://de.wikipedia.org/wiki/Portweiterleitung)

<!-- FM:Snippet:Start data:{"id":"Visit Help-page","fields":[]} -->
> ## Questions and answers
> 
> If you have any questions or feedback about this blog or YouTube channel, please use my help page. Here you will find questions and answers about the various posts. You are also welcome to ask your own question here.
>
> [**Visit the Help-page**](https://help.secure-bits.org/)
<!-- FM:Snippet:End -->
