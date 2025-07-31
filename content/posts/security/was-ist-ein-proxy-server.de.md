---
title: Was ist ein Proxy Server?
date: 2019-03-07
categories:
  - Netzwerk
  - Security
tags:
  - netzwerk
  - security
  - tutorials
description: Was ist ein Proxy-Server und wofür wird dieser verwendet?
preview: ../../../assets/images/posts/it-security/proxy-server.jpg
hero: /images/posts/it-security/proxy-server.jpg
menu:
  sidebar:
    name: Was ist ein Proxy-Server und wofür wird dieser verwendet?
    identifier: proxy
    parent: security
lastmode: 2025-07-28T14:32:35.743Z
keywords:
  - proxy-server
---

## Anonym im Internet surfen

In diesem Beitrag versuche ich euch in hoffentlich verständlichen Worten die Frage "Was ist ein Proxy Server?" zu beantworten.

Um anonym im Internet surfen zu können, ist unteranderem der Einsatz eines Proxy Server unumgänglich. In diesem Beitrag erfahrt ihr auf welche Besonderheiten ihr bei der Auswahl eines Proxy Servers achten müsst und woher ihr diesen beziehen könnt.

## Funktionsweise

Ein Proxy Server kann man als Vermittler oder Zwischenhändler im Netzwerk betrachten. Dieser empfängt die Anfragen eines Proxy-Client (z.B. Desktop) und gibt diese in seinem Namen an den Ziel-Webserver weiter, der vom Proxy-Client angefragt wurde. 

![Proxy-Listen.de](/images/posts/it-security/proxy_listen_de.jpg)

Um diesen Verlauf mal vereinfacht darzustellen, bedienen ich mich dem folgenden Szenario: 

### Der Proxy-Server

**Stellt euch vor ihr leitet ein Team. Jeder Mitarbeiter in deinem Team möchte Verbesserung vorschlagen, wie sich die Arbeit noch effizienter erledigen lässt. Natürlich soll jetzt nicht jeder von deinen Mitarbeitern zum Chef rennen und ihm mit seiner Super-Idee nerven. Also pflichtbewusst wie du bist, sammelst du alle Vorschläge, fasst diese in deinen Worten zusammen und trägst dann alles zusammen deinem Chef vor.** 

**In diesem vorgestellten Szenario bist du der Proxy-Server, die Mitarbeiter sind die Proxy-Clients und dein Chef ist der Web-Server.** 

### Arten von Proxy Server für die Anonymisierung von Datenverkehr im Internet

Es gibt drei verschiedene Arten von Proxy Server die **bei einer Anonymisierung** als Vermittlerstelle fungieren können, wobei eigentlich nur zwei für diese Art der Netzwerk-Kommunikation von nutzen sind. Diese drei Arten von Server unterteilen sich folgendermaßen: 

- **Level 1 - Elite Proxies**
  - Bei einem Level 1-Proxy Server werden weder eure IP-Adresse noch die Verwendung eines Proxy-Server dem Webserver mitgeteilt (keine der unten genannten Variablen werden im Header mitgesendet). Dieser Level 1 Server ist daher den anderen Level-Servern im Bezug der Anonymität unbedingt vorzuziehen!
- **Level 2 - Anonymous Proxies**
  - Bei dieser Art von Proxy-Server werden dem Gegenüber mitgeteilt, dass die Anfrage über einen Proxy-Server gestellt wird. Die IP-Adresse wird dabei aber nicht übermittelt und man bleibt hierbei in gewisserweise dem angefragten Server gegenüber anonym.
- **Level 3 - Transparent Proxies**
  - Transparent Proxies werden meist und sollten auch nur in Verwendung einer Server-Kette (wenn mehrere Server hintereinander geschaltet werden) verwendet werden. Dier Server-Typ übermittelt die angefragende IP-Adresse sowie auch seinen Status als Proxy-Server seinem Gegenüber.

### Die Header-Variablen

Um hier eine Differenzierung der einzelnen Level vornehmen zu können, muss man sich die Header-Variablen die in den Traffic-Paketen eingefügt werden, genauer anschauen. Diese Variablen werden vom Proxy-Server dem Gegenüber unter Umständen mitgeteilt und sind somit ausschlaggebend für die Einstufung als Anonymisierungs-Server.   

#### Die wichtigsten Variablen im Überblick

```sh
HTTP_CLIENT_IP
X_FORWARDED_FOR
X_HTTP_FORWARDED_FOR
FORWARDED_FOR
HTTP_X_FORWARDED_FOR
```

Solltet ihr einer der oberen Variablen im Header finden, dann weiß der angefragte Webserver eure IP-Adresse!

```sh
HTTP_VIA
HTTP_FORWARDED
HTTP_PROXY_CONNECTION
```

Die oberen drei Variablen zeigen dem angefragten Webserver, dass die Anfrage über einen Proxy-Server erfolgt und kann daher dazu führen, dass der Webserver die Anfrage ablehnt. Dies ist zum Beispiel der Fall, wenn ihr durch die Nutzung eines Proxy-Servers versucht die Länderbeschränkung zu umgehen um auf ein Videoportal zuzugreifen zu können, welches in Deutschland nicht verfügbar ist.

## Übersicht verfügbarer kostenloser Proxy-Server

Um nun anonym im Internet surfen zu können braucht ihr natürlich am besten auch einen kostenlosen Proxy-Server. Eine gute Auflistung mit entsprechender erweiteter Suche (z.B. nach Level, Verfügbarkeit, usw.) findet ihr auf der Seite [proxy-listen.de](https://www.proxy-listen.de/Proxy/Proxyliste.html).  


<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->