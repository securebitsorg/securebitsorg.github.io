---
title: Tipp - Fritzbox Portfreigabe richtig einrichten
descripton: Fritzbox Portfreigabe richtig einrichten | In diesem Video zeige ich, wie ihr eine Freigabe / Portweiterleitung in der Fritzbox konfiguriert.
hero: /images/posts/fritzbox/Video-FritzBox-Portfreigabe.png
date: 2022-03-19
menu:
  sidebar:
    name: Fritzbox Portfreigabe einrichten
    identifier: fritzbox-port
    parent: fritzbox
categories: 
  - "Hardware"
  - "Netzwerk"
  - "Security"
  - "Tutorials"
  - "Video"
tags: 
  - "fritzbox"
  - "netzwerk"
  - "security"
  - "tutorials"
  - "video"
---

## FritzBox Portfreigabe einrichten

Im heutigen Beitrag geht es darum, wie ihr eine **FritzBox Portfreigabe** richtig einrichtet, wofür ihr diese verwenden könnt und welche Risiken durch den Einsatz dieser Portfreigabe entstehen.

Folge der unteren Schritt für Schritt-Anleitung um eine Portfreigabe in deiner FritzBox einzurichten.

Für Alle unter euch, die das Ganze lieber in einer Video-Anleitung anschauen möchten, gibt es das Video "FritzBox Portfreigabe einrichten" auf meinem YouTube-Kanal.

### Video-Tutorial zum Thema 'FritzBox Portfreigabe einrichten'

{{< youtube dUuABciDCWs >}}


### Tutorial - FritzBox Portfreigabe einrichten

In dieser Schritt für Schritt-Anleitungen zeige ich euch, wie ihr eine Portfreigabe bei einer FritzBox einrichtet.

#### Tools:

- Internet-Browser.

#### Was benötigst du dafür?

- Einen FritzBox-Router.

### Schritte für das Einrichten einer FritzBox Portfreigabe:

#### Step 1

![Fritzbox Anmeldung](/images/posts/fritzbox/FritzBox-Anmedlung.jpg)

Aufruf der FritzBox-Anmeldeseite. Im Normalfall ist diese Anmeldeseite der FritzBox unter **https://192.168.178.1** erreichbar.  

#### Step 2

![Fritzbox Dashboard](/images/posts/fritzbox/FritzBox-Dashboard.jpg)

Nach erfolgreicher Anmeldung landet ihr auf der Dashboard-Übersichtsseite eurer FritzBox. Diese Übersicht kann je nach Firmware, ein wenig anders bei euch ausschauen.  

#### Step 3

![Fritzbox Internetfreigaben](/images/posts/fritzbox/FritzBox-Internet-Freigaben.jpg)

Im linken Menü wählt ihr den Menüpunkt **Internet->Freigaben** aus.  

#### Step 4

![Gerät für Fritzbox-Internetfreigabe](/images/posts/fritzbox/FritzBox-Uebersicht-Portfreigaben.jpg)

Wenn sich das Übersichts-Fenster der Internetfreigaben geöffnet hat, klickt ihr auf den Button **Gerät für Freigaben hinzufügen**  

#### Step 5

![Fritzbox Gerät manuell einrichten](/images/posts/fritzbox/FritzBox-Portfreigabe-einrichten-Geraet-auswaehlen.jpg)

Hier öffnet ihr zunächst das Pulldown-Menü **Gerät** aus und wählt hier ein Gerät, für das ihr eine Portfreigabe einrichten möchtet oder scrollt im Pulldown-Menü bis ganz nach unten und wählt hier den Punkt **IP-Adresse manuell hinzufügen** aus.  

#### Step 6

![Fritzbox neue Freigabe erstellen](/images/posts/fritzbox/FritzBox-Portfreigabe-Neue-Freigabe.jpg)

Habt ihr ein Gerät ausgewählt oder aber eingerichtet, so klickt ihr dann auf den Button **Neue Freigabe** um eine neue Portweiterleitung einzurichten. Es öffnet sich nun ein Popup-Fenster um die Freigabe einzurichten.  

#### Step 7

![Fritzbox Portfreigabe einrichten](/images/posts/fritzbox/FritzBox-Portfreigabe-Alternativ-eigenen-Port-freigeben-.jpg)

In dem Fenster **Freigabe einrichten** könnt ihr aus verschiedenen vorgegebenen Portfreigaben wie zum Beispiel https, http, ftp und so weiter auswählen oder aber, ihr richtet eine eigene Freigabe ein und wählt hier den Punkt **Andere Anwendung** aus.  
In diesem Beispiel richte ich den Port 22 für eine SSH-Verbindung zum Gerät Playstation4 ein.  
Im Popup-Fenster unten, müsst ihr noch auswählen das Kontroll-Kästchen **Freigabe aktivieren** markieren und auswählen, für welches Internet-Protokoll (IPv4 und IPv6, IPv4 oder IPv6) ihr die Freigabe aktivieren möchtet.  
Nach dieser Auswahl die Konfiguration durch das Bestätigen des **OK-Buttons** bestätigen.  

#### Step 8

![Fritzbox Portfreigabe bestätigen](/images/posts/fritzbox/FritzBox-Portfreigabe-Eingerichtete-Freigaben-bestaetigen.jpg)

In der Übersicht Freigaben für Gerät seht ihr jetzt unten die zuvor eingerichtete Freigabe. Um diese nun zu Bestätigen, schließen wir die Einrichtung der Freigabe mit einem Klick auf die **Schaltfläche OK** ab.  

#### Step 9

![Fritzbox Freigabe aktivieren](/images/posts/fritzbox/FritzBox-Portfreigabe-Ueberpruefung-der-angelegten-Portfreigaben.jpg)

Um die erstellte Freigabe zu aktivieren, muss in Fenster Freigaben noch auf die **Schaltfläche Übernehmen** geklickt werden. Nun wird die **Freigabe** in der Übersicht als **aktiv** markiert.  

### Exposed Host - Freigabe
![Fritzbox Exposed Host-Freigabe](/images/posts/fritzbox/FritzBox-Portfreigaben-Anmerkung-Portfreigaben.jpg)
Wie im oberen Bild zu sehen, gibt es auch die Möglichkeit, alle Ports für ein Gerät freizugeben (Exposed Host).

Diese allgemeine Freigabe aller Ports für ein Gerät wird zum Beispiel bei dem Einsatz einer Hardware-Firewall die hinter der FritzBox betrieben wird, eingesetzt.

> #### Sicherheitshinweis Exposed Host
>
> Der Einsatz der Freigabe aller Ports für ein Gerät (Exposed Host) sollte nur von Betreibern erfolgen, die fachmännisches Wissen über den Einsatz von Internetprotokollen und Firewall-Konfiguration haben. Durch Auswahl dieser Einstellung, ist das freigegebene Gerät aus dem Internet ungeschützt erreichbar und damit angreifbar.

### Selbstständige Portfreigaben UPnP

Die Funktion Universal Plug and Play (UPnP) die in Routern generell und nicht nur bei der FritzBox anzutreffen ist, dient der Kommunikation IP-basierter Kommunikations-Teilnehmer in einem Netzwerk und ermöglicht Geräten, unter anderem selbstständige Portfreigaben mit dem Router (FritzBox) auszuhandeln.

Leider wird diese Funktion oft dazu ausgenutzt, dass sich im Heimnetz befindliche Geräte selbstständig Ports in der Firewall öffnen können und somit für DDos-Attacken oder Denial of Service Attacken missbraucht werden können.

Generell sollten Portfreigaben nur manuell angelegt werden um ein bestmögliche Übersicht über offene Türen in der Firewall zu haben.

### Wissenswertes über Portfreigaben

Was ist ein Port?

[https://de.wikipedia.org/wiki/Port\_(Protokoll)](https://de.wikipedia.org/wiki/Port_\(Protokoll\))

Was ist eine Portweiterleitung / Portfreigabe

[https://de.wikipedia.org/wiki/Portweiterleitung](https://de.wikipedia.org/wiki/Portweiterleitung)

### Andere Themen zur FritzBox-Konfiguration

FritzBox [Gastzugang einrichten](https://secure-bits.org/fritzbox-gastzugang-einrichten-aktivieren/)
