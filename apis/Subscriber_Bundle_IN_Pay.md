# Subscriber/Bundle/IN/Pay

This method will allow’ s to add a bundle to a subscriber, using the DonnorMSISDN IN balance to pay for the Bundle.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Add a Bundle to a Subscriber |

## Endpoint URL

```
TIMM/v1/Subscriber/Bundle/IN/Pay
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Bundle/IN/Pay` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/IN/Pay` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to add the Bundle. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `BundleId` | `String` | ✅ Required | Bundle Identification |
| `RecipentMSISDN` | `String` | ✅ Required | Phone Number that’s gifting the Bundle. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `Wallet` | `String` | ✅ Required | Wallet to use for Payment: Main (optional) BundleNotification Flag |
| `TRXID` | `String` | ✅ Required | (optional) Transaction ID ( Default will use Internal API Transaction ID ) |
| `DATE` | `String` | ✅ Required | (optional) Date of Action ( Default will use the date and time of the call) |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `trxid` | `String` | Output Transaction ID |
| `internal_code` | `String` | Output Internal Transaction ID |

## Mock Responses

### POST — Add a Bundle to a Subscriber

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "trxid": "sample_trxid",
    "internal_code": "CODE001"
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

### POST — Add a Bundle to a Subscriber

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/IN/Pay" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "BundleId": "ID-001234",
    "RecipentMSISDN": "0777777588",
    "Wallet": "<Wallet>",
    "TRXID": "ID-001234",
    "DATE": "2024-11-07"
  }
}'
```
