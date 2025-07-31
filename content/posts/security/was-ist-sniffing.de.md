---
title: Netzwerk Sniffing – Sichere Kommunikation im Netzwerk
date: 2018-08-26
categories:
  - Netzwerk
  - Security
  - Tutorials
tags:
  - netzwerk
  - security
  - tutorials
description: In diesem Beitrag beschreibe ich, was Netzwerk-Sniffing ist und wie man sich davor schützen kann.
preview: ../../../assets/images/posts/it-security/yarn-phone-2091195_640.png
hero: /images/posts/it-security/yarn-phone-2091195_640.png
menu:
  sidebar:
    name: Was ist Netzwek-Sniffing?
    identifier: sniffing
    parent: security
lastmode: 2025-07-28T12:24:15.525Z
keywords:
  - network sniffing
---

## Wie kannst du dich vor Netzwerk Sniffing im Netzwerk schützen?!

Die meisten von euch haben sicherlich schon irgendwo gelesen oder gehört, dass alle Welt über sichere Kommunikation debattiert. Doch was ist eine sichere Kommunikation und warum können normale Kommunikationswege abgehört (sniffing) werden?! Daher möchte ich mich in diesem Beitrag mit dem Thema „Sniffing / Abhören“ beschäftigen und euch auch zeigen, wie ihr euch gegen solche Sniffing-Angriffe absichern könnt.

Nach den Enthüllungen von Edward Snowden ist das Abhören von Kommunikationswegen sicherlich jeden von euch geläufig. Abhören beziehungsweise sniffen kann man in kleinen wie in großen Dimensionen. Geheimdienste nutzen zur Abhörung gleich ganze Knotenpunkte von unseren ISP (Internet Service Provider) und im kleineren Maßstab funktioniert das natürlich auch bei euch in der Firma oder Daheim.

Um einen Kommunikationsweg zu kompromittieren gibt es natürlich mehrere Maßnahmen. In diesen Beitrag möchte ich aber auf das sogenannte „Sniffen“ eingehen.

## Was ist Sniffing?

Als Sniffing wird das Abhören oder Mitschneiden von Datenpaketen in einer Kommunikationsverbindung bezeichnet. Hierbei werden zum Beispiel die Clients von einer der beiden Gesprächspartner mit einer Malware die ein Sniffing-Tool enthält kompromittiert und dann die versendeten sowie verschickten Datenpakete mitgeschnitten.

Diese Datenpakete können, wenn diese unverschlüsselt übertragen werden, natürlich auch Passwörter enthalten, die dann im Klartext übertragen werden und somit dann für den Angreifer lesbar sowie verwendbar sind.


> **Bitte beachten!** Alle hier gezeigten Maßnahmen bieten keine absoluten 100 % Schutz vor Angriffen!

## Welche Maßnahmen helfen gegen Netzwerk Sniffing?

### Netzwerkkomponenten

Zunächst ist es wichtig ein Netzwerk in seine Bestandteile (Netzwerkkomponenten) zu unterteilen um für diese Netzwerkkomponenten geeignete Schutzmaßnahmen vorzunehmen.

Die Netzwerkkomponenten werden in zwei Gruppen unterteilt:

- **Aktive Netzwerkkomponenten**
- **Passive Netzwerkkomponenten**

## Was sind aktive Netzwerkkomponenten?

Als **aktive Netzwerkkomponenten** zählen solche Geräte, die aktiv Signale verarbeiten sowie diese verstärken und eine Spannungsversorgung hierfür benötigen.  
**Zu den aktiven Netzwerkkomponenten zählen:** 

- [**Firewalls**](https://secure-bits.org/die-funktionsweise-einer-firewall/)
- **Switches**
- **Hub´s**
- **Router**
- **Access Points**
- **Netzwerkkarte**
- **ISDN-Karte**
- **usw.**

## Was sind passive Netzwerkkomponenten?

Als passive Netzwerkkomponenten zählen Bauteile im Netzwerk die ohne Spannungsversorgung auskommen.

**Zu den passiven Netzwerkkomponenten zählen:**

- **Netzwerkverkabelung**
- **Patchkabel**
- **Netzwerkanschlussdosen**
- **usw.**

## Maßnahmen zur Absicherung aktiver Netzwerkkomponenten vor Netzwerk Sniffing Angriffe

#### Zugangskontrolle

Um aktive Netzwerkkomponenten zu schützen, sollte der Zugriff auf die Administrationsoberfläche (SSH oder Webbrowser) sicher geschützt werden, nicht genutzte Ports sollten bei managend Switches abgeschaltet werden. Zum Beispiel unbenutzte Ports an einem Switch durch Fremdeinwirkung vor unbefugten Zugriffen zu schützen.

### Überwachung der Endpunkte im Netzwerk (Client und Server)

Hohe Priorität für den Schutz gegen Sniffing ist vor allem, dass die Endpunkte im Netzwerk durch geeignete Überwachungs-Tools (Schutz gegen Malware durch Antiviren-Software, IPS, etc.) geschützt werden. Gerade auf den Endpunkten ist das mitlesen des Netzwerk-Traffic´s durch Sniffing-Tools am gefährlichsten, da hier auf den Endpunkten einer Daten-Verbindung die Verschlüsselung durch zum Beispiel des Protokolls „https - Hypertext Transfer **Protocol** Secure“ leicht aufzuhebeln ist (End-to-End – Verschlüsselung).

Weiterhin kann man es nicht genug betonen, dass ein zeitnahes einspielen von Sicherheitspatches für das genutzte Betriebssystem sowie für genutzte Software unabdingbar ist und auch wirklich gewissenhaft durchgeführt werden sollte. Für Angreifer ist es ein leichtes die Kontrolle durch den Einsatz von Exploits und andere Scripte über ein mit Sicherheitslücken durchspicktes System zu übernehmen! Daher möchte ich es unbedingt hervorheben:

**Bitte beachten!** Bitte spielt immer herausgegebene Sicherheitsupdates für euer Betriebssystem und eurer genutzten Software ein! Diese Vorgehensweise kann man nicht genug zitieren! 

Des Weiteren solltet ihr nicht mit administrativen Privilegien arbeiten, sondern für die tägliche Arbeit am eurem PC eingeschränkte Nutzerrechte vergeben. Dieses könnt ihr zum Beispiel unter Windows durch das nutzen eines Standardbenutzer-Konto gewährleisten. Somit ist die Gefahr des versehentlichen installieren von schadhaften Programmen minimiert.

## Netzwerk Sniffing - Verschlüsselung der Kommunikation

Eine wirklich wichtige und absolut empfehlenswerte Sicherheitsmaßnahme ist, wenn irgendwie möglich, die Nutzung von verschlüsselten Verbindungen. Diese verschlüsselten Verbindungen wie zum Beispiel **„https“**, **„sftp“**, **„SSH“** sowie die Nutzung von VPN-Verbindungen in öffentlichen WLAN-Netzwerken, schützen dich vor Angriffen durch das **Sniffing** und genauso vor **Man-in-the-Middle-Angriffe**. Hierbei ist aber zu erwähnen das die Sicherheit nur bei End-to-End-Verschlüsselung gewährleistet ist, also von zum Beispiel Computer zu Computer oder Computer zu Server.

Der Schutz durch End-to-End-Verschlüsselung sollte genauso bei Messengern genutzt werden, damit auch hier kein abhören durch Dritte möglich ist. Die Messenger von **Signal**, **Wire** und **Threema** (**Telegram** verschlüsselt nur bedingt „sicheren Chats“) nutzten den Verbindungsschutz End-to-End-Verschlüsselung, daher sind diese Messenger für eine sichere Kommunikation, den Konkurrenten wie **WhatsApp** oder ähnlichen als Standard-Messenger-App ganz klar den Vorzug zu geben!

Des Weiteren solltet ihr bei der Auswahl von WLAN-Netzwerken auch auf einen sicheren Verschlüsselung-Standard achten. 

## Maßnahmen zur Absicherung passiver Netzwerkkomponenten vor Netzwerk Sniffing Angriffe

Um passive Netzwerkkomponenten abzusichern, solltet ihr zum Beispiel in Unternehmen einen Zugangsschutz zum Serverraum sicherstellen, damit dieser Raum nur durch autorisiertes Personal betreten wird. Auch Netzwerkverteiler-Schränke in anderen Gebäudeteilen sollten abschließbar und vor unbefugten Zugriff abgesichert werden.

Nicht genutzte Netzwerkanschlüsse können durch mechanische Sperren gesichert werden, sogenannte Port-Schlösser (z.B. [diese hier von der Firma Lindy](https://amzn.to/2wr1YQ9)).

Generell empfiehlt es sich bei Netzwerken in Unternehmen, nur sogenannte managend Switches für die Verteilung von Datenpakete zu verwenden, da hier durch das abschalten nicht genutzter Netzwerk-Ports, ein Zugriff durch nicht autorisierte Zugriffe durch Dritte aktiv unterbunden werden kann. 

## Fazit - Netzwerk Sniffing Angriffe

Wenn ihr die Sicherheitstipps, die ich euch in diesem Beitrag aufgeführt habe befolgt und umsetzt, sollte hierdurch die Gefahr des Ausspähens und Mithören / Mitlesen eurer Datenverbindungen minimiert werden. 

Die größte Gefahr in einem IT-Netzwerk ist und bleibt aber der Nutzer selbst. Durch unachtsames Handeln entstehen die meisten Angriffe auf ein Computernetzwerk. Diese Gefahr lässt sich nur durch Aufklärung der Nutzer minimieren und sollte einen großen Stellenwert beim ausschließen von Gefahrenquellen in der Infrastruktur eures Computernetzwerk haben. Ein gutes Beispiel ist hier der berühmte herrenlose USB-Stick der mal eben schnell in den Computer gesteckt wird. Sensibilisierung für dieses Thema ist das erste Gebot in einer sicheren IT-Umgebung.  

Eines sollte hier aber bitte klar sein, einen absoluten Schutz gibt es natürlich nicht!

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->


