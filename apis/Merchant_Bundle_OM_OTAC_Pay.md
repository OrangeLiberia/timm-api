# Merchant/Bundle/OM/OTAC/Pay

This method will allow a merchant to purchase a Bundle using his Orange Money account, although requiring an additional over-the-air confirmation code. Before calling this API a call to Merchant/OTAC/Init is required to setup the OTAC.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Add a Bundle to a Subscriber and pay through the OM Wallet |

## Endpoint URL

```
TIMM/v1/Merchant/Bundle/OM/OTAC/Pay
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Merchant/Bundle/OM/OTAC/Pay` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Bundle/OM/OTAC/Pay` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `OTAC` | `String` | ✅ Required | Base64 SHA2 256 Hash of UUID (provided in the OTAC/Init method) concatenated with the PIN provided by the subscriber. BASE64(HASH_SHA2_256(UUID + PIN)) |
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account the Bundle should be activated on. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |
| `Currency` | `EnumString` | ✅ Required | Identification of Wallet being charged: |
| `BundleID` | `String` | ✅ Required | Bundle Identification that should be activated. Bundle list |
| `ExternalID` | `String` | ⬜ Optional | Reference’s to unique id of the caller transaction ( Default will use Internal API Transaction ID if not passed in) |
| `Wallet` | `EnumString` | ⬜ Optional | Restricted Defines in what Wallet the action should take place: Main or Loyalty - USD, LD Default: Main |

## Mock Responses

### POST — Add a Bundle to a Subscriber and pay through the OM Wallet

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "transactionid": "TXN20241107123456",
    "status": "Completed",
    "amount": "100.00",
    "currency": "LRD"
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

### POST — Add a Bundle to a Subscriber and pay through the OM Wallet

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Bundle/OM/OTAC/Pay" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "OTAC": "<OTAC>",
    "MSISDN": "0777777588",
    "Currency": "LRD",
    "BundleID": "ID-001234",
    "ExternalID": "ID-001234",
    "Wallet": "<Wallet>"
  }
}'
```
