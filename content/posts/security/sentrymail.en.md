---
title: "Self-Hosted Phishing Simulation: SentryMail (Open Source)"
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
description: Run phishing simulations on your own server – plan campaigns with SentryMail, track clicks per recipient and make security awareness measurable. Open source.
preview: ../../../assets/images/posts/it-security/sentrymail-control-center.webp
hero: /images/posts/it-security/sentrymail-control-center.webp
images:
  - /images/posts/it-security/sentrymail-control-center.webp
menu:
  sidebar:
    name: Phishing Simulation with SentryMail
    identifier: sentrymail
    parent: security
keywords:
  - phishing simulation
  - open source phishing simulation
  - security awareness training
  - phishing test for employees
  - sentrymail
  - self-hosted phishing platform
  - nis2 awareness
---

## Phishing simulation: why the most vulnerable part sits in front of the screen

A **phishing simulation** is the only reliable way to find out how susceptible your organization really is to social engineering. A [firewall can be hardened](/en/posts/security/wie-funktioniert-eine-firewall/), systems can be patched and password policies enforced – but most successful attacks don't break technology, they convince a person. A well-crafted phishing email doesn't need a zero-day; it just needs one click made under time pressure.

That is exactly why **security awareness** is no longer a nice-to-have but a fixed part of every security concept – just as much a given as protection against [man-in-the-middle attacks](/en/posts/security/man-in-the-middle/) or [network sniffing](/en/posts/security/was-ist-sniffing/). And awareness works best when it is **measurable**: who clicks on what? Where does someone enter credentials? Which department needs training – and which one doesn't?

In this article I want to introduce **SentryMail** for exactly that job: a self-hosted open source platform that lets you plan, send and evaluate simulated phishing campaigns per recipient – without your employee data ever leaving the building.

<!-- FM:Snippet:Start data:{"id":"Vertical Space","fields":[]} -->
{{< vs 3>}}
<!-- FM:Snippet:End -->

![SentryMail control center: dashboard of a phishing simulation showing risk score, funnel and a timeline of opens and clicks](/images/posts/it-security/sentrymail-control-center.webp)

## What is SentryMail?

SentryMail helps organizations shrink their **human attack surface**. You run realistic phishing simulations, track opens, clicks and form submissions, and turn the results into targeted awareness training.

The key point: the platform runs **entirely on your own infrastructure**. No cloud service where your employees' names and click behaviour end up on someone else's servers. All environment-specific values – domain, identity provider, SMTP – come from configuration; nothing is hard-coded.

<!-- FM:Snippet:Start data:{"id":"Warning","fields":[]} -->
{{< alert type="warning" >}}
**Important – only use with authorization**

Phishing simulations are a tool for **authorized** awareness training within your own organization. Sort out the legal side first: involve the works council, check data protection requirements and get management on board.

SentryMail ships templates for a **works agreement** and a **privacy notice** as part of the free core – not as a paid add-on package.
{{< /alert >}}
<!-- FM:Snippet:End -->

## Feature scope of the free core

The complete campaign cycle is already in the open source core – from creating the template to the audit-proof record. None of it is tied to a license.

### Templates

- **HTML or Markdown editor** with live preview
- Personalization variables in subject, HTML and text
- Preview with sample data
- Attachments added manually and sent with the campaign

### Recipient groups

- Reusable lists with **position, department and criticality**
- Populate via manual entry or **CSV**
- Flagging of **management bodies (§ 38 BSIG)**

### Sending profiles

- SMTP profiles with sender identity and test mail
- **Provider-independent** (IONOS, Hetzner, Mailgun, SES, Postmark and others)
- Global fallback SMTP without a dedicated profile

### Delivery

The point where most phishing simulations fail – the mail never arrives in the first place:

- **Allowlisting generator** for Exchange Online, Postfix, Proofpoint, Sophos and Barracuda
- **Delivery self-test** via the exact path the campaign will take
- Delivery diagnostics with **per-recipient SMTP status codes**
- Greylisting detection from three temporary rejections onwards
- **SPF, DMARC and duplicate record checks**
- Explicitly a delivery analysis, not a people analysis

### Landing pages

- Target pages as HTML or Markdown
- Data capture, credential harvesting and redirect
- Forms automatically rewired to the tracking URL

### Campaigns

- Assistant combining template, sending profile, landing page and groups
- Optional scheduling
- Re-run for incompletely delivered campaigns

### Campaign preflight

A safety net you rarely get in this form:

- **Mandatory dialog before every launch** with recipient count, timing and findings
- **Quiet hours, blackout windows and a per-person cooldown** (default: 30 days)
- Time zone per instance as an IANA name, UTC by default
- Risk class of the lure topic, maintained on the template
- **Four-eyes approval for high risk** – enforced in the database, not just in the UI
- Group exclusions in the dialog, effective at send time

### Tracking and results

- **Per-recipient tracking token** in links and pixel
- Send, open, click and form data with timestamps
- Per-campaign results page with **CSV export**
- **Control-center dashboard** with risk score (0–100, traffic light)
- **Human Risk Management** across all campaigns
- Management report with campaign comparison

### Users and roles

- Roles: **administrator, data protection officer and user**
- Local login and optional **OIDC/SSO** (Authentik, Keycloak, Entra ID, Okta)
- **Two-factor authentication** via app or email code, plus backup codes
- 2FA enforceable for everyone or administrators only
- Audit log of logins and system changes

### Chain of evidence

- **Hash chaining of every audit entry** (SHA-256, gapless position)
- Chain status in the dashboard – a break is named with its position
- **Evidence package as ZIP** with manifest and bilingual verification guide
- **Standalone verifier** – a single file, standard library only
- Separate retention period for audit content, chaining kept as a tombstone
- Access for administrators and the data protection officer

### Privacy and co-determination

Exactly the part that gets a phishing simulation past co-determination in the first place:

- **Privacy mode** blocks individual-level evaluations
- **k-anonymity for group evaluations** (default: 5)
- Four-eyes approval for temporary lifting
- Retention period with automatic anonymization
- **Client fingerprinting only after explicit opt-in**
- Templates for works agreement and privacy notice

### Operations

- **Docker Compose** (rootless, hardened) with Caddy and automatic TLS
- PostgreSQL and Redis – all data stays in your own installation
- German and English, light and dark mode

## The tech stack

| Layer | Technology |
|---|---|
| Backend | FastAPI · SQLAlchemy · Alembic |
| Frontend | React · Vite · TypeScript · Tailwind CSS |
| Database / cache | PostgreSQL · Redis |
| Proxy / TLS | Caddy |
| Operations | Docker Compose (rootless, hardened) |

Caddy routes `/api/*` and the public tracking endpoints `/track/*` to the backend, and everything else to the frontend.

## System requirements

SentryMail runs as a Docker Compose stack on a single host. The values below are guidelines – requirements grow with the number of recipients, concurrent usage and optional extras such as PDF reports or AI features.

| Resource | Minimum | Recommended |
|---|---|---|
| CPU | 2 vCPU | 2–4 vCPU |
| RAM | 2 GB | 4 GB |
| Disk | 15 GB SSD | 20–40 GB SSD |
| OS | Linux (x86-64 or ARM64) with Docker Engine (≥ 24) + Docker Compose v2 | same |

A few notes on this:

- **Docker Compose v2** means the current, integrated `docker compose` plugin, not the discontinued legacy `docker-compose` v1. You can check with `docker compose version`.
- The **minimum** is enough for smaller organizations with up to a few hundred recipients and occasional campaigns.
- An **SSD** is recommended for the database – tracking events grow with every campaign.
- On the network side you need outbound SMTP access for delivery, and the `APP_DOMAIN` must be reachable by your target group, otherwise tracking won't work.

## Installation

### Guided (recommended)

The interactive installer walks you through all the important settings, generates the secrets and writes a valid `.env`:

```bash
git clone https://github.com/securebits-cyber/SentryMail.git
cd SentryMail
./install.sh
```

### Manual

```bash
git clone https://github.com/securebits-cyber/SentryMail.git
cd SentryMail
cp .env.example .env
# fill in .env: SECRET_KEY, database, SMTP, INITIAL_ADMIN_*
docker compose up -d
```

Database migrations run automatically on startup. After that, open the dashboard at your configured domain (or `https://localhost`) and log in with the initial admin account set in the `.env`.

## Operating modes

`docker compose up -d` starts **production mode**: the frontend is built and served as static files, reachable exclusively through Caddy. Backend and frontend ports are not published on the host.

For **development**, add `docker-compose.dev.yml` – Vite with hot reload, `uvicorn --reload` and the source tree as a bind mount:

```bash
docker compose -f docker-compose.yml -f docker-compose.dev.yml up -d

# or permanently in your .env:
#   COMPOSE_FILE=docker-compose.yml:docker-compose.dev.yml
```

<!-- FM:Snippet:Start data:{"id":"Danger","fields":[]} -->
{{< alert type="danger" >}}
**The development stack does not belong on the internet!**

The Vite dev server serves the entire frontend source unauthenticated and reports every server-side load error over WebSocket to all connected browsers – including errors triggered by a stranger's port scanner. That is why ports 5173/8000 only listen on `127.0.0.1` (`DEV_BIND_ADDRESS`).
{{< /alert >}}
<!-- FM:Snippet:End -->

Which network interfaces the dashboard responds on at all is controlled by `FRONTEND_BIND_ADDRESS`. Without a value it is **all of them** – on a machine with a public IP, that means open to the internet. If access should only go through a VPN, put the IP of the VPN interface there.

<!-- FM:Snippet:Start data:{"id":"Info","fields":[]} -->
{{< alert type="info" >}}
**A note on tracking**

Opens and clicks are only recorded if recipients can reach the address configured as `APP_DOMAIN`. Since many mail clients block the tracking pixel, **clicks are the more reliable signal** than open rates.
{{< /alert >}}
<!-- FM:Snippet:End -->

## Configuration

All settings come from the `.env` – see [`.env.example`](https://github.com/securebits-cyber/SentryMail/blob/main/.env.example) for every option covering app, database, SMTP, OIDC, LDAP, licensing and video storage. Login, OIDC, LDAP, SMTP and security settings can additionally be managed from the dashboard.

## Editions: open core, Business and Enterprise

The **core** is open source under the **Mozilla Public License 2.0 (MPL-2.0)** and free. Without a license the platform runs in full – no errors, no lockouts.

On top of that there are two paid add-ons: **Business** as an annual subscription tiered by headcount, and **Enterprise** as an upgrade on Business with a 40 % surcharge.

### Business add-on

#### Directories and sign-in
- **LDAP directory import** with LDAPS and StartTLS
- **Azure AD / Entra ID** via Microsoft Graph
- **SCIM 2.0** provisions users and groups automatically
- **Passkeys** as a second factor (WebAuthn)

#### Templates and attack types
- **Template library** (DHL, Amazon, Microsoft 365, bank, PayPal, LinkedIn …)
- Matching landing page for every mail template
- **`.eml` import** of real emails including attachments
- **AI-assisted creation** via an OpenAI-compatible interface
- **Spear phishing, whaling** and file-based attacks
- **QR code phishing (quishing)** per recipient

#### Campaign depth
- Recurring campaigns at a fixed interval
- Multi-stage campaigns with a template per stage

#### Reporting channel
- Reporting of suspicious mails with **deduplication**
- **Mail report button** for Thunderbird and Outlook
- Report without an account via a reporting token with limits

#### Analysis and records
- Credential capture masked and encrypted
- Executive report, trend analysis and user development
- **PDF export** with logo and company details
- **Compliance center** (GDPR, NIS2, ISO 27001, BSI ORP.3, § 38 BSIG)
- **PDF/A-3b** with embedded fonts
- **Webhooks** on every tracking event

### Enterprise add-on

Includes all Business features, plus:

#### Branding and automation
- **White-label** with app name, accent colors and logo, including the login page
- Automated and risk-based campaigns
- **AI scoring** of human-risk metrics with prioritized actions
- Enterprise reporting with training progress and certificate status

#### Integration with existing systems
- **SAML single sign-on** (ADFS, Entra ID, Keycloak, Okta …)
- **SIEM export** to Splunk HEC, Elasticsearch, Microsoft Sentinel or JSON

#### Evidence for third parties
- **Third-party RFC 3161 timestamp** on the head of the chain of evidence
- Token stored verbatim, verifiable externally with `openssl ts -verify`
- A failed stamp is kept as an anchor with status "failed"
- **Time-limited auditor access**, read-only and logged separately
- Mandatory expiry date, privacy mode still applies

#### Training module (LMS)
- **Mandatory video training**, self-hosted (file system or S3/MinIO)
- Automatic course assignment on low awareness scores
- **Tamper-proof progress tracking**
- Comprehension quiz, graded server-side
- Deadlines with reminders and escalation
- **Audit-proof training records** as PDF with integrity hash
- **SCORM 1.2 import** (beta) and **xAPI 1.0.3 export** to a Learning Record Store

#### Analysis of reported mails
- Automatic analysis with **SPF/DKIM/DMARC** and an explainable score
- Defanged URLs and attachment hashes
- **Waves** group similar reports together
- Attachment scanning via **ClamAV and YARA rules**
- **MISP enrichment** against your own threat intel
- Unreachable scanners explicitly count as "not scanned"

#### Effectiveness of your own defenses
- **Control effectiveness test** – measures which layer catches what
- **Eight stages** from display-name spoofing to HTML smuggling
- Sent to your own test mailbox only, enforced server-side
- Deliberately harmless payloads – **EICAR instead of malware**
- **BSI mapping per stage** (APP.5.3.A4, APP.5.3.A5, NET.1.1.A3)

#### Reporting obligations
- **NIS2 reporting assistant** with a deadline clock (24 h, 72 h, one month)
- **No automatic transmission** – the output is a draft to download
- Guided checklist, explicitly no legal advice
- Justification required both ways, including the decision not to report
- **Parallel GDPR track** with its own clock and recipient (Art. 33)
- Escalation to named roles with deputies, exactly once per stage

#### Response
- **Bulk quarantine** via Microsoft Graph or Postfix/Dovecot
- Search by Message-ID only, dry run mandatory
- **Only moved, never deleted**

#### Simulations across more channels
- **SMS** via a generic HTTP gateway
- **Matrix and Nextcloud Talk** as direct messages
- **USB drop** without any program or script
- Corporate devices only

## Documentation

The full documentation covering installation, configuration and all features is available at **[docs.sentrymail.de](https://docs.sentrymail.de)**.

In addition, the **[GitHub wiki](https://github.com/securebits-cyber/SentryMail/wiki)** has articles on [installation](https://github.com/securebits-cyber/SentryMail/wiki/Installation), [configuration](https://github.com/securebits-cyber/SentryMail/wiki/Konfiguration), [features](https://github.com/securebits-cyber/SentryMail/wiki/Funktionen), the [training module (LMS)](https://github.com/securebits-cyber/SentryMail/wiki/Schulungsmodul-LMS), [architecture](https://github.com/securebits-cyber/SentryMail/wiki/Architektur) and the [FAQ](https://github.com/securebits-cyber/SentryMail/wiki/FAQ).

If you want to dig into the awareness context around **NIS2 and the German BSI**, there is a [dedicated wiki article](https://github.com/securebits-cyber/SentryMail/wiki/NIS2-und-BSI) on it.

## Frequently asked questions about phishing simulations

### Are phishing simulations of your own employees legal?

Yes – but only with authorization. A phishing simulation processes personal data and is usually classified as monitoring of behaviour and performance. So involve the **works council** early, clarify the data protection side and obtain sign-off from management. SentryMail ships templates for a works agreement and a privacy notice as part of the free core.

### How much does SentryMail cost?

The core is **free under the Mozilla Public License 2.0** and covers the complete campaign cycle. Without a license the platform runs with no errors and no lockouts. Only the optional add-ons are paid: **Business** as an annual subscription tiered by headcount, and **Enterprise** as an upgrade on Business with a 40 % surcharge.

### What data does a phishing simulation with SentryMail collect?

Sends, opens, clicks and submitted form data – each with a timestamp and via a per-recipient tracking token. **Client fingerprinting only happens after an explicit opt-in.** On top of that there is a **privacy mode** that blocks individual-level evaluations, **k-anonymity for group evaluations** (default: 5) and a retention period with automatic anonymization. Since the platform is self-hosted, all of this data stays in your own installation.

### Why is the click rate more meaningful than the open rate?

Because many mail clients block the tracking pixel, which makes a measured open rate systematically too low. **Clicks are the more reliable signal** for actual susceptibility.

### What are the system requirements for SentryMail?

At least 2 vCPU, 2 GB RAM and 15 GB SSD on a Linux host with Docker Engine 24 or newer and Docker Compose v2. Recommended are 2–4 vCPU, 4 GB RAM and 20–40 GB SSD.

### Do phishing simulations help with NIS2?

They support your evidence trail. NIS2 (Art. 21) requires cyber hygiene training, and a documented phishing simulation together with training records is solid proof of that. The compliance center in the Business add-on produces dedicated PDFs for GDPR (Art. 32), NIS2 (Art. 21) and ISO 27001 (A.6.3). This does not replace legal advice.

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "SoftwareApplication",
      "name": "SentryMail",
      "applicationCategory": "SecurityApplication",
      "applicationSubCategory": "Phishing simulation and security awareness",
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
        "description": "Open core under MPL-2.0 is free; optional Business and Enterprise add-ons are paid."
      }
    },
    {
      "@type": "FAQPage",
      "mainEntity": [
        {
          "@type": "Question",
          "name": "Are phishing simulations of your own employees legal?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Yes, but only with authorization. A phishing simulation processes personal data and is usually classified as monitoring of behaviour and performance. The works council should be involved early, the data protection side clarified and sign-off obtained from management. SentryMail ships templates for a works agreement and a privacy notice as part of the free core."
          }
        },
        {
          "@type": "Question",
          "name": "How much does SentryMail cost?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "The core is free under the Mozilla Public License 2.0 and covers the complete campaign cycle. Without a license the platform runs with no errors and no lockouts. Only the optional add-ons are paid: Business as an annual subscription tiered by headcount, and Enterprise as an upgrade on Business with a 40 percent surcharge."
          }
        },
        {
          "@type": "Question",
          "name": "What data does a phishing simulation with SentryMail collect?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Sends, opens, clicks and submitted form data, each with a timestamp and via a per-recipient tracking token. Client fingerprinting only happens after an explicit opt-in. There is also a privacy mode that blocks individual-level evaluations, k-anonymity for group evaluations with a default of 5, and a retention period with automatic anonymization. Since the platform is self-hosted, all data stays in your own installation."
          }
        },
        {
          "@type": "Question",
          "name": "Why is the click rate more meaningful than the open rate?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Many mail clients block the tracking pixel, which makes a measured open rate systematically too low. Clicks are therefore the more reliable signal for actual susceptibility."
          }
        },
        {
          "@type": "Question",
          "name": "What are the system requirements for SentryMail?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "At least 2 vCPU, 2 GB RAM and 15 GB SSD on a Linux host with Docker Engine 24 or newer and Docker Compose v2. Recommended are 2 to 4 vCPU, 4 GB RAM and 20 to 40 GB SSD."
          }
        },
        {
          "@type": "Question",
          "name": "Do phishing simulations help with NIS2?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "They support your evidence trail. NIS2 Article 21 requires cyber hygiene training, and a documented phishing simulation together with training records is solid proof of that. The compliance center in the Business add-on produces dedicated PDFs for GDPR Art. 32, NIS2 Art. 21 and ISO 27001 A.6.3. This does not replace legal advice."
          }
        }
      ]
    }
  ]
}
</script>

## Conclusion

Phishing awareness only works if it happens regularly and if the results are evaluated honestly. SentryMail brings both together – on your own infrastructure, without click behaviour and personal data ever leaving the building.

If you are planning an awareness campaign, take a look at the platform. The free core covers the complete campaign cycle; the add-ons are an option, not a prerequisite.

<!-- FM:Snippet:Start data:{"id":"Vertical Space","fields":[]} -->
{{< vs 3>}}
<!-- FM:Snippet:End -->

## Feedback

---

### An idea for a new feature?

If you think a feature is missing, you can suggest it as a [**feature request on GitHub**](https://github.com/securebits-cyber/SentryMail/issues).

### Found a bug?

You can report bugs [**on GitHub**](https://github.com/securebits-cyber/SentryMail/issues) as well.

### Found a security issue?

<!-- FM:Snippet:Start data:{"id":"Danger","fields":[]} -->
{{< alert type="danger" >}}
If you have information about bugs that affect the security of the platform, please do **not** post them publicly as an issue – report them [--> here via GitHub Security Advisories](https://github.com/securebits-cyber/SentryMail/security/advisories).
{{< /alert >}}
<!-- FM:Snippet:End -->
