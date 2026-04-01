# COMMON/Currency/Exchange

This method can be called to return an exchange rate between two currencies.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Returns the exchange rate between two currencies |

## Endpoint URL

```
TIMM/v1/COMMON/Currency/Exchange
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/COMMON/Currency/Exchange` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/COMMON/Currency/Exchange` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `CurrencyOrig` | `String` | ✅ Required | Originating Currency |
| `CurrencyDest` | `String` | ✅ Required | Destination Currency |
| `Value` | `decimal` | ⬜ Optional | Value to consider for Exchange. If not specified value of 1 is assumed |
| `Date` | `String` | ⬜ Optional | Date to obtain the exchange rate. If not specified the current date is used |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `Exchange` | `String` | Exchange rate between Origin Currency Code to Destination Currency Code for the Value and Date |

## Mock Responses

### POST — Returns the exchange rate between two currencies

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "Exchange": "sample_Exchange"
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

### POST — Returns the exchange rate between two currencies

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/COMMON/Currency/Exchange" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "CurrencyOrig": "LRD",
    "CurrencyDest": "LRD",
    "Value": 1.0,
    "Date": "2024-11-07"
  }
}'
```
