---
title: AdGuard Home DNS-Verschlüsselung
description: AdGuard Home DNS-Verschlüsselung | In diesem Video zeige ich euch, wie ihr DNS over Quic einrichtet.
hero: /images/posts/adguard/Video-AdGuard-Raspberry-Pi-Installation.png
date: 2022-12-27
menu:
  sidebar:
    name: AdGuard DNS-Verschluesslung mit DNS over QUIC
    identifier: adguard-dns-over-quic
    parent: adguard
categories: 
  - "linux"
  - "netzwerk"
  - "security"
  - "tutorials"
  - "video"
tags: 
  - "adguard"
  - "netzwerk"
  - "security"
  - "tutorials"
  - "video"
---

## AdGuard Home DNS-Verschlüsselung mit DNS over QUIC

In diesem Video-Tutorial auf [**meinem YouTube-Kanal**](https://www.youtube.com/channel/UCr-cuwB555JmAm4F412KZ2Q) zeige ich euchSchritt für Schritt, wie ihr mithilfe von dem "neuen" Verschlüsselungs-Protokoll '**DNS over QUIC**', externe DNS-Anfragen von AdGuard Home verschlüsseln könnt.

### AdGuard Home DNS-Verschlüsselung - Video

{{< youtube mog1eFUUc3Y >}}

### AdGuard Home installieren

Wer von euch wissen möchte, wie AdGuard Home zum Beispiel auf einem Raspberry Pi installiert wird, der kann sich diese [**Anleitung**](https://secure-bits.org/adguard-raspberry-pi-installation-2022/) oder dieses [**Video**](https://youtu.be/PF2WH2llwSg) dazu anschauen.

## Öffentlche rekrusive DNS-Server die DNS over QUIC unterstützen

Hier findet ihr einige mir bekannte öffentliche rekrusive DNS-Server die das DNS over QUIC-Protokoll unterstützen. Diese könnt ihr zur AdGuard Home DNS-Verschlüsselung nutzen.

#### Öffentliche DNS-Server von AdGuard

- Ungefilterte DNS-Anfragen kostenlos

```sh
quic://unfiltered.adguard-dns.com
```

##### DNS-Server mit anpassbarer Filterung bis 300.000 Zugriffe kostenlos

Möchtet ihr stattdessen eurer Anfragen per DNS-Filter vor Werbung, Tracking und Malware schützen, dann könnt ihr bei AdGuard DNS auf einfache Art, einen eigenen DNS-Server für eure Anfragen konfigurieren.

Hier könnt ihr dann Blocklisten wählen, Dienste sperren, bei Bedarf eine "Kinderscherung" aktivieren und einige andere Einstellungen vornehmen.

Die Filterung der DNS-Anfragen durch euren erstellten Filter sind bis 300.000 Anfragen / monatlich für euch kostenlos. Nach erreichen der Anfragegrenze funktioniert der DNS-Server weiterhin, nur der eingestellte Filter ist nicht mehr aktiv. Wer dann weiterhin von euch den Filter nutzen möchte, kann dann eine Lizenz für 19,99 € / jährlich erwerben und hat dann 10.000.000 Anfragen im Monat frei.

Nutzer mit einem Abo von AdGuard VPN haben den DNS-Server inklusive 10.000.000 DNS-Anfragen in Ihrem Abo mit enthalten.

[https://adguard-dns.io/de/welcome.html](https://adguard-dns.io/?aid=33604)

#### Öffentlicher DNS-Server von NextDNS

[https://nextdns.io](https://nextdns.io/?from=rgjtxk2k)

DNS-Filter können wie bei AdGuard DNS nach Gerät umfangreich frei konfiguriert werden.

Bei NextDNS könnt ihr kostenlos und ohne Registrieung für 7 Tage Testen, danach entscheidet ihr euch entweder für ein Abo für 1.99 € / Monat // 19,90 € / Jahr oder ihr habt 300.000 Anfragen pro Monat frei.

- Kostenloser DNS-Server (bis 300.000 Anfragen)

- Kostenlose Zugang für 7 Tage, danach weitere DNS-Server-Nutzung ohne Filterung und Schutz

- Abo mit unbegrenzten DNS-Anfragen für 19,90 € / jährlich

#### Öffentlicher DNS-Server von dnsforge

Deutscher privater öffentlicher DNS-Server von adminforge. Dieser Dienst wird spendenbasiert finanziert und sollte auch [**durch eine Spende**](https://adminforge.de/unterstuetzen/) unterstützt werden.

##### DNS-Server mit Werbe- / Trackingschutz und Schutz vor Malware-Domains

```sh
quic://dnsforge.de:853
```

##### DNS-Server mit zusätzlichem Jugendschutz-Filter

```sh
quic://clean.dnsforge.de:853
```

#### DNS-Server von BlahDNS

Kostenloser auf [**Spenden**](https://blahdns.com/#donate) basierender öffentlicher rekrusiver DNS-Server.

- Bietet Schutz vor Werbe-Tracking, Malware und CNAME-Cloaking

Bitte bei BlahDNS in den AdGuard Home Verschlüsslungseinstellungen den **Standard-Port von 853 auf 784 ändern**.

##### BlahDNS DNS-Server in Deutschland

```bash
quic://dot-de.blahdns.com:784
```
