# Merchant/Balance/IN

This method will allow a Merchant to get his current wallet balances on the IN system.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Get Current Amount on a Subscriber Telecom Wallet |

## Endpoint URL

```
TIMM/v1/Merchant/Balance/IN
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Merchant/Balance/IN` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Balance/IN` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `CURRENCY` | `String` | ✅ Required | Identification of Wallet Currency being queried: - |
| `WALLET` | `EnumString` | ⬜ Optional | USD, LD Defines in what Wallet the action should take place: Main Default: Main |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `msisdn` | `String` | Output MSISDN associated with currency account wallets Object[] Output Recipients object array JSON Object Array wallets |
| `type` | `String` | Output Type of Wallet: Main, Bonus, Extra |
| `currency` | `String` | Output Currency of the wallet |
| `amount` | `String` | Output Amount in the wallet |

## Mock Responses

### GET — Get Current Amount on a Subscriber Telecom Wallet

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "msisdn": "0777777588",
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

### GET — Get Current Amount on a Subscriber Telecom Wallet

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Balance/IN?auth:user=api_user&auth:pwd=api_password&param:CURRENCY=LRD&param:WALLET=<WALLET>"
```
