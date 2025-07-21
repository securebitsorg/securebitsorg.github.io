---
title: “Protect yourself against man-in-the-middle attacks”
hero: /images/posts/it-security/Man-in-the-Middle-Angriffe-abwehren.jpg
descripton: “Simple tips and tricks on how to protect yourself against man-in-the-middle attacks.”
menu:
  sidebar:
    name: Protection against man-in-the-middle attacks
    identifier: secure-man-in-the-middle
    parent: security
date: 2021-01-27
categories: 
- "Netzwerk"
- "Security"
- "Tutorials"
tags: 
- "security"
- "tutorials"
---

## Protection against man-in-the-middle attacks
In my last post - [Understanding Man-in-the-Middle Attacks](https://secure-bits.org/man-in-the-middle/) - I explained what Man-in-the-Middle attacks are and what exactly they mean. In this post, I would like to give you some tips and tricks to help you protect yourself against such attacks.

It should be noted that the protective measures presented here cannot be implemented in their entirety by you, as they naturally depend on the infrastructure you use. This means, for example, whether you have your own domain or which hardware components you use in your network.

In general, I can only advise you to invest a few dollars in a few components to protect your network not only from man-in-the-middle attacks, but also from other types of threats.
I have listed some components that you may want to purchase at the end of this article.

Even though some of these links are affiliate links, they are not intended to enrich me with a commission from products you purchase (the sales price remains the same for you and you support this blog), but rather reflect a clear recommendation on my part as additional protection against attacks.

> **I only recommend what I use myself in the same or a similar form!**

## Protection against man-in-the-middle attacks | Protective measures
![Protection against man-in-the-middle attacks](/images/posts/it-security/Man-in-the-Middle-Angriffe-abwehren.jpg)

### Protection of active network components (firewall, switch, etc.)
#### Access control for components
- Replace standard user data with secure passwords
- Make physical access to network components more difficult (lockable room or network cabinet)
- Mechanical locking of ports
#### Protection of endpoints such as PCs, mobile devices, etc.
- Antivirus protection
- Set up device locks for mobile devices
- Correctly configured firewall
- Correctly configured managed switch
- Patch management for endpoints, servers, and active network components
- Grant access rights as much as necessary and as little as possible
- No use of standard passwords
- Only enable or provide server services and services in general that are really necessary
- Protect unused USB ports
### Protection for passive network components
- Mechanical locking of ports
- Access control where possible
### Additional extended protection against man-in-the-middle attacks
#### Protection against attacks on switches
- Replace unmanaged switches with managed switches
- Divide the network into individual virtual subnetworks (VLANs)
- Use dynamic ARP inspection against MAC flooding and ARP poisoning
- Bind ports to specific MAC addresses
- Disable switch ports that are not needed
#### Securing endpoints
- Setting static ARP entries for the default gateway
#### Firewall configuration
- Blocking ICMP type 5 redirect messages
- [Set up DNSSEC](https://de.wikipedia.org/wiki/Domain_Name_System_Security_Extensions#:~:text=Die%20Domain%20Name%20System%20Security,und%20Integrit%C3%A4t%20der%20Daten%20erweitern.)
 
## Protection against man-in-the-middle attacks | General network protection measures
- Secure network traffic with encrypted connections
- Use authentication (Radius server, Active Directory, etc.)
- Do not simply ignore certificate errors and accept them without hesitation
### Important for internal network domains
- Only use publicly resolvable top-level domain names for internal domains, as otherwise no certificates can be issued for internal domains that are certified by a public certification authority and will therefore always display a certificate error when an internal https domain is called up.title: "Schutz vor Man-in-the-Middle-Angriffe erhalten"

---

## Man-in-the-middle attacks - My tips for security enhancements for your network
In this list (* affiliate links - this helps support this blog), I have compiled a list of components that I use myself and therefore consider useful.
Of course, everyone has to decide for themselves an

d adapt to their own requirements! I would like to point out that not everyone uses 19" components in their network or wants to spend so much money on certain things.
### Tools for mechanical protection of network components and end devices
- [Mechanical protection to prevent unauthorized connection of network cables to open RJ45 ports on network components.](https://amzn.to/4lzR1mG)
- [Mechanical security to protect open USB ports from unauthorized use](https://amzn.to/4kGzVCp)
> **IMPORTANT!!!**
>
> An absolute must before using manipulated USB sticks and modified charging cables from mobile devices. The use of such sticks and cables is the most common way to gain access to a network!!!
- [For anyone who uses 19" components in their network infrastructure or wants to store such components in a lockable manner and prefers a clean, tidy solution.](https://amzn.to/3GWI4om)
> I personally use this network cabinet with a depth of 600 mm and 16U and am very satisfied with it, as the manufacturer also offers a wide range of accessories.
### Protection of active network components
#### Managed switch
- [TP-Link TL-SG2428P 24-port Gigabit Managed PoE Switch with 4 SFP slots](https://amzn.to/46hwXko)
Unlike switches from Ubiquiti, for example, this switch offers excellent configuration options for setting up security-related settings to protect against the attack scenarios described above.
You also have the option of operating this switch standalone, i.e. without SDN.
**This switch is also available in a cheaper version without POE support.**
- [TP-Link TL-SG3428 24-port Gigabit L2 Managed Network LAN Switch with 4 SFP slots](https://amzn.to/3IxMiU1)

#### My access points
Not required!!! These are just to give you an idea of which network components I am currently using, as I am often asked about this.
- [TP-Link Access Point EAP683 UR](https://amzn.to/4f2uJYA)
I have used these access points throughout my house and outdoors. I run Unifi Controller as a virtual machine on my Proxmox server.
What I like about these access points is that they can also be installed outdoors, making them an inexpensive alternative to the usually more expensive ACs from other manufacturers that offer comparable features.
Furthermore, the support with new and up-to-date firmware has been really great so far.
Before these access points found their way to me, I was using access points from Sophos. However, their proprietary use (only usable with Sophos firewall products) was a thorn in my side and they were simply too expensive for my requirements (including outdoor use).
#### Hardware firewall used
For me, using a hardware firewall is a clear “**yes, it's a must**.”
For anyone who uses smart home technology, KNX, or a home office and takes security seriously, there is no way around this component.
I also live in a “smart home,” but everything is neatly separated in terms of network technology, and I can disconnect services that are homesick for their manufacturer,8iiiiiiiiii.
> In my professional consulting work, including for larger projects in the construction industry (electrical engineering), I have seen technical electrical installations using KNX that were unsecured and located on the same network as the IT infrastructure, meaning that any attacker could have gained access to the building control system.
>
Personally, I use the hardware linked below and have been using **OPNsense** as my firewall distro for years.
- [Protectli Vault V1610 – 6 ports, micro appliance/mini PC – Intel N6005, 6X 2.5G NICs, 16 GB LPDDR RAM](https://amzn.to/3IPrirQ)

---

## Conclusion on protection against man-in-the-middle attacks
As you have read, there are many ways to protect yourself against man-in-the-middle attacks.
With these tips and tricks, you and your network are well protected, not only against sniffing and man-in-the-middle attacks, but also against other attacks on your network.
This list of measures is quite comprehensive, but it is not exhaustive. However, other measures would require extensive knowledge of IT networks and security, so I have deliberately omitted them, as I believe these tips are sufficient for home use and in most companies.
As always, I would love to hear your feedback!
