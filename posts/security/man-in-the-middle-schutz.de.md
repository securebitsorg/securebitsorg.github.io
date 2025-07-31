---
title: Schutz vor Man-in-the-Middle-Angriffe erhalten
hero: /images/posts/it-security/Man-in-the-Middle-Angriffe-abwehren.jpg
descripton: Einfache Tipps und Tricks, wie du dich gegen Man in the middle-Attacken schützen kannst.
menu:
  sidebar:
    name: Schutz vor Man in the Middle-Attacken
    identifier: schutz-man-in-the-middle
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

## Schutz vor Man-in-the-Middle-Angriffe

In meinem letzten Beitrag - [Man in the Middle Angriffe verstehen](https://secure-bits.org/man-in-the-middle/) - habe ich euch erklärt, was es mit Man-in-the-Middle-Angriffe auf sich und was damit genau gemeint ist. Daher möchte ich euch in diesem Beitrag Tipps und Tricks mit an die Hand geben, die helfen sollen, euch vor solchen Angriffen zu schützen.

Zu den hier vorgestellten Schutzmaßnahmen ist anzumerken, dass diese Maßnahmen nicht komplett von euch im Einzelnen umzusetzen sind, da es hier natürlich auf die von euch genutzte Infrastruktur ankommt. Soll heißen, ob ihr zum Beispiel eine eigene Domäne eurer eigen nennen könnt beziehungsweise, welche Hardware-Komponenten ihr in eurem Netzwerk einsetzt.

Generell kann ich euch nur den Rat geben, dass ihr ein paar Euro in die Hand nimmt und euch so ein paar Komponenten zulegt, um euer Netzwerk nicht nur vor Man-in-the-Middle-Angriffe, sondern auch vor anderer Art von Bedrohungen zu schützen.

Eine Liste mit Komponenten, die ihr euch vielleicht anschaffen solltet, habe ich euch am Ende von diesem Artikel aufgelistet.

Auch wenn es sich bei manchen dieser Links um Affiliate-Links handelt, so dienen diese nicht dazu, mich mithilfe einer Provision durch von euch gekaufter Produkte zu bereichern (für euch ändert sich eh nichts am Verkaufspreis und ihr unterstützt damit diesen Blog), sondern spiegeln diese eine klare Empfehlung meinerseits, als einen zusätzlichen Schutz vor Attacken da.

**Ich empfehle nur das, was ich in gleicher oder aber in ähnlicher Form selbst nutze!**

## Schutz vor Man-in-the-Middle-Angriffe | Schutzmaßnahmen

![Schutz vor Man-in-the-Middle-Angriffe](/images/posts/it-security/Man-in-the-Middle-Angriffe-abwehren.jpg)


### Schutz aktiver Netzwerk-Komponenten (Firewall, Switch, etc.)

#### Zugangskontrolle für Komponenten

- Austausch der Standard Benutzerdaten durch sichere Passwörter
- Physischen Zugang zu Netzwerk-Komponenten erschweren (abschließbarer Raum oder Netzwerkschrank)
- Mechanische Verriegelung von Ports

#### Schutz von Endpoints wie PC, Mobile Device, etc.

- Antivirus-Schutz
- Einrichten einer Gerätesperre für Mobile-Devices
- Richtig konfigurierte Firewall
- Richtig konfigurierte managend-Switch
- Patchmanagement für Endpoints und Server und aktive Netzwerk-Komponenten
- Rechte-Freigaben so viel wie nötig und so wenig wie möglich
- Keine Nutzung von Standard-Passwörter
- Nur wirklich nötige Serverdienste und Dienste im Allgemeinen freigeben oder zur Verfügung stellen
- Nicht genutzte USB-Ports schützen

### Schutz für passive Netzwerk-Komponenten

- Mechanische Verriegelung von Ports
- Zugangskontrolle wo möglich

### Zusätzlich erweiterter Schutz vor Man-in-the-Middle-Attacken

#### Schutz vor Attacken auf Switches

- Austausch von unmanaged Switch gegen managend Switch
- Unterteilung des Netzwerks in einzelne virtuelle Subnetworks (VLANs)
- Einsatz von Dynamic-ARP-Inspection gegen MAC-Flooding und ARP-Poisoing
- Bindung der Ports an spezifische MAC-Adressen
- Abschalten nicht benötigter Switch-Ports

#### Absicherung von Endpoints

- Statische ARP-Eintrag für das Standard-Gateway setzen

#### Firewall-Konfiguration

- Blockieren von Protokoll ICMP-Typ 5 Redirect-Nachrichten
- [DNSSEC einrichten](https://de.wikipedia.org/wiki/Domain_Name_System_Security_Extensions#:~:text=Die%20Domain%20Name%20System%20Security,und%20Integrit%C3%A4t%20der%20Daten%20erweitern.) 

## Schutz vor Man-in-the-Middle-Angriffe | Allgemeine Netzwerk-Schutzmaßnahmen

- Absicherung des Netzwerkverkehrs durch verschlüsselte Verbindungen
- Nutzung von Authentifizierung (Radius-Server, Active-Directory, etc.)
- Zertifikatsfehler nicht einfach ignorieren und bedenkenlos akzeptieren

### Wichtig für interne Netzwerk-Domänen

- Nur öffentliche auflösbaren Top Level Domain-Namen für die interne Domänen nutzen, da sonst keine Zertifikate für interne Domänen ausgestellt werden können, die durch eine öffentliche Zertifizierungsstelle zertifiziert sind und diese somit immer beim Aufruf einer internen https-Domain einen Zertifikatsfehler anzeigen.

## Man-in-the-Middle-Angriffe - Meine Tipps für Sicherheits-Ergänzungen für euer Netzwerk

In dieser Liste (* Affiliate-Links - damit unterstützt ihr diesen Blog), habe ich euch mal eine Aufzählung von Komponenten aufgeführt, die ich selbst im Einsatz habe und somit auch für nützlich erachte.

Natürlich muss das jeder für sich selbst entscheiden und seinen eigenen Erfordernissen entsprechend anpassen! Damit möchte ich mitteilen, dass sicherlich nicht jeder 19" Zoll-Komponenten bei sich im Netzwerk einsetzt oder aber für manche Dinge nicht so viel Geld bereitstellen möchte.

### Tools für einen mechanischer Schutz von Netzwerk-Komponenten und Endgeräten

- [Mechanische Sicherung, um offene RJ45-Ports an Netzwerk-Komponenten vor unbefugtes Anstecken von Netzwerkkabel zu schützen.](https://amzn.to/4lzR1mG)
- [Mechanische Sicherung, um offene USB-Ports vor unbefugte Nutzung zu schützen](https://amzn.to/4kGzVCp)

> **WICHTIG !!!**
> 
> Ein absolutes Muss vor der Nutzung manipulierter USB-Sticks und modifizierter Ladekabel von mobilen Endgeräten zu schützen. Die Nutzung solcher Sticks und Kabel, ist der häufigste Angriffsweg, um Zugriff zu einem Netzwerk zu erhalten!!!

- [Für alle diejenigen, die 19"-Zoll-Komponenten in der Netzwerk-Infrastruktur nutzen oder aber auch so Komponenten abschließbar verstauen möchten und eine saubere aufgeräumte Lösung vorzieht.](https://amzn.to/3GWI4om)

> Persönlich habe ich diesen Netzwerkschrank mit 600mm Tiefe und 16HE im Einsatz und bin damit sehr zufrieden, da der Hersteller auch viel Zubehör hierfür anbietet.

### Schutz der aktiven Netzwerk-Komponenten

#### Managed Switch

- [TP-Link TL-SG2428P 24-Port Gigabit Managed PoE Switch mit 4 SFP-Slots](https://amzn.to/46hwXko)

Bei diesem Switch gibt es im Gegensatz zu Switches von z.B.Ubiquiti, super Konfigurations-Möglichkeiten, um sicherheitsrelevante Einstellung gegen die oben vorgestellten Angriffs-Szenarien zu konfigurieren.
Weiterhin habt ihr auch die Möglichkeit, diesen Switch auch standalone zu betreiben und somit ohne SDN zu nutzen.

**Diesen Switch gibt es auch noch in einer günstigeren Variante ohne POE-Unterstützung.**

- [TP-Link TL-SG3428 24-Port Gigabit L2 Managed Netzwerk LAN Switch mit 4 SFP-Slots](https://amzn.to/3IxMiU1)


#### Meine eingesetzten Access-Points

Sind nicht erforderlich!!! Sondern sollen nur einen Einblick geben, welche Netzwerk-Komponenten ich zur Zeit, nutze, da ich das des Öfteren gefragt werde.

- [TP-Link Access Point EAP683 UR](https://amzn.to/4f2uJYA)

Diese Access-Points habe ich in meinem ganzen Haus sowie im Außenbereich eingesetzt. Als Unifi-Controller läuft bei mir als virtuelle Maschine auf meinen Proxmox-Server.

Klasse finde ich bei diesen Access-Points, dass diese auch im Außenberiech verbaut werden können und so eine günstige Alternative, für die doch meist teureren AC anderer Hersteller sind, die vergleichbare Ausstattung anbieten.

Weiterhin ist der Support mit neuer und aktueller Firmware bisher wirklich super.

Bevor diese Access-Points den Weg zur mir gefunden haben, hatte ich Access-Points der Firma Sophos im Einsatz. Doch waren diese zu einem durch die proprietäre Nutzung (nur verwendbar mit Sophos Firewall-Produkten) ein Dorn im Auge und für meine Einsatzvorgaben (u.a. Einsatz im Außenbereich) einfach zu teuer.c

#### Eingesetzte Hardware-Firewall

Der Einsatz einer Hardware-Firewall ist für mich ein ganz klares "**ja muss sein**".

Für alle die Smart Home, KNX, HomeOffice einsetzen und den Sicherheitsaspekt wirklich ernst nehmen, führt an dieser Komponente kein Weg dran vorbei.

Auch ich sitze in einem "smarten Home", doch ist bei mir alles schön fein netzwerktechnisch getrennt und ich kann Dienste mit Heimweh zu ihrem Hersteller,8iiiiiiiiii ihre Verbindung kappen.

> In meiner beratenen beruflichen Tätigkeit unter anderem für größere Projekte in der Baubranche (Elektrotechnik), habe ich technische Elektro-Installationen mithilfe von KNX gesehen, die sich ungesichert und im gleichen Netzwerk wie die IT-Infrastruktur befunden haben und sich so jeder Angreifer Zugang zur Gebäudesteuerung hätte / hat verschaffen können.
>

Persönlich nutze ich die unten verlinkte Hardware und als Firewall-Distro nutze ich scon seit Jahren **OPNsense**.

- [Protectli Vault V1610 – 6 Ports, Micro Appliance/Mini-PC – Intel N6005, 6X 2.5G NICs, 16 GB LPDDR RAM](https://amzn.to/3IPrirQ)



## Fazit zu Schutz vor Man in the Middle Angriffe

Wie ihr lesen konntet, gibt es eine Menge an Möglichkeiten, sich eine Schutz Man-in-the-Middle-Angriffe aufzubauen.

Mit diesen Tipps und Tricks seid ihr und euer Netzwerk schon gut und nicht nur vor Sniffing und Man-in-the-Middle-Attacken, sondern auch vor anderen Angriffen auf euer Netzwerk geschützt.

Diese Maßnahmenliste ist schon ziemlich ausführlich aber noch nicht das Ende der Fahnenstange, doch würde andere Maßnahmen schon weitreichende Kenntnisse im Bezug zur IT-Netzwerk / Sicherheit erfordern und ich daher bewusst darauf verzichtet habe, da diese Tipps in meinen Augen vollkommen für den Hausgebrauch sowie in den meisten Firmen ausreichend sind.

Wie immer, würde ich mich sehr über Feedback von euch freuen!
