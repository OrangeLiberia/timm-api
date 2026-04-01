# Merchant/Balance/OM

This method allows for a Merchant to get the current eValue fror his Orange Money wallet.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Allows for a Merchant to get the current eValue for his Orange Money wallet. |

## Endpoint URL

```
TIMM/v1/Merchant/Balance/OM
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Merchant/Balance/OM` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Balance/OM` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `CURRENCY` | `EnumString` | ✅ Required | Identification of Wallet being queried: - |
| `MERCHPINENC` | `String` | ⬜ Optional | USD, LD Merchant PIN encrypted using public-key cryptography, making use of the certificate of the corresponding platform. (by default, PIN is not required since it’s configured on the authentication session) |
| `WALLET` | `EnumString` | ⬜ Optional | Restricted Defines in what Wallet the action should take place. Main or Loyalty Default: Main |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `type` | `String` | Type of Wallet: Main |
| `currency` | `String` | Currency of the wallet: USD, LD |
| `amount` | `String` | Amount in the wallet Recipients object array |

## Mock Responses

### GET — Allows for a Merchant to get the current eValue for his Orange Money wallet.

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "type": "Standard",
    "currency": "LRD",
    "amount": 100.0
  }
}
```

**Error Response:**
```json
{
  "exec_code": -12,
  "exec_msg": "Authorization failed"
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `100` | Success |
| `200` | Success With Warning |
| `-1003` | API Call is missing a parameter |
| `-1004` | API Call execution failed |
| `-1005` | API Call execution partial failed |
| `-1110` | Invalid PIN |
| `-1111` | Invalid PIN for Technical Wallet |
| `-1115` | API Call parameter is invalid |
| `-1116` | Missing Configurations |
| `-2000` | General Error / Execution Error|

## cURL Examples

### GET — Allows for a Merchant to get the current eValue for his Orange Money wallet.

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Balance/OM?auth:user=api_user&auth:pwd=api_password&param:CURRENCY=LRD&param:MERCHPINENC=<MERCHPINENC>&param:WALLET=<WALLET>"
```
