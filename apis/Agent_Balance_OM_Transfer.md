# Agent/Balance/OM/Transfer

This method allows for an Agent to transfer eValue from his Orange Money wallet to a Subscribers, Agent or Merchant Orange Money wallet.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Merchant to transfer eValue from his Orange Money wallet to a Subscribers, |

## Endpoint URL

```
TIMM/v1/Agent/Balance/OM/Transfer
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Agent/Balance/OM/Transfer` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Agent/Balance/OM/Transfer` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Payer Phone Number on whose account the money should be deducted. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `PayerPINENC` | `String` | ✅ Required |  |
| `CURRENCY` | `EnumString` | ✅ Required | Identification of Wallet being charged: - USD, LD |
| `AMOUNT` | `Decimal` | ✅ Required | Phone Number on whose account will be charged and notified of the activation. |
| `WALLET` | `EnumString` | ⬜ Optional | Restricted Defines in what Wallet the action should take place: Main or Loyalty Default: Main |
| `RecipentMSISDN` | `String` | ✅ Required | Recipient Phone Number on whose the amount should be transferred to. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `SMSNOTIFICATION` | `String` | ⬜ Optional | SMS to be sent to customer on successful transfer. If parameter not (limit to 160 characters) |
| `EXTERNALID` | `String` | ⬜ Optional | Reference’s to unique id of the caller transaction |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `trxid` | `String` | Transaction ID |
| `intrxid` | `String` | Internal Transaction ID |

## Mock Responses

### POST — Allows for a Merchant to transfer eValue from his Orange Money wallet to a Subscribers,

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "trxid": "CI121313.1121.C00002",
    "intrxid": "CI121313.1121.B12342"
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

### POST — Allows for a Merchant to transfer eValue from his Orange Money wallet to a Subscribers,

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Agent/Balance/OM/Transfer" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "PayerPINENC": "<PayerPINENC>",
    "CURRENCY": "LRD",
    "AMOUNT": 100.0,
    "WALLET": "<WALLET>",
    "RecipentMSISDN": "0777777588",
    "SMSNOTIFICATION": "<SMSNOTIFICATION>",
    "EXTERNALID": "ID-001234"
  }
}'
```
