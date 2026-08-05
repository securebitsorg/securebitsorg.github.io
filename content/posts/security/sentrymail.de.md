---
title: "Phishing-Simulation selbst hosten: SentryMail (Open Source)"
slug: phishing-simulation-sentrymail
date: 2026-08-05
lastmod: 2026-08-05
categories:
  - Security
  - Awareness
  - Tutorials
tags:
  - security
  - phishing
  - awareness
  - sentrymail
  - docker
  - nis2
description: Phishing-Simulationen selbst hosten – mit SentryMail Kampagnen planen, Klicks pro Empfänger auswerten und Security-Awareness messbar machen. Open Source.
preview: ../../../assets/images/posts/it-security/sentrymail-control-center.webp
hero: /images/posts/it-security/sentrymail-control-center.webp
images:
  - /images/posts/it-security/sentrymail-control-center.webp
menu:
  sidebar:
    name: Phishing-Simulation mit SentryMail
    identifier: sentrymail
    parent: security
keywords:
  - phishing-simulation
  - phishing simulation open source
  - security awareness schulung
  - phishing test mitarbeiter
  - sentrymail
  - self-hosted phishing
  - nis2 awareness
---

## Phishing-Simulation: Warum die verwundbarste Stelle vor dem Bildschirm sitzt

Eine **Phishing-Simulation** ist der einzige zuverlässige Weg, um herauszufinden, wie anfällig eure Organisation wirklich für Social Engineering ist. Denn eine [Firewall lässt sich härten](/posts/security/wie-funktioniert-eine-firewall/), Systeme lassen sich patchen und Passwörter erzwingen – aber die meisten erfolgreichen Angriffe brechen keine Technik, sie überzeugen einen Menschen. Eine gut gemachte Phishing-Mail braucht keine Zero-Day-Lücke, sie braucht nur einen Klick unter Zeitdruck.

Genau deshalb ist **Security-Awareness** kein Nice-to-have mehr, sondern ein fester Bestandteil jedes Sicherheitskonzepts – ähnlich selbstverständlich wie der Schutz vor [Man-in-the-Middle-Angriffen](/posts/security/man-in-the-middle/) oder [Netzwerk-Sniffing](/posts/security/was-ist-sniffing/). Und Awareness funktioniert am besten, wenn sie **messbar** ist: Wer klickt worauf? Wo gibt jemand Daten ein? Welche Abteilung braucht eine Schulung – und welche nicht?

Für genau diese Aufgabe möchte ich euch in diesem Beitrag **SentryMail** vorstellen: eine selbstgehostete Open-Source-Plattform, mit der ihr simulierte Phishing-Kampagnen planen, versenden und pro Empfänger auswerten könnt – ohne dass eure Mitarbeiterdaten das Haus verlassen.

<!-- FM:Snippet:Start data:{"id":"Vertical Space","fields":[]} -->
{{< vs 3>}}
<!-- FM:Snippet:End -->

![SentryMail Control-Center: Dashboard einer Phishing-Simulation mit Risiko-Score, Trichter und Zeitachse der Öffnungen und Klicks](/images/posts/it-security/sentrymail-control-center.webp)

## Was ist SentryMail?

SentryMail hilft Organisationen dabei, ihre **menschliche Angriffsfläche** zu verkleinern. Ihr führt realistische Phishing-Simulationen durch, verfolgt Öffnungen, Klicks und Formular-Eingaben nach und leitet daraus gezielte Sensibilisierung ab.

Der entscheidende Punkt: Die Plattform läuft **vollständig bei euch**. Kein Cloud-Dienst, bei dem die Namen und das Klickverhalten eurer Mitarbeitenden auf fremden Servern landen. Alle umgebungsspezifischen Werte – Domain, Identity-Provider, SMTP – kommen aus der Konfiguration, nichts ist im Code fest verdrahtet.

<!-- FM:Snippet:Start data:{"id":"Warning","fields":[]} -->
{{< alert type="warning" >}}
**Wichtig – nur mit Autorisierung einsetzen**

Phishing-Simulationen sind ein Werkzeug für **autorisierte** Awareness-Schulungen in der eigenen Organisation. Klärt vorab die rechtliche Seite: Betriebsrat/Personalrat einbeziehen, Datenschutz prüfen und die Geschäftsführung ins Boot holen.

SentryMail liefert dafür im Ordner `compliance/` eine **Muster-Betriebsvereinbarung** und eine **Datenschutz-Kurzdarstellung** (jeweils DE und EN) mit – als Teil des Open-Core, nicht als kostenpflichtiges Zusatzpaket.
{{< /alert >}}
<!-- FM:Snippet:End -->

## Funktionsumfang des kostenlosen Core

Der komplette Kampagnen-Zyklus steckt bereits im quelloffenen Core – vom Erstellen der Vorlage bis zum revisionssicheren Nachweis. Nichts davon ist an eine Lizenz gebunden.

### Vorlagen

- **HTML- oder Markdown-Editor** mit Live-Vorschau
- Personalisierungsvariablen in Betreff, HTML und Text
- Vorschau mit Beispieldaten
- Manuelle Anhänge zum Versand

### Empfängergruppen

- Wiederverwendbare Listen mit **Position, Abteilung und Kritikalität**
- Befüllung durch manuelle Eingabe oder **CSV**
- Kennzeichnung von **Leitungsorganen (§ 38 BSIG)**

### Sending Profiles

- SMTP-Profile mit Absender-Identität und Test-Mail
- **Anbieterunabhängig** (IONOS, Hetzner, Mailgun, SES, Postmark und andere)
- Globales Fallback-SMTP ohne eigenes Profil

### Zustellung

Der Punkt, an dem die meisten Phishing-Simulationen scheitern – die Mail kommt gar nicht erst an:

- **Allowlisting-Generator** für Exchange Online, Postfix, Proofpoint, Sophos und Barracuda
- **Zustell-Selbsttest** über exakt den Weg, den auch die Kampagne nimmt
- Zustelldiagnose mit **SMTP-Statuscodes je Empfänger**
- Greylisting-Erkennung ab drei vorübergehenden Ablehnungen
- **SPF-, DMARC- und Mehrfacheintrag-Prüfung**
- Ausdrücklich eine Zustell-, keine Personenauswertung

### Landing Pages

- Ziel-Seiten als HTML oder Markdown
- Daten-Capture, Passworterfassung und Weiterleitung
- Formulare werden automatisch auf die Tracking-URL umgeleitet

### Kampagnen

- Assistent aus Vorlage, Sending Profile, Landing Page und Gruppen
- Optionale Zeitplanung
- Erneuter Lauf für unvollständig zugestellte Kampagnen

### Kampagnen-Preflight

Ein Sicherheitsnetz, das es in dieser Form selten gibt:

- **Pflichtdialog vor jedem Start** mit Empfängerzahl, Zeitpunkt und Befunden
- **Ruhezeiten, Sperrfenster und Cooldown je Person** (Standard: 30 Tage)
- Zeitzone je Instanz als IANA-Name (Standard UTC)
- Risikoklasse des Köder-Themas, direkt an der Vorlage gepflegt
- **Vier-Augen-Freigabe bei hoher Risikoklasse** – in der Datenbank erzwungen, nicht nur im UI
- Gruppenausschlüsse im Dialog, wirksam zum Sendezeitpunkt

### Tracking und Ergebnisse

- Tracking-Token **je Empfänger** in Links und Pixel
- Versand, Öffnung, Klick und Formulardaten mit Zeitpunkt
- Ergebnisseite je Kampagne mit **CSV-Export**
- **Control-Center-Dashboard** mit Risiko-Score (0–100, Ampel)
- **Human Risk Management** über alle Kampagnen hinweg
- Management Report mit Kampagnenvergleich

### Benutzer und Rollen

- Rollen: **Administrator, Datenschutzbeauftragter, Benutzer**
- Lokaler Login und optional **OIDC/SSO** (Authentik, Keycloak, Entra ID, Okta)
- **Zwei-Faktor-Authentifizierung** per App oder E-Mail-Code, plus Backup-Codes
- 2FA erzwingbar für alle oder nur für Administratoren
- Audit-Log über Anmeldungen und Systemänderungen

### Nachweiskette

- **Hash-Verkettung jedes Audit-Eintrags** (SHA-256, lückenlose Position)
- Kettenzustand im Dashboard – ein Bruch wird mit seiner Position benannt
- **Nachweispaket als ZIP** mit Manifest und zweisprachiger Prüfanleitung
- **Eigenständiges Prüfwerkzeug** – eine einzige Datei, nur Standardbibliothek
- Eigene Aufbewahrungsfrist für Audit-Inhalte, Verkettung bleibt als Tombstone erhalten
- Zugriff für Administratoren und Datenschutzbeauftragte

### Datenschutz und Mitbestimmung

Genau der Teil, der eine Phishing-Simulation in Deutschland überhaupt erst durch die Mitbestimmung bringt:

- **Datenschutzmodus** sperrt Auswertungen auf Einzelpersonen-Ebene
- **k-Anonymität für Gruppenauswertungen** (Standard: 5)
- Vier-Augen-Freigabe zur befristeten Aufhebung
- Aufbewahrungsfrist mit automatischer Anonymisierung
- **Client-Fingerprinting nur nach ausdrücklicher Freigabe**
- Vorlagen für Betriebsvereinbarung und Datenschutzhinweis

### Betrieb

- **Docker Compose** (rootless, gehärtet) mit Caddy und automatischem TLS
- PostgreSQL und Redis – alle Daten bleiben in der eigenen Installation
- Deutsch und Englisch, Light- und Dark-Mode

## Der Tech-Stack

| Schicht | Technologie |
|---|---|
| Backend | FastAPI · SQLAlchemy · Alembic |
| Frontend | React · Vite · TypeScript · Tailwind CSS |
| Datenbank / Cache | PostgreSQL · Redis |
| Proxy / TLS | Caddy |
| Betrieb | Docker Compose (rootless, gehärtet) |

Caddy leitet dabei `/api/*` und die öffentlichen Tracking-Endpunkte `/track/*` an das Backend, alles Übrige an das Frontend.

## Systemanforderungen

SentryMail läuft als Docker-Compose-Stack auf einem einzelnen Host. Die Werte sind Richtwerte – der Bedarf steigt mit der Empfängerzahl, paralleler Nutzung und optionalen Zusatzfunktionen wie PDF-Reports oder KI.

| Ressource | Minimum | Empfohlen |
|---|---|---|
| CPU | 2 vCPU | 2–4 vCPU |
| RAM | 2 GB | 4 GB |
| Datenträger | 15 GB SSD | 20–40 GB SSD |
| OS | Linux (x86-64 oder ARM64) mit Docker Engine (≥ 24) + Docker Compose v2 | dito |

Ein paar Anmerkungen dazu:

- **Docker Compose v2** meint das integrierte `docker compose`-Plugin, nicht das eingestellte alte `docker-compose` v1. Prüfen könnt ihr das mit `docker compose version`.
- Das **Minimum** genügt für kleinere Organisationen bis einige Hundert Empfänger und gelegentliche Kampagnen.
- **SSD** wird für die Datenbank empfohlen – die Tracking-Ereignisse wachsen mit jeder Kampagne.
- Beim Netzwerk braucht ihr ausgehenden SMTP-Zugang für den Versand und Erreichbarkeit der `APP_DOMAIN` für die Zielpersonen, sonst funktioniert das Tracking nicht.

## Installation

### Geführt (empfohlen)

Die interaktive Installationsroutine führt euch durch alle wichtigen Einstellungen, generiert die Secrets und schreibt eine gültige `.env`:

```bash
git clone https://github.com/securebits-cyber/SentryMail.git
cd SentryMail
./install.sh
```

### Manuell

```bash
git clone https://github.com/securebits-cyber/SentryMail.git
cd SentryMail
cp .env.example .env
# .env ausfüllen: SECRET_KEY, Datenbank, SMTP, INITIAL_ADMIN_*
docker compose up -d
```

Die Datenbank-Migrationen laufen beim Start automatisch. Danach öffnet ihr das Dashboard über die konfigurierte Domain (beziehungsweise `https://localhost`) und meldet euch mit dem in der `.env` gesetzten Initial-Admin an.

## Betriebsarten

`docker compose up -d` startet den **Produktionsbetrieb**: Das Frontend wird gebaut und als statische Dateien ausgeliefert, erreichbar ausschließlich über Caddy. Backend- und Frontend-Ports werden nicht auf dem Host veröffentlicht.

Für die **Entwicklung** kommt zusätzlich `docker-compose.dev.yml` dazu – Vite mit Hot Reload, `uvicorn --reload` und Quelltext als Bind-Mount:

```bash
docker compose -f docker-compose.yml -f docker-compose.dev.yml up -d

# oder dauerhaft in der .env:
#   COMPOSE_FILE=docker-compose.yml:docker-compose.dev.yml
```

<!-- FM:Snippet:Start data:{"id":"Danger","fields":[]} -->
{{< alert type="danger" >}}
**Der Entwicklungs-Stack gehört nicht ins Internet!**

Der Vite-Devserver liefert den gesamten Frontend-Quelltext unauthentifiziert aus und meldet jeden serverseitigen Ladefehler per WebSocket an alle verbundenen Browser – auch Fehler, die ein fremder Portscanner ausgelöst hat. Die Ports 5173/8000 hören deshalb nur auf `127.0.0.1` (`DEV_BIND_ADDRESS`).
{{< /alert >}}
<!-- FM:Snippet:End -->

Auf welchen Netzwerkschnittstellen das Dashboard überhaupt antwortet, steuert ihr über `FRONTEND_BIND_ADDRESS`. Ohne Angabe sind es **alle** – bei einer Maschine mit öffentlicher IP heißt das: offen im Internet. Soll der Zugriff nur über ein VPN laufen, gehört dort die IP des VPN-Interfaces hinein.

<!-- FM:Snippet:Start data:{"id":"Info","fields":[]} -->
{{< alert type="info" >}}
**Hinweis zum Tracking**

Öffnungen und Klicks entstehen nur, wenn die Empfänger die unter `APP_DOMAIN` gesetzte Adresse erreichen können. Da viele Mail-Clients das Öffnungs-Pixel blockieren, sind **Klicks das verlässlichere Signal** als Öffnungsraten.
{{< /alert >}}
<!-- FM:Snippet:End -->

## Konfiguration

Sämtliche Einstellungen kommen aus der `.env` – die [`.env.example`](https://github.com/securebits-cyber/SentryMail/blob/main/.env.example) listet alle Optionen für App, Datenbank, SMTP, OIDC, LDAP, Lizenzierung und Video-Storage. Login-, OIDC-, LDAP-, SMTP- und Sicherheitseinstellungen lassen sich zusätzlich bequem im Dashboard verwalten.

## Editionen: Open Core, Business und Enterprise

Der **Core** ist unter der **Mozilla Public License 2.0 (MPL-2.0)** quelloffen und kostenlos. Ohne Lizenz läuft die Plattform vollständig – ohne Fehlermeldungen und ohne Sperren.

Darüber hinaus gibt es zwei kostenpflichtige Add-ons: **Business** als Jahresabo, gestaffelt nach Mitarbeiterzahl, und **Enterprise** als Upgrade auf Business mit 40 % Aufschlag.

### Business-Add-on

#### Verzeichnisse und Anmeldung
- **LDAP-Verzeichnisimport** mit LDAPS und StartTLS
- **Azure AD / Entra ID** über Microsoft Graph
- **SCIM 2.0** legt Benutzer und Gruppen automatisch an
- **Passkeys** als zweiter Faktor (WebAuthn)

#### Vorlagen und Angriffsarten
- **Vorlagen-Bibliothek** (DHL, Amazon, Microsoft 365, Bank, PayPal, LinkedIn …)
- Passende Landing Page zu jeder Mail-Vorlage
- **`.eml`-Import** echter E-Mails inklusive Anhänge
- **KI-gestützte Erstellung** über eine OpenAI-kompatible Schnittstelle
- **Spear Phishing, Whaling** und dateibasierte Angriffe
- **QR-Code-Phishing (Quishing)** je Empfänger

#### Kampagnen-Tiefe
- Wiederkehrende Kampagnen in festem Intervall
- Mehrstufige Kampagnen mit eigener Vorlage je Stufe

#### Meldeweg
- Meldung verdächtiger Mails mit **Deduplizierung**
- **Mail-Report-Button** für Thunderbird und Outlook
- Melden ohne Konto über ein Melde-Token mit Limits

#### Auswertung und Nachweise
- Passwortabfrage maskiert und verschlüsselt abgelegt
- Executive Report, Trendanalyse und Benutzerentwicklung
- **PDF-Export** mit Logo und Firmendaten
- **Nachweis-Center** (DSGVO, NIS2, ISO 27001, BSI ORP.3, § 38 BSIG)
- **PDF/A-3b** mit eingebetteten Schriften
- **Webhooks** bei jedem Tracking-Ereignis

### Enterprise-Add-on

Enthält alle Business-Funktionen, plus:

#### Darstellung und Automatisierung
- **White-Label** mit App-Name, Akzentfarben und Logo, inklusive Login-Seite
- Automatische und risikoabhängige Kampagnen
- **AI-Scoring** der Human-Risk-Kennzahlen mit priorisierten Maßnahmen
- Enterprise-Reporting mit Schulungsfortschritt und Zertifikatsstatus

#### Anbindung an bestehende Systeme
- **SAML Single Sign-On** (ADFS, Entra ID, Keycloak, Okta …)
- **SIEM-Export** an Splunk HEC, Elasticsearch, Microsoft Sentinel oder JSON

#### Nachweise gegenüber Dritten
- **Zeitstempel eines Dritten nach RFC 3161** auf dem Kopf der Nachweiskette
- Token unverändert gespeichert, extern prüfbar mit `openssl ts -verify`
- Fehlgeschlagener Stempel bleibt als Anker mit Status „failed" erhalten
- **Befristeter Auditoren-Zugang**, lesend und getrennt protokolliert
- Ablaufdatum Pflicht, der Datenschutzmodus gilt weiterhin

#### Schulungsmodul (LMS)
- **Pflichtschulungen mit Videos**, self-hosted (Dateisystem oder S3/MinIO)
- Automatische Kurszuweisung bei niedrigem Awareness-Score
- **Manipulationssicheres Fortschritts-Tracking**
- Verständnis-Quiz, serverseitig bewertet
- Fristen mit Erinnerungen und Eskalation
- **Revisionssichere Schulungsnachweise** als PDF mit Integritäts-Hash
- **SCORM-1.2-Import** (Beta) und **xAPI-1.0.3-Export** an einen Learning Record Store

#### Analyse gemeldeter Mails
- Automatische Auswertung mit **SPF/DKIM/DMARC** und nachvollziehbarem Score
- Entschärfte URLs und Anhang-Hashes
- **Wellen** fassen gleichartige Meldungen zusammen
- Anhang-Prüfung über **ClamAV und YARA-Regeln**
- **MISP-Anreicherung** gegen die eigene Threat-Intel
- Nicht erreichbare Prüfer gelten ausdrücklich als „nicht geprüft"

#### Wirksamkeit der eigenen Abwehr
- **Kontroll-Wirksamkeitstest** – misst, welche Schutzschicht was abfängt
- **Acht Stufen** von Anzeigenamen-Spoofing bis HTML-Smuggling
- Versand ausschließlich an ein eigenes Testpostfach, serverseitig erzwungen
- Bewusst harmlose Nutzlasten – **EICAR statt Schadsoftware**
- **BSI-Zuordnung je Stufe** (APP.5.3.A4, APP.5.3.A5, NET.1.1.A3)

#### Meldepflichten
- **NIS2-Meldeassistent** mit Fristen-Uhr (24 h, 72 h, ein Monat) ab Kenntnis
- **Keine automatische Übermittlung** – das Ergebnis ist ein Entwurf zum Download
- Geführte Checkliste, ausdrücklich ohne Rechtsberatung
- Begründungspflicht in beide Richtungen, auch bei der Entscheidung gegen eine Meldung
- **Paralleler DSGVO-Strang** mit eigener Uhr und eigenem Empfänger (Art. 33)
- Eskalation an benannte Rollen mit Vertretung, genau einmal je Stufe

#### Reaktion
- **Massen-Quarantäne** über Microsoft Graph oder Postfix/Dovecot
- Suche ausschließlich über die Message-ID, Dry Run verpflichtend
- **Es wird nur verschoben, nie gelöscht**

#### Simulationen über weitere Kanäle
- **SMS** über ein generisches HTTP-Gateway
- **Matrix und Nextcloud Talk** als Direktnachricht
- **USB-Drop** ohne Programm oder Skript
- Ausschließlich dienstliche Endgeräte

## Dokumentation

Die vollständige Dokumentation mit Installation, Konfiguration und allen Funktionen findet ihr unter **[docs.sentrymail.de](https://docs.sentrymail.de)**.

Ergänzend gibt es das **[GitHub-Wiki](https://github.com/securebits-cyber/SentryMail/wiki)** mit Artikeln zu [Installation](https://github.com/securebits-cyber/SentryMail/wiki/Installation), [Konfiguration](https://github.com/securebits-cyber/SentryMail/wiki/Konfiguration), [Funktionen](https://github.com/securebits-cyber/SentryMail/wiki/Funktionen), [Schulungsmodul (LMS)](https://github.com/securebits-cyber/SentryMail/wiki/Schulungsmodul-LMS), [Architektur](https://github.com/securebits-cyber/SentryMail/wiki/Architektur) und der [FAQ](https://github.com/securebits-cyber/SentryMail/wiki/FAQ).

Wer den Awareness-Kontext zu **NIS2 und BSI** vertiefen möchte, findet dazu einen [eigenen Wiki-Artikel](https://github.com/securebits-cyber/SentryMail/wiki/NIS2-und-BSI).

## Häufige Fragen zur Phishing-Simulation

### Ist eine Phishing-Simulation im Unternehmen erlaubt?

Ja – aber nur mit Autorisierung. Eine Phishing-Simulation verarbeitet personenbezogene Daten und wird in der Regel als Verhaltens- und Leistungskontrolle eingestuft. Bezieht deshalb **Betriebs- oder Personalrat** frühzeitig ein, klärt die Datenschutzseite und holt eine Freigabe der Geschäftsführung. SentryMail liefert im Ordner `compliance/` eine Muster-Betriebsvereinbarung und eine Datenschutz-Kurzdarstellung mit.

### Was kostet SentryMail?

Der Core ist unter der **Mozilla Public License 2.0 kostenlos** und deckt den kompletten Kampagnen-Zyklus ab. Ohne Lizenz läuft die Plattform ohne Fehlermeldungen und ohne Sperren. Kostenpflichtig sind nur die optionalen Add-ons: **Business** als Jahresabo, gestaffelt nach Mitarbeiterzahl, und **Enterprise** als Upgrade auf Business mit 40 % Aufschlag.

### Welche Daten erfasst eine Phishing-Simulation mit SentryMail?

Erfasst werden Versand, Öffnung, Klick und abgeschickte Formulardaten – jeweils mit Zeitpunkt und über ein Tracking-Token je Empfänger. **Client-Fingerprinting erfolgt ausschließlich nach ausdrücklicher Freigabe.** Dazu kommt ein **Datenschutzmodus**, der Auswertungen auf Einzelpersonen-Ebene sperrt, sowie **k-Anonymität für Gruppenauswertungen** (Standard: 5) und eine Aufbewahrungsfrist mit automatischer Anonymisierung. Da die Plattform selbst gehostet läuft, bleiben alle Daten in eurer eigenen Installation.

### Warum ist die Klickrate aussagekräftiger als die Öffnungsrate?

Weil viele Mail-Clients das Öffnungs-Pixel blockieren. Eine gemessene Öffnungsrate ist dadurch systematisch zu niedrig. **Klicks sind das verlässlichere Signal** für die tatsächliche Anfälligkeit.

### Welche Systemvoraussetzungen hat SentryMail?

Mindestens 2 vCPU, 2 GB RAM und 15 GB SSD auf einem Linux-Host mit Docker Engine ab Version 24 und Docker Compose v2. Empfohlen sind 2–4 vCPU, 4 GB RAM und 20–40 GB SSD.

### Hilft eine Phishing-Simulation bei NIS2?

Sie unterstützt die Nachweisführung. NIS2 (Art. 21) verlangt Schulungen zur Cyberhygiene; eine dokumentierte Phishing-Simulation samt Schulungsnachweis ist dafür ein belastbarer Beleg. Das Nachweis-Center im Business-Add-on erzeugt dazu eigene PDFs für DSGVO (Art. 32), NIS2 (Art. 21) und ISO 27001 (A.6.3). Eine Rechtsberatung ersetzt das nicht.

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "SoftwareApplication",
      "name": "SentryMail",
      "applicationCategory": "SecurityApplication",
      "applicationSubCategory": "Phishing-Simulation und Security-Awareness",
      "operatingSystem": "Linux (Docker)",
      "url": "https://sentrymail.de",
      "softwareHelp": "https://docs.sentrymail.de",
      "license": "https://www.mozilla.org/en-US/MPL/2.0/",
      "isAccessibleForFree": true,
      "author": {
        "@type": "Organization",
        "name": "SecureBits Cyber Security UG"
      },
      "offers": {
        "@type": "Offer",
        "price": "0",
        "priceCurrency": "EUR",
        "description": "Open-Core-Kern unter MPL-2.0 kostenlos; optionale Business- und Enterprise-Add-ons kostenpflichtig."
      }
    },
    {
      "@type": "FAQPage",
      "mainEntity": [
        {
          "@type": "Question",
          "name": "Ist eine Phishing-Simulation im Unternehmen erlaubt?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Ja, aber nur mit Autorisierung. Eine Phishing-Simulation verarbeitet personenbezogene Daten und gilt in der Regel als Verhaltens- und Leistungskontrolle. Betriebs- oder Personalrat sollten früh einbezogen, der Datenschutz geklärt und eine Freigabe der Geschäftsführung eingeholt werden. SentryMail liefert eine Muster-Betriebsvereinbarung und eine Datenschutz-Kurzdarstellung mit."
          }
        },
        {
          "@type": "Question",
          "name": "Was kostet SentryMail?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Der Core ist unter der Mozilla Public License 2.0 kostenlos und deckt den kompletten Kampagnen-Zyklus ab. Ohne Lizenz läuft die Plattform ohne Fehlermeldungen und ohne Sperren. Kostenpflichtig sind nur die optionalen Add-ons: Business als Jahresabo, gestaffelt nach Mitarbeiterzahl, und Enterprise als Upgrade auf Business mit 40 Prozent Aufschlag."
          }
        },
        {
          "@type": "Question",
          "name": "Welche Daten erfasst eine Phishing-Simulation mit SentryMail?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Erfasst werden Versand, Öffnung, Klick und abgeschickte Formulardaten, jeweils mit Zeitpunkt und über ein Tracking-Token je Empfänger. Client-Fingerprinting erfolgt ausschließlich nach ausdrücklicher Freigabe. Dazu kommt ein Datenschutzmodus, der Auswertungen auf Einzelpersonen-Ebene sperrt, k-Anonymität für Gruppenauswertungen mit Standardwert 5 sowie eine Aufbewahrungsfrist mit automatischer Anonymisierung. Da die Plattform selbst gehostet läuft, bleiben alle Daten in der eigenen Installation."
          }
        },
        {
          "@type": "Question",
          "name": "Warum ist die Klickrate aussagekräftiger als die Öffnungsrate?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Viele Mail-Clients blockieren das Öffnungs-Pixel, wodurch die gemessene Öffnungsrate systematisch zu niedrig ausfällt. Klicks sind deshalb das verlässlichere Signal für die tatsächliche Anfälligkeit."
          }
        },
        {
          "@type": "Question",
          "name": "Welche Systemvoraussetzungen hat SentryMail?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Mindestens 2 vCPU, 2 GB RAM und 15 GB SSD auf einem Linux-Host mit Docker Engine ab Version 24 und Docker Compose v2. Empfohlen sind 2 bis 4 vCPU, 4 GB RAM und 20 bis 40 GB SSD."
          }
        },
        {
          "@type": "Question",
          "name": "Hilft eine Phishing-Simulation bei NIS2?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Sie unterstützt die Nachweisführung. NIS2 Artikel 21 verlangt Schulungen zur Cyberhygiene; eine dokumentierte Phishing-Simulation samt Schulungsnachweis ist dafür ein belastbarer Beleg. Das Nachweis-Center im Business-Add-on erzeugt PDFs für DSGVO Art. 32, NIS2 Art. 21 und ISO 27001 A.6.3. Eine Rechtsberatung ersetzt das nicht."
          }
        }
      ]
    }
  ]
}
</script>

## Fazit

Phishing-Awareness lebt davon, dass sie regelmäßig stattfindet und dass die Ergebnisse ehrlich ausgewertet werden. SentryMail bringt beides zusammen – und zwar auf eurer eigenen Infrastruktur, ohne dass Klickverhalten und Personendaten das Haus verlassen.

Wenn ihr eine Awareness-Kampagne plant, schaut euch die Plattform an. Der Open-Core-Kern reicht für den kompletten Kampagnen-Zyklus aus, die Add-ons sind eine Option und keine Voraussetzung.

<!-- FM:Snippet:Start data:{"id":"Vertical Space","fields":[]} -->
{{< vs 3>}}
<!-- FM:Snippet:End -->

## Feedback

---

### Idee für ein neues Feature?

Wenn euch eine Funktion fehlt, könnt ihr sie als [**Feature-Request auf GitHub**](https://github.com/securebits-cyber/SentryMail/issues) vorschlagen.

### Einen Fehler gefunden?

Bugs könnt ihr ebenfalls [**auf GitHub**](https://github.com/securebits-cyber/SentryMail/issues) melden.

### Ein Sicherheitsproblem gefunden?

<!-- FM:Snippet:Start data:{"id":"Danger","fields":[]} -->
{{< alert type="danger" >}}
Wenn ihr Informationen zu Fehlern habt, die die Sicherheit der Plattform betreffen, meldet diese bitte **nicht** öffentlich als Issue, sondern [--> hier über GitHub Security Advisories](https://github.com/securebits-cyber/SentryMail/security/advisories).
{{< /alert >}}
<!-- FM:Snippet:End -->
