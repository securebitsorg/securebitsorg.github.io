---
title: Man in the Middle Angriffe verstehen
description: Man in the Middle Angriff - Definition | Oft wird diese Angriffstaktik in der Presse und auf anderen Publikationen erwähnt. Doch was genau das ist und wie dieser funktioniert?
hero: /images/posts/it-security/Man-in-the-Middle-Angriffe-abwehren.jpg
date: 2021-01-25
menu:
  sidebar:
    name: Man in the Middle-Attacken richtig verstehen
    identifier: man-in-the-middle
    parent: security
categories: 
  - Netzwerk
  - Security
tags: 
  - firewall
  - netzwerk
  - security

---

## Man in the Middle Angriff - Definition

In dem heutigen Beitrag geht es um das Thema eines **Man in the Middle Angriffs**. Oft wird diese Angriffstaktik in der Presse und auf anderen Publikationen erwähnt. Doch was genau das ist und wie dieser funktioniert, möchte ich euch gerne in diesem Artikel näher erläutern.

> Sollte etwas nicht verständlich sein oder ihr habt weitere Fragen zu diesem Thema, so kontaktiert mich über das [Kontaktformular](mailto:ticket@secure-bits.org).


![Man in the Middle Sniffing](/images/posts/it-security/ManintheMiddle-Sniffing.png)    

### Was ist ein Man in the Middle Angriff?

Als Man in the Middle Angriff bezeichnet man ein Szenario, bei dem ein Kommunikationspfad (siehe oberes Bild) zwischen zwei Kommunikationspartnern durch einen Dritten abgehört beziehungsweise, der Datenstrom über den Angriffsrechner des Dritten umgeleitet wird.  

Dieses Szenario kann an verschiedenen Punkten im Netzwerk des Kommunikationspfad durchgeführt werden. Bei den Netzwerk-Punkten kann es sich zum Beispiel um kompromittierte Netzwerk- oder Nutzergeräte handeln.  

Berühmte Vertreter solcher Angriffe sind zum Beispiel der sogenannte Bundestrojaner, der wieder in aller Munde ist durch die Debatte des Aufhebelns der Verschlüsselung der verschlüsselten Messenger-Dienste, sowie das Abhören der Knotenpunkte der Internet-Serviceprovider durch die Freunde der [National Security Agency – Wikipedia](https://de.wikipedia.org/wiki/National_Security_Agency), die durch die Snowden-Leaks der breiten Masse bekannt wurden.

### Wie funktioniert ein Man in the Middle Angriff?

  
  
Grundlegend gibt es zwei Arten von Angriffsszenarien. Bei diesen Szenarien werden die Angriffe auf zwei Methoden unterteilt.  

- **Methode 1 bezeichnet das Mithören / Mitschneiden des Kommunikationspfad**

- **Methode 2 bezeichnet man das Umleiten eines Kommunikationspfad auf zum Beispiel den Rechner eines Angreifers.**

### Methode 1 – Abhören / Mitschneiden einer Kommunikationspfad (Sniffing)


![Man in the Middle Umleitung](/images/posts/it-security/ManintheMiddle-Umleitung)    

Bei dem sogenannten Sniffing wird per Netzwerk-Sniffer oder Mirror-Port die Kommunikation auf dem Kommunikationspfad zweier Kommunikationspartner mitgeschnitten beziehungsweise abgehört.

Durch Nutzung eines Software-Tools wie zum Beispiel „**[Wireshark](https://www.wireshark.org/)**“ (gibt hier auch noch unzählige andere Software-Tools), kann so der Datenstrom des Kommunikationspfads kompromittiert werden. Hierzu muss der Angreifer einen Netzwerk-Punkt (Endgerät, Netzwerkgerät oder Server) in der Kommunikationsstrecke durch den Einsatz des Sniffing-Tools kompromittieren. Des Weiteren kann auch der **Einsatz eines Mirror-Ports** auf dem Switch durchgeführt werden, mit dessen Hilfe, der Port und somit die Datenpakete des angeschlossen zu kompromittierenden Rechners zu dem Rechner des Angreifers gespiegelt werden.

Durch das Abhören können so genutzte Ports, IP-Adressen, Protokolle und Kommunikationsformen genaustens analysiert werden und daher wird diese Methode sehr häufig zum Auskundschaften sowie Vorbereiten eines Angriffs genutzt.

Art der Angriffe sind hier unter anderem Passwortattacken, feststellen unerlaubte Kommunikation zweier Kommunikationspartner, Art der genutzten Applikationen auf den Kommunikation-Devices / Formen für spätere Angriffe durch Sicherheitslücken sowie die Abschöpfung von Zugangsdaten.

Vorteil dieser passiven Abhörmethode ist es, dass diese schwer zu entdecken ist und dadurch schlecht abgewehrt werden kann.

### Methode 2 – Umleiten der Datenpakete / klassische Man in the Middle Attacke

Bei dieser Methode nutzt der Angreifer verschiedene Methoden der Umleitung, um den Datentransfer nicht über den vorgesehenen Kommunikationspfad zu senden, sondern die Datenpakete umzuleiten.

Hierbei gibt sich der Angriffspunkt des Hackers (z.B. Proxy-Server), bei einer Kommunikation zweier Endpunkte, als der jeweilige andere Kommunikationspartner aus und kann so die Verbindung kompromittieren.

Wie schon erwähnt, kommen hierfür mehrere Verfahren in Betracht. Die hier gebräuchlichsten Verfahren sind die folgenden.

Zum einen die Umleitung von Nutzer-Device auf das Angreifer-Device sowie die Weiterleitung zum anderen Endpunkt des Kommunikationspfads (Webserver, Endgerät, etc.) und zum anderen, die Umleitung nicht über das vorgesehene Standard-Gateway des Netzwerks, sondern über einen Proxy-Server oder per Redirection zum anderen Kommunikationspartner geleitet wird (siehe untere Bilder 1 und 2).


![Man in the Middle Proxy](/images/posts/it-security/ManintheMiddle-Umleitung-proxy.png)

Nachteil dieser aktiven Methode ist unter anderem, dass diese Angriffsmethode leichter zu entdecken ist, da hier aktiv in die Kommunikation des Kommunikationspfad eingegriffen wird.

Im Gegensatz zum Sniffing, können hierbei nicht nur Datenpakete beziehungsweise die Kommunikation von Teilnehmern abgehöhrt / gesammelt werden, sondern kann die Kommunikation abgefangen / verändert werden, so dass der andere Teilnehmer nichts davon mitbekommt. Somit sind hier auch die Probleme vielfältiger und können massiven Schaden verursachen.

**Als Beispiel sind hier zu nennen:**

- Diebstahl von Zugangsdaten
- Abfangen von Token wie zum Beispiel TAN für das Onlinebanking
- Austausch von Informationen, um zum Beispiel Bank-Überweisungen auf eine andere Bankverbindung zu leiten
- Entwenden von Kreditkartendaten
- Und noch viele andere Szenarien

## Fazit zu Man in the Middle Angriffe

Dieser Beitrag ist nur ein erster Einblick über die Funktionsweise einer Man in the Middle Attacke, da dieses Thema doch sehr umfassend ist.

Dieses Thema werde ich in zukünftigen Beiträgen weiter vertiefen und euch so einen noch tieferen Einblick in dieses Thema ermöglichen.

Eines möchte ich aber vorab schon einmal loswerden – Bitte achtet in Zukunft bei eurer Kommunikation darauf, dass diese bei euch nur in einer verschlüsselten Weise stattfindet. Diese Verschlüsselung sollte nicht nur bei der Kommunikation im Internet via Protokoll 443 oder 8443 (https://) gelten, sondern auch bei anderen Arten der Kommunikation.

Hier sind als Beispiel zu nennen Messenger (Signal, Matrix, Threema), Dateiaustausch via sftp oder ssh, Nutzung von verschlüsselten VPN-Verbindungen und so weiter…

Da ja dank der Covid-Pandemie die Debatte über die Grundrechte ein großes Gehör findet, sollten auch alle ihr Recht auf „digitale Selbstbestimmung“ wahrnehmen und mal über ihren Umgang mit den digitalen Medien überdenken beziehungsweise anpassen.

## Schutz vor Man-in-the-Middle-Angriffe

Wie ihr euch und euer Netzwerk vor solchen Attacken schützen könnt, erfahrt ihr im nächsten Artikel.
