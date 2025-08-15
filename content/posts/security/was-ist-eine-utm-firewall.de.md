---
title: Was ist eine Unified Threat Management Firewall?
date: 2025-07-25T05:22:28.741Z
categories:
  - Netzwerk
  - Security
  - Tutorials
  - Firewall
tags:
  - firewall
  - netzwerk
  - security
preview: ../../../assets/images/posts/it-security/UTM-Diagramm.png
hero: /images/posts/it-security/UTM-Diagramm.png
menu:
  sidebar:
    name: Was ist eine UTM-Firewall?
    identifier: utm
    parent: security
keywords:
  - Unified Threat Management
description: In diesem Artikel, erfahrt ihr, was eine Unified Threat Management Firewall (kurz UTM) ist.
slug: was-ist-eine-unified-threat-management-firewall
---

## Unified Threat Management Appliances (UTM-Firewall)

In meinem Beitrag "[Wie funktioniert eine Firewall?](https://secure-bits.org/posts/security/wie-funktioniert-eine-firewall/)", habe ich euch beschrieben wie eine Firewall aufgebaut ist und welche Unterschiede bei den einzelnen Firewall-Arten bestehen.

In diesem Beitrag möchte ich euch nun die Funktionsweise einer Unified Threat Management (UTM oder UTM-Firewall) näherbringen und euch hier die einzelnen Funktionen sowie Fachbegriffe erklären.

## Was ist der Unterschied zwischen einer UTM-Firewall und einer normalen Firewall?

Hierzu gibt es eine klare Begriffsdefinition, die die Bezeichnung einer Sicherheits-Komponente (Security-Appliance) festlegt. Zum Beispiel wird eine reine Firewall als Specialized Security Appliances (SSA) bezeichnet, da diese Netzwerk-Sicherheitskomponente eine klare definierte Aufgabe im Sicherheitssystem ausführt. In diesem Fall also, Unterbindung von Netzwerkverbindungen nach einem definierten Regelwerk.

Als UTMA / UTM werden Sicherheits-Netzwerkkomponenten bezeichnet, die mehrere Sicherheitskomponenten (Specialized Security Appliances (SSA)) eines Netzwerks in sich vereinen. Welche das sind, erfahrt ihr im nächsten Absatz.

## Was beinhaltet ein Unified Threat Management System?

Ein Netzwerk-Sicherheitssystem das sich als UTM bezeichnen darf, muss mehrere Eigenschaften beziehungsweise Funktionen aufweisen. Dieser Funktionsumfang wurde von Charles Kolodgy von der International Data Corporation im Jahr 2004 festgelegt.

Diese Festlegung legt fest, welche Eigenschaften eine Unified Threat Management Appliances (UTMA) beinhalten muss.

![UTM-Diagramm](/images/posts/it-security/UTM-Diagramm.png)

## Unified Threat Management - Eigenschaften und Funktionen:

- Internet-Gateway
- [Firewall](https://secure-bits.org/posts/security/wie-funktioniert-eine-firewall/)
- Virtual Private Network Gateway (VPN)
- Virus Protection
- Intrusion Detection System
- Contentfilter
- Spam Protection
- Surf Protection
- Authentifizierung
- Quality of Service (QoS)
- Reporting

### Intrusion Detection- sowie Intrusion Protection System erklärt

### Was ist ein Intrusion Detection System?

Als Intrusion Detection System (IDS) wird ein Angriffserkennungssystem bezeichnet, welches Angriffe im Netzwerk mithilfe von Filtern und Signaturen sowie auch durch statische Analysen erkennt und protokolliert.  
Im Gegensatz zum Intrusion Prevention System (IPS) erkennt das Intrusion Detection System nur die Angriffe auf ein Computernetzwerk und protokolliert diese.  
Bei einem Intrusion Prevention System (IPS) wird wie schon erwähnt, die Angriffe auf das Netzwerk nicht nur erkannt und protokolliert, sondern werden hierbei diese Angriffe auch abgewehrt beziehungsweise geblockt.  
Da beide Systeme auf Grundlage von Filtern und Signaturen ihre Arbeit verrichten, ist der Einsatz eines solche Netzwerk-Sicherheitssystems sehr Ressourcen-Intensiv und setzt je nach größer der zu verarbeiteten Datenmengen, performante Hardware voraus.  
Des Weiteren gibt es auch beide Systemvarianten, die nicht nur per Filter- und Signaturregelwerk ihren Dienst verrichten, sondern auch unbekannte Angriffe per heuristischer Methode überprüfen.  
Bei den meisten Unified Threat Management Systemen werden die IPS- oder IDS-Systeme manuell durch den Administrator aktiviert sowie die Filter administriert.

- Gängig sind drei Arten von IDS Systemen:
- Hybride IDS Systeme
- Netzwerk-basierte IDS Systeme (NIDS)
- Host-basierte IDS Systeme (HIDS)

### Surf Protection / Web Content Filter

Eine weitere Funktion, die eine UTM-Firewall nach der Definition Unified Threat Management Appliance bereitstellen muss, ist die Funktionalität der sogenannte Surf Protection beziehungsweise einen Web Content Filter.

#### Einfacher Content-Filter

Hierbei werden Inhalte (Content) bei Internetanfragen nach Regelvorgaben der Surf Protection gefiltert. Diese Filterung geschieht auf verschiedenen Wegen. Im einfachen Sinn werden Zeichenfolgen überprüft, die bestimmte Zeichenfilter (Sex, Hass, etc.) meist über ein Web-Proxy (bei einem zentralen Netzwerk-Content-Filter) vorab überprüfen und erst nach erfolgreicher nicht positiver Überprüfung, an den jeweiligen Client weiterreichen. Weiterhin können auch gewisse Ports gesperrt werden.

Nachteil dieser Methode ist under anderem, dass auch Inhalte blockiert werden, die einen Teil von diesen Zeichenfolgen in ihrer Zeichenkette beinhalteten. So zum Beispiel bei dem Filterwort "Rechts" auch Inhalte wie Rechtswissenschaften blockiert werden.

#### Intelligenter Content-Filter

Intelligente Content Filter zeichnen sich dadurch aus, dass diese mit Hilfe der Heuristik und Wägungen, eine bessere Trefferquote erreichen. So durch Prüfung der Plausibilität abwägen, ob es sich bei dem zu durchsuchen Content um eine zum Beispiel sperrbare Webseite handelt. Hier wird dann zum Beispiel unterschieden, dass rechtsextreme Seiten (deren Inhalt) mit Seiten über Rechtswissenschaften gleichzusetzen sind. 

In manchen UTMA-Systemen werden auch durch künstliche Intelligenz unterstützte Verfahren eingesetzt oder als Zusatz-Applikation angeboten.

**Weiterführende Links zu diesem Thema:**

[Contentfilter – Wikipedia](https://de.wikipedia.org/wiki/Contentfilter)

### Internet-Gateway

Als Internet-Gateway wird die Schnittstelle bezeichnet, die dem internen Netzwerk eine Verbindung mit dem Internet ermöglicht.  

Hier bieten einige Systeme (UTM-Firewall) eine Modemfunktionalität für diverse Arten von Internetverbindungen an, um diese als Ersatz für Router der Serviceprovider bereitzustellen.  

### Virtual Private Network Gateway (VPN)

Für eine sichere Verbindung von zum Beispiel Fernarbeitsplätze zum Unternehmensnetzwerk, ebenso zum Beispiel zur sicheren Steuerung eurer Smart Home-Infrastruktur Zuhause, ist der Weg über eine sichere Virtual Privat Network-Verbindung unumgänglich.  

Bei dieser reinen softwarebasierten Technik wird mithilfe eines virtuellen Netzwerkbereichs, ein entferntes Netzwerk in eurem bestehenden Netzwerk eingebunden. Wobei zu beachten ist, dass diese VPN-Verbindung nicht von Haus aus als verschlüsselt betrachtet werden darf. Diese Verschlüsselung kommt erst durch den Einsatz diverser VPN-Protokolle die durch ihre Verwendung, so eine abhörsichere Verbindung zwischen dem VPN-Gateway eurer Unified Threat Management-Firewall und dem Client oder anderen VPN-Gateway gewährleisten. 

#### Meistgenutzte VPN-Protokolle bei Unified Threat Management-Firewalls:

- SSL-VPN 
- IPsec 
- TLS/SSL 
- SSH 
- Wireguard 
- SSTP 
- L2TP 
- getVPN

### Authentifizierung UTM-Firewall

Weiterhin gehört zu einem Unified Threat Management / UTM-Firewall auch die Funktionalität einer Authentifizierungs-Möglichkeit dazu. Diese Möglichkeit sich dem System oder dem eingesetzten Dienst gegenüber zu Authentifizieren, bietet somit eine weitere Sicherheitsebene, so das nur bekannte Clients eine Verbindung mit dem Gateway über zum Beispiel einer VPN-Verbindung aufbauen können. 

Als Authentifizierungs-Dienste werden je nach Hersteller verschiedene Möglichkeiten angeboten.  

#### Hier eine Auswahl an Dienste zur Authentifizierung:

- Radius-Server 
- Datenbankbasierte Authentifizierung 
- LDAP-Authentifizierung 
- Active-Directory

### Virus Protection

Unter Virus Protection bei einem Unified Threat Management System versteht man, eine Antiviren-Sicherheitslösung die fest in der UTM-Firewall implementiert ist und Datenblöcke mit Hilfe von Signaturen nach Schadcode hin überprüft.

Bei Open Source-Firewalls wie zum Beispiel **OPNSense**, **IPFire** oder **pfsense** werden hier als Antiviren-Lösung **ClamAV** eingesetzt. Bei Firewall-Distributionen von kostenpflichtigen Anbietern wird hier oft eigene Scan-Engine beziehungsweise Lösungen bekannter Antiviren-Hersteller. So nutzt der Hersteller **Sophos** bei seinem [Sophos UTM-Produkt](https://www.sophos.com/de-de/products/unified-threat-management.aspx) zum einem die Engine seiner eigenen Antiviren-Lösung und als weitere Scan-Lösung die Engine von **Avira**.

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://help.secure-bits.org/help)
<!-- FM:Snippet:End -->
