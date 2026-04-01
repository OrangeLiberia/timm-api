# Merchant/Balance/IN/Transfer

This method allows for a Merchant to transfer eValue from his IN wallet to a Subscribers wallet.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Merchant to transfer eValue from his IN wallet to the corresponding |

## Endpoint URL

```
TIMM/v1/Merchant/Balance/IN/Transfer
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Merchant/Balance/IN/Transfer` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Balance/IN/Transfer` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to transfer the eValue TO. Phone number can have a size of either 10 or 12 digits, according to the following formats:077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `AMOUNT` | `Decimal` | ✅ Required | Phone Number on whose account will be charged and notified of the activation. |
| `CURRENCY` | `EnumString` | ✅ Required | Identification of the Currency being charged: - |
| `WALLET` | `EnumString` | ⬜ Optional | USD Defines in what Wallet the action should take place: Main Default: Main |
| `SMSNOTIFICATION` | `String` | ⬜ Optional | SMS to be sent to customer on successful transfer. If parameter not (limit to 160 characters) |
| `EXTERNALID` | `String` | ⬜ Optional | Reference’s to unique id of the caller transaction |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `trxid` | `String` | Transaction ID |
| `intrxid` | `String` | Internal Transaction ID |

## Mock Responses

### POST — Allows for a Merchant to transfer eValue from his IN wallet to the corresponding

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "trxid": "sample_trxid",
    "intrxid": "sample_intrxid"
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

### POST — Allows for a Merchant to transfer eValue from his IN wallet to the corresponding

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Balance/IN/Transfer" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "AMOUNT": 100.0,
    "CURRENCY": "LRD",
    "WALLET": "<WALLET>",
    "SMSNOTIFICATION": "<SMSNOTIFICATION>",
    "EXTERNALID": "ID-001234"
  }
}'
```
