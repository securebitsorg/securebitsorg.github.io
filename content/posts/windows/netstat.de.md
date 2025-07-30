---
title: Netstat unter Windows
date: 2025-07-27T10:17:10.288Z
categories:
  - Netzwerk
  - Tutorials
  - Windows
tags:
  - cmd
  - netzwerk
  - tutorials
  - windows
  - powershell
description: Wie funktioniert Netstat unter Windows? Netstat-Befehle einfach erklärt
menu:
  sidebar:
    name: Netstat unter Windows in der Übersicht
    identifier: netstat-de
    parent: windows
lastmode: 2025-07-27T10:19:50.194Z
keywords:
  - netstat
preview: ../../../assets/images/posts/windows/netstat-help.png
hero: /images/posts/windows/netstat-help.png
---

## Mit netstat TCP Verbindungen, Ports unter Windows anzeigen

In diesem Artikel möchte ich euch den Befehl / Werkzeug **netstat** unter Windows vorstellen und euch zeigen wie ihr mit diesem Befehl aktive TCP-Verbindungen, offene Ports sowie andere Statistiken wie zum Beispiel eine IPv4 Übersicht der Internetprotokolle IP, TCP, ICMP und UDP-Protokolle überprüfen beziehungsweise anzeigen lassen.

### Wozu nutze ich die Netstat-Befehle?

Für die Analyse der Sicherheit eines Betriebssystems ist es natürlich wichtig zu wissen, welche Verbindungen das Betriebssystem beziehungsweise die installierte Software zu Diensten im Internet aufbaut. Des Weiteren kann mit der Anzeige von lauschenden Ports auch schnell Malware erkannt werden. Um nun diese Verbindungen und lauschenden Ports aufzulisten kann der Befehl netstat genutzt werden.

### Was kann ich nun mit dem Befehl Netstat anstellen?

Diese dann gewonnenen Erkenntnisse könnt ihr natürlich auch nutzen, um Verbindungsprobleme zu analysieren die von eurer Firewall, Server-Instanz oder UTM verursacht werden. Denn auch legitime Programme brauchen für verschiedene Dienste eine Verbindung mit dem Internet, werden zum Beispiel aber von eurer Soft- / Hardware-Firewall blockiert.  
Wichtig ist für die Beurteilung über die Sicherheit eines Systems zu wissen, dass die meisten Angriffe auf ein System über die Erstellung einer Reverse Shell durchgeführt werden. Da die meisten Standard-Firewalls nur den Verkehr / Anfragen von außen nach innen überwachen und Verbindungen von innen nach außen grundsätzlich Vertrauen, ist der Angriff über eine Reverse Shell einer der meist genutzten Angriffsszenarien.

### Wie funktioniert netstat?

Um **netstat** nutzen zu können müsst ihr zuerst entweder die Kommandozeile öffnen oder aber eine Powershell Instanz starten.

#### Kommandozeile öffnen:

Die Kommandozeile öffnet ihr, indem ihr unter Windows die `Windows-Taste + s` drückt, in das Suchfeld „**cmd**“ eingibt, **dann mit dem Mauszeiger + Rechtsklick** auf die Auswahl „Eingabeauforderung“ geht und hier mit „**Als Administrator ausführen**“ auswählt.

#### Powershell öffnen:

Um die Powershell-Konsole zu öffnen nutzt ihr auch die Tastenkombination `Windows-Taste + s` und gibt dann „**powershell**“ ein und wählt dann hier auch per Rechtsklick die App „**Powershell als Administrator**" ausführen aus.

## Übersicht der Funktionen von **netstat**

Eine Übersicht der Funktionen und Parameter von **netstat** erhaltet ihr durch die Eingabe in das Konsolenfenster des folgenden Befehls:

```msdos
netstat help
```

![netstat help](/images/posts/windows/netstat-help.png)
netstat help


In der Übersicht seht ihr nun die zu verfügend stehenden Funktionen und Parameter die mit **netstat** kombiniert werden können. Die Parameter können auch miteinander kombiniert werden.

### Aktive Verbindungen anzeigen lassen

Nach dem Öffnen eurer Konsole könnt ihr durch die Eingabe das Befehls,

```msdos
netstat -a
```

alle aktiven Verbindungen eures Rechners anzeigen lassen.


![netstat windows](/images/posts/windows/netstat.png)

netstat windows


Die Tabellenansicht ist hier in vier Spalten aufgeteilt.

#### Protokoll

Die erste Spalte zeigt das verwendete Protokoll der Verbindung an.

#### IP-Adresse lokal

Die zweite Spalte zeigt die lokal verwendete IP-Adresse und den verwendeten Port an, wobei hier die Adresse 127.0.0.1 für lokale Prozesse (auf dem gleichen Rechner) steht, die auf interne Verbindungen lauscht und externe Verbindungen (Internet und andere externe Netzwerke) ausschließt.  
Die IP-Adresse 0.0.0.0 in Verbindung mit einem angezeigten Port lauscht auf alle Anfragen aller Netzwerk-Schnittstellen und akzeptiert diese Verbindungen.

#### IP-Adresse Remote

In der dritten Spalte wird euch wiederum die IP-Adresse und der genutzte Port der Remote-Adresse angezeigt.

#### Status

Zu guter Letzt wird euch in der vierten Spalte der aktuelle Status dieser Verbindung angezeigt. Dieser Status wird in den Zuständen „ABHÖREN, WARTEND, HERGESTELLT und SCHLIESSEN\_WARTEN“ angezeigt.

### Routing-Tabellen anzeigen

Ebenso wichtig ist es, dass Routing von IP-Paketen nachvollziehen zu können.
Mit dem folgenden Befehl ist es möglich, euch die konfigurierte Routing-Tabelle anzeigen zu lassen.

```msdos
netstat -r
```
So habt ihr eine Übersicht, in welche Subnetze IP-Pakete zum Beispiel von eurem Rechner genutzten Subnet, in andere Subnets (z.B. andere Subdomains, Internet-Gateway, etc.) geroutet werden können.

### Netzwerk-Schnittstellen anzeigen

Hier habt ihr die Möglichkeit, die einzelnen vorhandenen Netzwerk-Schnittstellen von eurem Windows-Gerät anzeigen zu lassen und zum Beispiel ob und welche Schnittstelle aktiv ist (Status).


Im Kommandozeilen-Fenster kannst du dann unter der ausgabe "OA3xOriginalProductKey" den hinterlegten 25-stelligen Produkt Key ansehen.


Um das Beschriebene nun anzeigen zu lassen, nutzt ihr diesen Befehl.

```msdos
netstat -i
```

## Übersicht: netstat-Befehle unter Windows
</br>

| Befehl                    | Beschreibung                                                                               |
|---------------------------|--------------------------------------------------------------------------------------------|
| netstat                   | Zeigt alle aktiven TCP-Verbindungen an                                                     |
| netstat -a                | Zeigt alle aktiven TCP-Verbindungen und die TCP/UDP-Ports, auf denen der Rechner lauscht  |
| netstat -n                | Gibt Verbindungen mit numerischen IP-Adressen und Ports aus, ohne Namensauflösung         |
| netstat -o                | Zeigt aktive TCP-Verbindungen inkl. Prozess-ID (PID)                                      |
| netstat -e                | Zeigt Ethernet-Statistiken wie Bytes und Pakete gesendet/empfangen                        |
| netstat -s                | Zeigt Statistiken je Protokoll (z.B. TCP, UDP, ICMP, IP)                                  |
| netstat -p <Protokoll>    | Zeigt Verbindungen für das angegebene Protokoll (z.B. TCP, UDP, ICMP)                     |
| netstat -r                | Zeigt die Routing-Tabelle an (ähnlich wie „route print“)                                  |
| netstat -b                | Zeigt die ausgehenden/incoming Verbindungen und zugehörige Programme/Dateipfade           |
| netstat -f                | Zeigt vollständige Domänennamen für Fremdadressen                                         |

Im Kommandozeilen-Fenster kannst du dann unter der ausgabe "OA3xOriginalProductKey" den hinterlegten 25-stelligen Produkt Key ansehen.


| netstat -x                | Zeigt NetworkDirect-Verbindungen (Windows-spezifisch)                                     |
| netstat -q                | Zeigt abhörende und nicht abhörende Ports                                                 |
| netstat -t                | Zeigt den Offload-Status der aktuellen Verbindungen                                       |
| netstat -y                | Zeigt Verbindungs-Template-Informationen                                                  |
| netstat /?                | Zeigt alle verfügbaren Parameter und eine Hilfeübersicht                                   |
| netstat [Intervall]       | Wiederholt die Anzeige im angegebenen Sekundenintervall (z.B. netstat -n 5)               |
</br>


> - Viele Parameter können **kombiniert** werden, z.B. `netstat -ano` zeigt alle Verbindungen mit PID und ohne Namensauflösung.
> 
> - Einige Optionen sind spezifisch für bestimmte Protokolle oder Netzwerkumgebungen; für Details empfiehlt sich die Hilfeseite (`netstat /?`).

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Fragen und Antworten
>
> Wenn Sie Fragen oder Feedback zu diesem Blog oder YouTube-Kanal haben, nutzen Sie bitte meine Hilfeseite. Dort finden Sie Fragen und Antworten zu den verschiedenen Beiträgen. Sie können dort auch gerne Ihre eigene Frage stellen.
>
> [**Zur Hilfeseite**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->