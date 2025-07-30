---
title: What is a proxy server?
date: 2019-03-07
categories:
- Network
- Security
tags:
- network
- security
- tutorials
description: What is a proxy server and what is it used for?
preview: ../../../assets/images/posts/it-security/proxy-server.jpg
hero: /images/posts/it-security/proxy-server.jpg
menu:
  sidebar:
    name: What is a proxy server and what is it used for?
    identifier: proxy
    parent: security
lastmode: 2025-07-28T14:32:35.743Z
keywords:
- proxy server
---
## Surfing anonymously on the Internet
In this article, I will try to answer the question “What is a proxy server?” in hopefully understandable terms.
In order to surf anonymously on the Internet, the use of a proxy server is essential. In this article, you will learn what special features you need to look for when choosing a proxy server and where you can get one.
## How it works
A proxy server can be viewed as an intermediary or middleman in a network. It receives requests from a proxy client (e.g., desktop) and forwards them on its behalf to the target web server requested by the proxy client.


![Proxy-Listen.de](/images/posts/it-security/proxy_listen_de.jpg)


To simplify this process, I will use the following scenario:


### The proxy server
**Imagine you are managing a team. Every employee in your team wants to suggest improvements on how to make their work more efficient. Of course, you don't want all your employees running to the boss with their great ideas. So, being the conscientious person you are, you collect all the suggestions, summarize them in your own words, and then present everything to your boss.** 
**In this scenario, you are the proxy server, the employees are the proxy clients, and your boss is the web server.**
 
### Types of proxy servers for anonymizing Internet traffic
There are three different types of proxy servers that can act as intermediaries **for anonymization**, although only two are actually useful for this type of network communication. These three types of servers are divided as follows:
- **Level 1 - Elite Proxies**
  - With a Level 1 proxy server, neither your IP address nor the use of a proxy server is disclosed to the web server (none of the variables listed below are sent in the header). This Level 1 server is therefore definitely preferable to the other level servers in terms of anonymity!
- Level 2 - Anonymous Proxies
- With this type of proxy server, the other party is informed that the request is being made via a proxy server. However, the IP address is not transmitted and you remain anonymous to the requested server to a certain extent.
- Level 3 - Transparent proxies
- Transparent proxies are mostly used and should only be used in a server chain (when several servers are connected in series). This server type transmits the requesting IP address and its status as a proxy server to the other party.
### The header variables
In order to differentiate between the individual levels, you need to take a closer look at the header variables that are inserted into the traffic packets. These variables may be communicated by the proxy server to the other party and are therefore decisive for classification as an anonymization server.
#### The most important variables at a glance
```sh
HTTP_CLIENT_IP
X_FORWARDED_FOR
X_HTTP_FORWARDED_FOR
FORWARDED_FOR
HTTP_X_FORWARDED_FOR
```
If you find one of the above variables in the header, the requested web server knows your IP address!
```sh
HTTP_VIA
HTTP_FORWARDED
HTTP_PROXY_CONNECTION
```
The top three variables show the requested web server that the request is being made via a proxy server and may therefore cause the web server to reject the request. This is the case, for example, if you are using a proxy server to try to bypass country restrictions in order to access a video portal that is not available in Germany.
## Overview of available free proxy servers
To surf the Internet anonymously, you will of course need a free proxy server. A good list with an advanced search function (e.g. by level, availability, etc.) can be found at [proxy-listen.de](https://www.proxy-listen.de/Proxy/Proxyliste.html).

<!-- FM:Snippet:Start data:{"id":"Visit Help-page","fields":[]} -->
> ## Questions and answers
> 
> If you have any questions or feedback about this blog or YouTube channel, please use my help page. Here you will find questions and answers about the various posts. You are also welcome to ask your own question here.
>
> [**Visit the Help-page**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->