# Orange Liberia — TIMM API Documentation

> **Version:** 5.8.8 · **Generated:** November 2024 · **Environment:** Orange Liberia

## Overview

This repository contains the full documentation for the **TIMM (Telecom Integration & Merchant Management) API** system — Orange Liberia's REST-based API platform for subscriber management, merchant operations, agent services, and more.

## 🚀 Quick Start

### Interactive Explorer

Open [`api_explorer.html`](https://orangeliberia.github.io/timm-api/api_explorer.html) in any browser to:
- Browse all 221 APIs grouped by category
- Search APIs by name
- Fill in parameters interactively
- Generate `curl` commands instantly
- View success & error responses
- Switch between Production and Dev/Test environments

---

## 📁 Repository Structure

```
├── README.md                     ← This file
├── api_explorer.html             ← 🔥 Interactive API Explorer (open in browser)
├── general/
│   ├── introduction.md           ← System overview
│   ├── service_parameters.md     ← Production & Dev/Test endpoints
│   ├── guidelines.md             ← Calling conventions & best practices
│   ├── authentication.md         ← Auth object documentation
│   ├── webhooks.md               ← Webhooks & callbacks guide
│   ├── sms_subscriber_webhook.md ← SMS & USSD subscriber webhook
│   └── acronyms.md               ← Acronym definitions
└── apis/
    ├── Authenticate_API_Token.md
    ├── PRV_Features_CallerRingBackTone.md
    ├── ... (221 API files total)
```

---

### Environments

| Environment | Base URL |
|-------------|----------|
| **Production** | `https://192.168.19.200:11003` |
| **Dev / Test** | `https://APIDEV.Orange.com.lr` |

### Authentication

Every API call requires authentication credentials, provided via one of these methods:

**JSON body:**
```json
{
  "auth": { "user": "your_username", "pwd": "your_password" }
}
```

**URL query string:**
```
?auth:user=your_username&auth:pwd=your_password
```

**HTTP Basic Authentication** is also supported.

---

## 📚 API Categories

| Category | Description | # APIs |
|----------|-------------|--------|
| `Authenticate` | Token-based authentication | 1 |
| `PRV` | Provisioning — network features, access, packages | 8 |
| `Resource` | SIM and MSISDN status | 2 |
| `COMMON` | Currency utilities | 2 |
| `BlinkSky` | BlinkSky catalog and payment services | 2 |
| `CRM` | Subscriber registration, KYC, management | 24 |
| `Merchant` | Merchant balance, payments, bundles, utilities | 35 |
| `Agent` | Agent operations and services | 20 |
| `Subscriber` | Subscriber self-service operations | 70+ |
| `OrangeMoney` | OM fees, transactions, universal codes | 6 |
| `SIMREG` | SIM registration workflows | 6 |
| `DSTV` | DSTV customer services | 4 |
| `Satcon` | Satcon utilities | 4 |
| `OSE` / `SCHFEES` | School fees and accounts | 8 |
| `JungleEnergy` | JungleEnergy account and payment services | 2 |
| `DSTK` | Subscriber push notifications | 1 |
| `FlyTxt` | Inbound offers | 1 |
| `Poll` | Polling and voting | 4 |
| `Event` | Event ticketing | 8 |
| `System` / `External` | Redirect utilities | 2 |

---

## 📡 cURL Example

```bash
# Get subscriber balance (Dev/Test environment)
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Balance/OM?auth:user=api_user&auth:pwd=api_password&param:msisdn=0777777588"
```

---

## 🔒 Data Encryption

For sensitive data, the system supports **PKCS#7/CMS encryption (RFC 5652)** using the provided public keys for each environment. See `general/service_parameters.md` for public key details.

---

## 📞 Standard Response Format

All APIs return a JSON response with the following base structure:

```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": { ... }
}
```

### Common Error Codes

| Code | Meaning |
|------|---------|
| `100` | Success With Warning |
| `200` | Success |
| `-1000` | System Exception / Body Parse Failed |
| `-1001` | API does not exist |
| `-1002` | Authorization failed |
| `-1003` | API Call is missing a parameter |
| `-100` | Subscriber not found / blocked |
| `-200` | Network Element error |

---

## 🔗 Related Resources

- See `general/guidelines.md` for the `System/Redirect` approach (for environments that don't support HTTP body on GET)
- See `general/webhooks.md` for async callback configuration
- See `general/sms_subscriber_webhook.md` for SMS and USSD subscriber webhook notifications

---

*Documentation auto-generated from TIMM API System Specification v5.8.8 (November 13, 2025)*
