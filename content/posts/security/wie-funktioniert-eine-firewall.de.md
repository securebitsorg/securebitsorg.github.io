---
title: Wie funktioniert eine Firewall?
date: 2018-08-09
categories:
  - Netzwerk
  - Security
  - Tutorials
tags:
  - firewall
  - netzwerk
  - security
  - tutorials
draft: false
description: Wie funktioniert eine Firewall und welche Arten von Firewall gibt es?
preview: ../../../assets/images/posts/it-security/UTM-Firewall-Hardware.png
hero: /images/posts/it-security/UTM-Firewall-Hardware.png
menu:
  sidebar:
    name: Wie funktionieren Firewalls und welche verschiedenen Arten gibt es?
    identifier: funktion-firewall-
    parent: security
---

## Was ist eine und wie funktioniert eine Firewall?

In diesem Artikel möchte ich unter anderem mit Hilfe des OSI-Schichten-Modell die Frage „**Wie funktioniert eine Firewall**“ beantworten. Um Sicherheit in einem Netzwerk zu gewährleisten zu können, ist das Verstehen wie eine Firewall funktioniert, natürlich von größter Wichtigkeit. Daher versuche ich in diesem Beitrag, euch die einzelnen Funktionen einer Firewall hoffentlich verständlich zu erklären. Damit ihr den Datenverkehr optimal auf eure Anforderungen hin steuern könnt.

Wenn wir die Funktionsweise einer Firewall aufzeigen wollen, dann sollten wir uns zunächst einmal das OSI-Schicht-Modell näher ansehen.

### Wie funktioniert eine Firewall - OSI-Schicht Modell

![Das OSI-Schichtenmodell](/images/posts/it-security/osi-modell.jpg)

OSI-Schichten Modell - Wie funktioniert eine Firewall

[Das OSI-Modell](https://de.wikipedia.org/wiki/OSI-Modell) ist in sieben Sichten unterteilt, wobei hier zum Thema Firewall nur die Schichten 3, 4 und 7 von Bedeutung sind.

### OSI-Modell Schicht 3 - Vermittlungsschicht (Network-Layer)

Der Network-Layer beziehungsweise die Vermittlungsschicht ist für das Schalten von Verbindungen (leistungsorientierten Diensten) sowie bei paketorientierten Diensten für die Weitervermittlung von Datenpakete zuständig. Wichtig ist hierbei, dass Pakete nicht in andere Schichten gelangen, sondern von Knoten zu Knoten vermittelt werden. Sind “Sender” und “Empfänger” nicht direkt erreichbar, wird den Paketen immer ein neues Zwischenziel (Knoten) zugewiesen, bis das eigentliche Ziel erreicht wurde.

Die Aufgabe der Vermittlungsschicht ist es, den Paketen eine Adressierung zu geben, Aushandlung und Sicherstellung einer gewissen Dienstgüte, Aktualisierung der Routingtabellen und Aufbau des Routings selbst.

#### Hardware die in dieser Schicht genutzt werden:
> Schreibt mir!
> 
> Wenn hierzu noch Fragen habt, euch etwas nicht gefällt oder ihr habt Fehler entdeckt, dann hinterlasst einen Kommentar. Gerne könnt ihr mir auch Fragen über das Kontaktformular zukommen lassen.
- Router

- Layer-3-Switch

#### Protokolle die in dieser Schicht genutzt werden:

- IP, IPsec, ICMP, X25 (WAN), CLNP

### OSI-Modell Schicht 4 - Transportschicht (Transport-Layer)

Die Transportschicht ist für die Segmentierung und Stauvermeidung des Datenstroms zuständig. 

Die Segmente werden Service Data Unit genannt und werden auf der vierten Schichtebene transportiert. Zur Adressierung wird dem Datensegment eine vierte Schicht-Adresse zugeteilt, diese Adresse ist dann der Port. Dieses Datensegment wird dann in ein Datenpaket gekapselt und kommt in die dritte Schicht (Vermittlungsschicht). 

#### Protokolle:

- TCP, UDP, SCTP, DCCP 

### OSI-Modell Schicht 7 - Anwendungsschicht (Application-Layer)

In der Anwendungsschicht werden Funktionen für Anwendungen (dessen Kommunikation) zur Verfügung gestellt. Hier werden dann die Verbindungen zu den unteren Schichten hergestellt, des Weiteren finden hier auch die Dateneingaben sowie Datenausgaben statt. 

#### Anwendungen (Apps):

- E-Mail-Programme, Messaging (z.B. Facebook, Twitter, etc.), Browser 

## Was ist eine Firewall?

Eine Firewall ist ein Sicherungssystem, das anhand von Regeln einen Netzwerkbereich von unautorisierten Zugriffen schützt. Die Firewall ist selbst nicht in der Lage, Angriffe auf das Netzwerk selbstständig zu erkennen, da die Firewall nur regelbasiert arbeitet. 

## Grundfunktionen einer Firewall

Als Grundfunktion nutzt die Firewall sogenannte Paketfilter. Dieser Paketfilter arbeitet nach statischen Regeln und überprüft jedes Datenpaket einzeln, kann aber keine Verbindungen zu vorherigen Paketen herstellen. 

Eine erweiterte Form der Paketfilterung ist die sogenannte Stateful Inspection. Bei dieser Paketfilterung werden einzelne Beziehungen zu den überwachten Datenpaketen erkannt und überprüft. 

## Funktionsweise der Paketfilterung

Bei der Paketfilterung werden die Datenpakete anhand einer Netzwerkadresse identifiziert und wird ihren Zielen entweder zugeführt oder geblockt. Um diese Richtlinien umzusetzen werden bei den einzelnen Datenpaketen die Header-Informationen ausgewertet und nach diesen Informationen regelbasiert behandelt. Die Paketfilterung arbeitet somit in den Schichten Transport-Layer (Schicht 4, Port), Network-Layer (Schicht 3, IP-Adresse) sowie bei manchen Stateful-Firewalls noch die Schicht Application-Layer (Schicht 7, hier die Nutzerdaten) des OSI-Modells. 


## Funktionsweise der Stateful Inspection Paketfilterung

Stateful Inspection ist eine dynamische Art der Paketfilterung. Hierbei wird jede Verbindungsanfrage genauer konkretisiert. Beziehungen zu angefragten Datenpaketen und abgegebenen Datenpaketen werden hierbei untersucht und somit kann eine genauere Zuordnung der erlaubten Datenpakete getroffen werden. Hierdurch wird sichergestellt, dass nur beteiligte Kommunikationspartner auf die Verbindung zugreifen können. 

## Wie funktioniert eine Firewall - Arten von Firewall

### Personal Firewall

Die Personal Firewall oder auch Desktop Firewall genannt, ist eine Sicherheits-Software, die die Kommunikation eines einzelnen Computers überwacht. Die Personal Firewall ist einzeln oder in vielen Antiviren-Sicherheitslösungen der bekannten Hersteller enthalten. Ob diese Art von Sicherheitslösung aus der Sicht der Sicherheit eures Computers empfehlenswert ist, bleibt mal dahingestellt. Hierzu habe ich vor einiger Zeit auch mal einen Beitrag geschrieben. In dem

### Externe Firewall

Eine externe Firewall auch Hardware Firewall genannt, überwacht die Kommunikation je nach Ausstattung der Hardware, entweder ein internes Netzwerk (LAN, zum Beispiel Firmennetzwerk) oder mehrere Subnetze gegenüber anderen Netzwerksegmente (WAN, zum Beispiel Internet) gegen unberechtigte Zugriffe.

Wobei zu Verständlichkeit der Begriff **Hardware Firewall** hier ein wenig irreführend. Denn eine Firewall basiert immer auf eine Software. Hardware Firewall beschreibt nur die Tatsache, dass diese Sicherheits-Software auf einer separaten Hardware untergebracht ist.

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://help.secure-bits.org)
<!-- FM:Snippet:End -->
